class BoardController < ApplicationController
  before_action :user_signed_in

  # GET /board
  # GET /board.json
  def index
    if params[:project]
      @project = Project.find(params[:project])
      @items = Backlogitem.left_joins(:tasks).distinct.where(project_id: params[:project])
    end
  end


  private
  def user_signed_in
    if !user_signed_in?
      redirect_to protected_index_path
    end
  end
end
