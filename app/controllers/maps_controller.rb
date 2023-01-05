class MapsController < ApplicationController
  def index
    @model_data = Map.all
  end
end
