class EditsController < ApplicationController

  #新しく編集する
  def new
    @edit = Edit.new
    @edit.post_id = params[:id]
  end

  #編集したものをdbに登録
  def create
    @edit = Edit.new(
      edit_text: params[:edit_text],
      editer_name: @current_user.name,
      editer_id:  @current_user.id,
      post_id: params[:post_id]
    )
    @edit.save
    flash[:success] = "投稿を編集しました"
    redirect_to ("/posts/#{params[:post_id]}")
  end

  #編集したものを表示
  def show
    @edits = Edit.all
    @edit = Edit.find_by(id: params[:id])
  end
end
