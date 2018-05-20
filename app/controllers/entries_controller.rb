class EntriesController < ApplicationController

  before_action :authenticate_user!

  def new
    @entry = Entry.new
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Competition.find_by(active: true).entries.build(entry_params)
    @entry.active = false
    @entry.user_id = current_user.id

    if @entry.save
      flash[:notice] = "Entry \"#{@entry.title}\" successfully saved!"
      redirect_to competition_path(Competition.find_by(active: true).id)
    else
      puts @entry
      render :new
    end
  end

  def destroy
    @entry = Entry.find(params[:id])

    if @entry.destroy
      flash[:notice] = "\"#{@entry.title}\" was deleted successfully"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "An error occurred. \"#{@entry.title}\" could not be deleted."
      redirect_back(fallback_location: root_path)
    end
  end

  def upvote
    @entry = Entry.find(params[:id])
    @entry.upvote_by User.find(current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def downvote
    @entry = Entry.find(params[:id])
    @entry.downvote_by User.find(current_user.id)
    redirect_back(fallback_location: root_path)
  end

  private
  def entry_params
    params.require(:entry).permit(:title, :description, :price, :category, {gallery: []})
  end
end
