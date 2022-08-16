class MapsController < ApplicationController
  def show
    @map_name = params[:map_name]
    @map = Map.find_by(id: params[:id])
  end
end
