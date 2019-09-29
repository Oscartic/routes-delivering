class RoutesController < ApplicationController
  def index
    @routes = Route.all.order(:starts_at)
  end

  def new
    @route = Route.new
  end

  def show
  end

  def create
    @route = Route.new(route_params)
    binding.pry
    #@route.starts_at = params[:route][:starts_at].strftime("%Y-%m-%d %H:%M:%S")
    #@route.ends_at = params[:route][:ends_at].strftime("%Y-%m-%d %H:%M:%S")
    @route = Route.new(route_params)
    respond_to do |format|
      if @route.save
        format.html { redirect_to @route, notice: 'Category was successfully created.' }
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
    params.require(:route).permit(:starts_at, :ends_at, :load_sum, :load_id, :int_array, :stops_amount, :is_completed)
  end

end
