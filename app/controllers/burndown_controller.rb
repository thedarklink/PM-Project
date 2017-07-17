class BurndownController < ApplicationController
  def index
    @project = Project.find(params[:project])


    #Ideale Linie
    @tageImSprint = ((Project.first.dueDate) - (Project.first.startDate)).to_i
    @scrumPoints = Backlogitem.where(project_id: params[:project]).sum(:effort).to_f
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
    @countDate = Project.first.startDate
    @serieReal = {}
    @scrumPontsReal = Backlogitem.where(project_id: params[:project]).sum(:effort)
    @count = 0

    @tageImSprint.times do |i|
      if @todayDate == @countDate
        break
      end

      @aufwand = Backlogitem.where(project_id: params[:project]).where(state: "Done").where(updated_at: @countDate).sum(:effort)

      if @aufwand != 0
        @scrumPontsReal = @scrumPontsReal - @aufwand
        @serieReal[i] = @scrumPontsReal
      elsif @scrumPontsReal == 0
        break
      else
        @serieReal[i] = @scrumPontsReal
      end

      @countDate = @countDate+1
      @count = @count+1
    end
  end
end
