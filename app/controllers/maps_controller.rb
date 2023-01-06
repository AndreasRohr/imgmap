class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy]

  def index
    @maps = Map.all
  end

  def show
  end

  def new
    @map = Map.new
  end

  def edit
  end

  def create
    @map = Map.new(map_params)
    if @map.save
      redirect_to @map
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @map.update(map_params)
      redirect_to @map, notice: 'Map was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @map = Map.find(params[:id])
    @map.destroy
    redirect_to maps_path
  end

  private
  def set_map
    @map = Map.find(params[:id])
  end

  def map_params
    params.require(:map).permit(:title, :lat, :lng, :zoom)
  end
end