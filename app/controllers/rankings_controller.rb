class RankingsController < ApplicationController

  def create
    @authenticator = Authenticator.new(Ranking.new(ranking_params), params[:key], params[:access_token])
    
    if @authenticator.save
      # ホントはresponse.statusを200
      redirect_to games_path
    else
      # response.statusを302? Permission denied.
      redirect_to root_path
    end
  end
 
 private
 
  def ranking_params
    params.require(:ranking).permit(:nickname, :score)
  end 
end