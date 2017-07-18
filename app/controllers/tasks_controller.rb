class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :user_signed_in
  layout '_modal', only: [:new, :edit]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end


  # GET /tasks/new
  def new
    @task = Task.new
    if params[:backlog]
      @task.backlogitem = Backlogitem.find(params[:backlog])
      @project_id = @task.backlogitem.project_id
      if (@task.backlogitem.sprint)
        @task.sprint = Sprint.find(@task.backlogitem.sprint.id)
      end
    end
    @task.author = current_user.id

    if params[:returnUrl]
      @returnUrl = params[:returnUrl]
    else
      @returnUrl = board_index_path(:project => @project_id, :sprint => 'All')
    end
  end

  # GET /tasks/1/edit
  def edit
    @project_id = @task.backlogitem.project_id
    @users = User.all

    if params[:returnUrl]
      @returnUrl = params[:returnUrl]
    else
      @returnUrl = board_index_path(:project => @project_id, :sprint => 'All')
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.backlogitem = Backlogitem.where(id: @task.backlogitem_id).first!

    if params[:returnUrl]
      @returnUrl = params[:returnUrl]
    else
      @returnUrl = board_index_path(:project => @task.backlogitem.project_id, :sprint => 'All')
    end

    respond_to do |format|
      if @task.save
        format.html {redirect_to @returnUrl, notice: 'Task was successfully created.'}
        format.json {render :show, status: :created, location: @task}
      else
        format.html {redirect_to @returnUrl, alert: @task.errors}
        format.json {render json: @task.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    if params[:returnUrl]
      @returnUrl = params[:returnUrl]
    else
      @returnUrl = board_index_path(:project => @task.backlogitem.project_id, :sprint => 'All')
    end

    respond_to do |format|
      if @task.update(task_params)
        format.html {redirect_to @returnUrl, notice: 'Task was successfully updated.'}
        format.json {render :show, status: :ok, location: @task}
      else
        format.html {redirect_to @returnUrl, alert: @task.errors}
        format.json {render json: @task.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html {redirect_to tasks_url, notice: 'Task was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:title, :description, :author, :creationdate, :assignedto, :state, :priority, :remainingwork, :effort, :backlogitem_id, :sprint_id)
  end

  def user_signed_in
    if !user_signed_in?
      redirect_to protected_index_path
    end
  end
end
