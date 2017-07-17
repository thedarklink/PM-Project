class BacklogitemsController < ApplicationController
  before_action :set_backlogitem, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction


  # GET /backlogitems
  # GET /backlogitems.json
  def index
    if params[:project]
      @backlogitems = Backlogitem
                          .where(project_id: params[:project])
                          .order("#{sort_column} #{sort_direction}")
      @project = Project.find(params[:project])
    end


    @tageImSprint = ((Project.first.dueDate) - (Project.first.startDate)).to_i

    @back = Backlogitem.where(project_id: params[:project]).sum(:effort).to_f

    @perDay = (@back / @tageImSprint).to_f


    @serieLinea = Array.new(@tageImSprint)


    @noises = {}
    @tageImSprint.times do |i|
      if i == 0
        @noises[i] = @back-i*@perDay
      end
      i = i+1
      @noises[i] = @back-i*@perDay
    end

    @series_a = {"1 Tag" => @back, "2 Tag" => @back-@perDay,"3 Tag" => @back-2*@perDay, "4 Tag" => 0}


    @todayDate = Date.today
    @countDate = Project.first.startDate
    @series_b = {}
    @aufwand
    @back1 = Backlogitem.where(project_id: params[:project]).sum(:effort)
    @count = 0



    @tageImSprint.times do |i|
      if @todayDate == @countDate
        break
      end


      @aufwand = Backlogitem.where(project_id: params[:project]).where(state: "Done").where(updated_at: @countDate).sum(:effort)

      if @aufwand != 0
        @back1 = @back1 - @aufwand
        @series_b[i] = @back1
      elsif @back1 == 0
        break
      else
        @series_b[i] = @back1
      end

      @countDate = @countDate+1
      @count = @count+1
    end



  end

  # GET /backlogitems/1
  # GET /backlogitems/1.json
  def show
  end

  # GET /backlogitems/new
  def new
    @backlogitem = Backlogitem.new
    if params[:project]
      @backlogitem.project = Project.find(params[:project])
      @backlogitem.author = current_user.id
      @project_id = params[:project]
    end
  end

  # GET /backlogitems/1/edit
  def edit
  end

  # POST /backlogitems
  # POST /backlogitems.json
  def create

    @backlogitem = Backlogitem.new(backlogitem_params)
    @backlogitem.project = Project.find(backlogitem_params[:project_id])


    respond_to do |format|
      if @backlogitem.save
        format.html {redirect_to backlogitems_path(:project => @backlogitem.project_id), notice: 'Backlogitem was successfully created.'}
        format.json {render :show, status: :created, location: @backlogitem}
      else
        format.html {render :new}
        format.json {render json: @backlogitem.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /backlogitems/1
  # PATCH/PUT /backlogitems/1.json
  def update
    respond_to do |format|
      if @backlogitem.update(backlogitem_params)
        format.html {redirect_to backlogitems_path(:project => @backlogitem.project_id), notice: 'BacklogItem was successfully updated.'}
        format.json {render :show, status: :ok, location: @backlogitem}
      else
        format.html {render :edit}
        format.json {render json: @backlogitem.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /backlogitems/1
  # DELETE /backlogitems/1.json
  def destroy
    @backlogitem.destroy
    respond_to do |format|
      format.html {redirect_to backlogitems_url, notice: 'Backlogitem was successfully destroyed.'}
      format.json {head :no_content}
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_backlogitem
    @backlogitem = Backlogitem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def backlogitem_params
    params.require(:backlogitem).permit(:title, :description, :author, :creationdate, :author, :creationdate, :assignedto, :state, :priorty, :effort, :project_id, :project)
  end

  def sortable_columns
    ["title", "state"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end