class SprintsController < ApplicationController
  before_action :set_sprint, only: [:show, :edit, :update, :destroy]
  layout '_modal', only: [:new, :edit]
  before_action :user_signed_in


  # GET /sprints
  # GET /sprints.json
  def index
    if params[:project]
      @sprints = Sprint.where(project_id: params[:project]).order(:id)
      @project = Project.find(params[:project])
    end
  end

  # GET /sprints/1
  # GET /sprints/1.json
  def show
    @tasks = Task.all
  end

  # GET /sprints/new
  def new
    @sprint = Sprint.new
    @sprint.project = Project.find(params[:project])
    @newSprint = Sprint.where(project_id: params[:project]).count + 1
    @sprint.name = 'Sprint ' + @newSprint.to_s
    @sprint.startDate = Time.now
    @sprint.endDate = Time.now.days_ago(-14)

    if params[:returnUrl]
      @returnUrl = params[:returnUrl]
    else
      @returnUrl = sprints_path(:project => @project_id)
    end
  end

  # GET /sprints/1/edit
  def edit

    if params[:returnUrl]
      @returnUrl = params[:returnUrl]
    else
      @returnUrl = sprints_path(:project => @project_id)
    end
  end

  # POST /sprints
  # POST /sprints.json
  def create
    @sprint = Sprint.new(sprint_params)

    if params[:returnUrl]
      @returnUrl = params[:returnUrl]
    else
      @returnUrl = sprints_path(:project => @project_id)
    end

    respond_to do |format|
      if @sprint.save
        format.html {redirect_to @returnUrl, notice: 'Sprint was successfully created.'}
        format.json {render :show, status: :created, location: @sprint}
      else
        format.html {redirect_to @returnUrl, alert: @sprint.errors}
        format.json {render json: @sprint.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /sprints/1
  # PATCH/PUT /sprints/1.json
  def update

    if params[:returnUrl]
      @returnUrl = params[:returnUrl]
    else
      @returnUrl = sprints_path(:project => @project_id)
    end

    respond_to do |format|
      if @sprint.update(sprint_params)
        format.html {redirect_to @returnUrl, notice: 'Sprint was successfully updated.'}
        format.json {render :show, status: :ok, location: @sprint}
      else
        format.html {redirect_to @returnUrl, alert: @sprint.errors}
        format.json {render json: @sprint.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /sprints/1
  # DELETE /sprints/1.json
  def destroy
    @sprint.destroy
    respond_to do |format|
      format.html {redirect_to sprints_url, notice: 'Sprint was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sprint
    @sprint = Sprint.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sprint_params
    params.require(:sprint).permit(:name, :startDate, :endDate, :effort, :remainingWork, :project_id)
  end

  def user_signed_in
    if !user_signed_in?
      redirect_to protected_index_path
    end
  end
end
