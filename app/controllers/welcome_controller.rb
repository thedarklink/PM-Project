class WelcomeController < ApplicationController
  before_action :user_signed_in

  def index
    @projects = Project.all
    # TODO: Where über Tasks suchen
    @myprojects = Project.all
  end


  private
  def user_signed_in
    if !user_signed_in?
      redirect_to protected_index_path
    end
  end
end
