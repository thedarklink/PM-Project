class BurndownController < ApplicationController
  def index

    @sprints = Sprint.where(project_id: params[:project])
    @project = Project.find(params[:project])
    @sprint
    if(params[:sprint])
      @sprint = Sprint.find(params[:sprint])

      #Ideale Linie
      @tageImSprint = ((@sprint.endDate) - (@sprint.startDate)).to_i
      @scrumPoints = Task.where(sprint_id: @sprint.id).sum(:effort).to_f
      @averagePoints = (@scrumPoints / @tageImSprint).to_f
      @serieAverage = {}

      @tageImSprint.times do |i|
        if i == 0
          @serieAverage[i] = @scrumPoints-i*@averagePoints
        end
        i = i+1
        @serieAverage[i] = @scrumPoints-i*@averagePoints
      end

      #Tatsächliche Linie
      @todayDate = Date.today
      @countDate = @sprint.startDate
      @serieReal = {}
      @scrumPointsReal = Task.where(sprint_id: @sprint.id).sum(:effort).to_f
      @count = 0

      @tageImSprint.times do |i|
        if @todayDate == @countDate
          break
        end

        @aufwand = Task.where(sprint_id: @sprint.id).where(state: "Done").where(updated_at: @countDate).sum(:effort)

        if @aufwand != 0
          @scrumPointsReal = @scrumPointsReal - @aufwand
          @serieReal[i] = @scrumPointsReal
        elsif @scrumPointsReal == 0
          break
        else
          @serieReal[i] = @scrumPointsReal
        end

        @countDate = @countDate+1
        @count = @count+1
      end
    end
  end
end
