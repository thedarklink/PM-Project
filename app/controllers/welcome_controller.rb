class WelcomeController < ApplicationController
  before_action :user_signed_in

  def index
    @projects = Project.all
    # TODO: Where über TGasks
    @myprojects = Project.all
    @mytasks = Task.where(:assignedto => current_user.id).where.not(:state => :Done)
  end


  private
  def user_signed_in
    if !user_signed_in?
      redirect_to protected_index_path
    end
  end
end
