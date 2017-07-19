class BurndownController < ApplicationController

  def index

    @sprints = Sprint.where(project_id: params[:project]).order(:id)
    @project = Project.find(params[:project])
    @sprint_id = params[:sprint]

    if (params[:sprint])

      @sprint = Sprint.find(params[:sprint])
      #Ideale Linie
      @tageImSprint = (((@sprint.endDate.days_ago(1)) - (@sprint.startDate)).to_i)
      @scrumPoints = Task
                         .where(sprint_id: @sprint.id)
                         .sum(:effort).to_f

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

      if @sprint.startDate < Date.today

        @todayDate = Date.today.days_ago(-1)
        @countDate = @sprint.startDate
        @serieReal = {}

        @scrumPointsReal = Task
                               .where(sprint_id: @sprint.id)
                               .sum(:effort).to_f
        @count = 0

        (@tageImSprint + 1).times do |i|

          if @todayDate < @countDate
            break
          end

          @aufwand = Task
                         .where(sprint_id: @sprint.id)
                         .where(state: "Done").where('updated_at = ?', @countDate)
                         .sum(:effort)

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
end
