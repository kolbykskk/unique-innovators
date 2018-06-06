class BioController < ApplicationController
  def create
    @user = current_user
    @bio = @user.bios.build(bio_params)

    if @bio.save
      flash[:notice] = "Bio successfully updated!"
      redirect_to edit_user_registration_path
    else
      flash[:alert] = "There was an error saving your bio."
      redirect_to edit_user_registration_path
    end
  end

  def update
    @bio = Bio.find(current_user.bios[0].id)
    @bio.assign_attributes({description: params[:bio][:description]})

    if @bio.save
      flash[:notice] = "Bio successfully updated!"
      redirect_to edit_user_registration_path
    else
      flash[:alert] = "There was an error saving your bio."
      redirect_to edit_user_registration_path
    end
  end

  private
  def bio_params
    params.require("/bio/#{Bio.all.count + 1}").permit(:description)
  end
end
