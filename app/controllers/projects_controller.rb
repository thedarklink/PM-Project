class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :user_signed_in


  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @tasksAllCount = @project.backlogitems.left_joins(:tasks).select(:tasks).count
    @tasksDoneCount = @project.backlogitems.left_joins(:tasks)
                          .where(tasks: {state: Task.states[:Done]})
                          .select(:tasks)
                          .count
    @tasksInProgressCount = @project.backlogitems.left_joins(:tasks)
                                .where(tasks: {state: Task.states[:InProgress]})
                                .select(:tasks)
                                .count

    @donePercantage = ((@tasksDoneCount.to_f / @tasksAllCount) * 100)
    @inprogressPercantage = ((@tasksInProgressCount.to_f / @tasksAllCount) * 100)

    @current_project = @project.name

    if @donePercantage.nan?
      @donePercantage = 0
    else
      @donePercantage = @donePercantage.to_i
    end

    if @inprogressPercantage.nan?
      @inprogressPercantage = 0
    else
      @inprogressPercantage = @inprogressPercantage.to_i
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html {redirect_to @project, notice: 'Project was successfully created.'}
        format.json {render :show, status: :created, location: @project}
      else
        format.html {render :new}
        format.json {render json: @project.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html {redirect_to @project, notice: 'Project was successfully updated.'}
        format.json {render :show, status: :ok, location: @project}
      else
        format.html {render :edit}
        format.json {render json: @project.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html {redirect_to projects_url, notice: 'Project was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:name, :description, :dueDate, :startDate)
  end


  def user_signed_in
    if !user_signed_in?
      redirect_to protected_index_path
    end
  end
end