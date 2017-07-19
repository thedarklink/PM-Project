class BoardController < ApplicationController
  before_action :user_signed_in

  # GET /board
  # GET /board.json
  def index
    if params[:project]
      @project = Project.find(params[:project])
      @sprints = Sprint.where(project_id: params[:project]).order(:id)

      @sprint_id = params[:sprint]
      if params[:sprint] == 'All'
        @items = Backlogitem.left_joins(:tasks).distinct
                     .where(project_id: params[:project])
                     .order(:created_at)

      else
        @items = Backlogitem.left_joins(:tasks).distinct
                     .where(project_id: params[:project])
                     .where(sprint_id: params[:sprint])
                     .order(:created_at)
      end

    end
  end


  private
  def user_signed_in
    if !user_signed_in?
      redirect_to protected_index_path
    end
  end
end
