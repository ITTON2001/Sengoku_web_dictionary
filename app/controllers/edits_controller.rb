class EditsController < ApplicationController

  def new
    @edit = Edit.new

    @edit.post_id = params[:id]
  end

  def create
    @edit = Edit.new(
      edit_text: params[:edit_text],
      editer_name: @current_user.name,
      editer_id:  @current_user.id,
      post_id: params[:post_id]
    )
    @edit.save
    flash[:success] = "投稿を編集しました"
    redirect_to ("/")
  end

  def show
    @edits = Edit.all
    @edit = Edit.find_by(id: params[:id])
  end
end
