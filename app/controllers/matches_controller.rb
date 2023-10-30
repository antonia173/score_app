class MatchesController < ApplicationController
  before_action :set_match
  before_action :require_user

  def edit
  end

  def update
    if @match.update(match_params)
      flash[:notice] = "Score was updated successfully."
      redirect_to user_matches_path(current_user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  
  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:competitor1_score, :competitor2_score)
  end

end