class RoutesController < ApplicationController
  def index
    @routes = Route.all.order(:starts_at).includes(:driver, :vehicle, :load)
  end

  def new
    @route = Route.new
    no_route = Service.where(route_id: nil).map{ |service| service.commune_id }
    @Communes = Commune.where(id: no_route)
    @services_without_route = Service.where(route_id: nil).includes(:commune, :load)

  end

  def show
  end

  def create
    @route = Route.new(route_params)
    services_in_route = params[:route][:services_array]
    communes = Commune.get_communes_ids(services_in_route)
    load = params[:route][:load_id].to_i
    starts_at = params[:route][:starts_at].in_time_zone("Santiago")
    ends_at = params[:route][:ends_at].in_time_zone("Santiago")

    if Service.route_and_services_is_a_equal_load(services_in_route, load)
      @route.starts_at = starts_at
      @route.ends_at = ends_at
      @route.int_array = communes
      @route.stops_amount = services_in_route.length

      @set_driver = Driver.where(vehicle_id: nil).first
      @set_vehicle = Vehicle.where(driver_id: nil, load_id: @route.load).first

      if @set_driver.present? && @set_vehicle.present?
        @route.driver = @set_driver
        @route.vehicle = @set_vehicle
      else
        Vehicle.all.each do |vehicle|
          if vehicle.routes.present? && vehicle.routes.last.ends_at < ends_at && vehicle.load_id === load
            @route.vehicle = vehicle
            @route.driver = vehicle.driver
            break
          end
        end
      end

      if @route.vehicle.nil? || @route.driver.nil?
        redirect_to new_route_path(@route, @services_without_route), alert: 'No Quedan conductores ni vehiculos disponibles para hoy.'
      end

      respond_to do |format|
        if @route.save
          Service.assigned_route_to_services(services_in_route, @route)
          Driver.assign_vehicle_to_driver(@route.driver, @route.vehicle)
          format.html { redirect_to routes_path, notice: 'Route was successfully created.' }
          format.json { render :show, status: :created, location: @route }
        else
          format.html { render :new }
          format.json { render json: @route.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to new_route_path(@route, @services_without_route), alert: 'El tipo de trasporte deber ser igual al de los despachos (General o Refrigerado)'
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:starts_at,
                                  :ends_at,
                                  :load_sum,
                                  :load_id,
                                  :int_array,
                                  :services_array,
                                  :stops_amount,
                                  :is_completed
                                  )
  end

end
