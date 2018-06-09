class ProfilePicsController < ApplicationController
  def create
    @user = current_user
    @profile_pic = @user.profile_pics.build(profile_pic_params)

    if @profile_pic.save
      flash[:notice] = "Profile picture successfully updated!"
      redirect_to edit_user_registration_path
    else
      flash[:alert] = "There was an error saving your profile picture."
      redirect_to edit_user_registration_path
    end
  end

  private
  def profile_pic_params
    params.permit({uploader: []})
  end
end
