class CompetitionsController < ApplicationController
  def create
    @competition = Competition.new
    @competition.active = true
    Competition.all.each do |comp|
      comp.active = false
      comp.save!
    end

    if @competition.save
      flash[:notice] = "Successfully activated a new competition!"
      redirect_to @competition
    else
      flash[:alert] = "Competition could not be saved."
      redirect_back(fallback_location: root_path)
    end
  end

  def delete
  end

  def show
    @competition = Competition.find_by_id(params[:id])
  end

  def update
      @competition = Competition.find(params[:id]);
      @competition.active = !@competition.active
      @competition.save!
      flash[:notice] = "Successfully toggled competition state."
      redirect_back(fallback_location: root_path)
  end

  def redirect
    redirect_to root_path
  end

  helper_method :redirect
end
