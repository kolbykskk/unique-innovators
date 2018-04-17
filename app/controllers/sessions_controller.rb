class SessionsController < Devise::SessionsController

before_action :authenticate_user!

def dashboard
  @gigs = Gig.where(user_id: current_user.id)
  @favorites = current_user.favorites
end

end
