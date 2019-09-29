class RoutesController < ApplicationController
  def index
    @routes = Route.all.order(:starts_at)
  end

  def new
    @route = Route.new
    no_route = Service.where(route_id: nil).map{ |service| service.commune_id }
    @Communes = Commune.where(id: no_route)
    @services_without_route = Service.where(route_id: nil)

  end

  def show
  end

  def create
    @route = Route.new(route_params)
    @route.int_array = params[:route][:int_array]
    binding.pry
    driver = Driver.where(vehicle_id: nil).first
    vehicle = Vehicle.where(driver_id: nil, load_id: @route.load).first
    @route.driver = driver
    @route.vehicle = vehicle
    params[:route][:services_array]
    params[:route][:load_id]
    #@route.starts_at = params[:route][:starts_at].strftime("%Y-%m-%d %H:%M:%S")
    #@route.ends_at = params[:route][:ends_at].strftime("%Y-%m-%d %H:%M:%S")
    respond_to do |format|
      if @route.save
        format.html { redirect_to routes_path, notice: 'Route was successfully created.' }
        format.json { render :show, status: :created, location: @route }
      else
        format.html { render :new }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
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
