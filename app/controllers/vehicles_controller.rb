class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  def index
    @vehicles = Vehicle.all.includes(:driver, :load)
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
        format.js
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
        format.js
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  def destroy
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:load_id, :driver_id, :capacity, :vehicle_patent)
  end

end
