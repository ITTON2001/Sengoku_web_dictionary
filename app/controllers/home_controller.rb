class HomeController < ApplicationController
  before_action:authenticate_user,{only:[:index,:show,:top]}

  def top
  end

  def about
  end

  def index
    @maps = Map.all
  end

  def show
    @map_name = params[:map_name]
  end
end
