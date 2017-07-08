class RankingsController < ApplicationController

  def create
    @ranking = Ranking.new(ranking_params)
    @authenticator = Authenticator.new(@ranking, params[:key], params[:access_token])
    if @authenticator.save
      redirect_to games_path
    else
      redirect_to root_path
    end
  end
 
 private
 
  def ranking_params
    params.require(:ranking).permit(:nickname, :score)
  end 
end