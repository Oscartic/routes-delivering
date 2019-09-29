class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy]
  def index
    @drivers = Driver.all.order(:id)
  end

  def new
    @driver = Driver.new
  end

  def show
  end

  def create
    @driver = Driver.new(driver_params)
    respond_to do |format|
      if @driver.save
        format.html { redirect_to @driver, notice: 'Driver was successfully created.' }
        format.json { render :show, status: :created, location: @driver }
        format.js
      else
        format.html { render :new }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
        format.js { render :new }
      end
    end

  end

  def edit
  end

  def update
    respond_to do |format|
      if @driver.update(driver_params)
        format.html { redirect_to @driver, notice: 'Driver was successfully updated.' }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
        format.js { render :edit }
      end
    end
  end

  def destroy
  end

  private

  def set_driver
    @driver = Driver.find(params[:id])
  end

  def driver_params
    params.require(:driver).permit(:name, :last_name, :phone, :email, :vehicle_id)
  end
end
