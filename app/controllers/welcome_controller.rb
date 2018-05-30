class WelcomeController < ApplicationController
  def index
    @search = Gig.all
    @recipients = User.all - [current_user]

  end
end
