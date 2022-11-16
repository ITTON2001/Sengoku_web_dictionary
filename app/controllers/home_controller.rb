class HomeController < ApplicationController
  before_action:authenticate_user,{only:[:index,:show,:top]}

  def top
  end

  def about
  end

  #マップ名一覧
  def index
    @ezomaps = Map.where(id: 1)
    @touhokumaps = Map.where(id: 11..17)
    @kantomaps = Map.where(id: 18..25)
    @hokurikumaps = Map.where(id: 26..32)
    @cyubumaps = Map.where(id: 33..41)
    @kinkimaps = Map.where(id: 42..56)
    @cyugokumaps = Map.where(id: 57..68)
    @shikokumaps = Map.where(id: 69..72)
    @kyusyumaps = Map.where(id: 73..83)
    @ryukyumaps = Map.where(id: 84)

    @maps = Map.all
  end

  #マップ名を表示
  def show
    @map_name = params[:map_name]
  end
end
