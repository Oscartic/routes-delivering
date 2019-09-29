class RoutesController < ApplicationController
  def index
    @routes = Route.all.order(:starts_at).includes(:driver, :vehicle)
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
    load = params[:route][:load_id].to_i
    if Service.route_and_services_is_a_equal_load(services_in_route, load)
      @route.int_array = params[:route][:int_array]
      driver = Driver.where(vehicle_id: nil).first
      vehicle = Vehicle.where(driver_id: nil, load_id: @route.load).first
      @route.driver = driver
      @route.vehicle = vehicle
      @route.stops_amount = services_in_route.length

      # vehicles = Vehicle.where(vehicle_id: nil, load_id: load)
      # vehicles_schedule = Route.all.map{|vehicle| vehicle.id }
      # if vehicles.present?
      #   return vehicles
      # else
      #   vehicles_schedule
      # end

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
