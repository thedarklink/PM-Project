class BoardController < ApplicationController

  # GET /board
  # GET /board.json
  def index
    if params[:project]
      @project = Project.find(params[:project])
      @items = Backlogitem.left_joins(:tasks).distinct.where(project_id: params[:project])

    end
  end
end
