class RankingsController < ApplicationController
  protect_from_forgery :except => [:create]

  def create
    @authenticator = Authenticator.new(Ranking.new(ranking_params), params[:key], params[:access_token])
    
    respond_to do |format|
      if @authenticator.save
        # ホントはresponse.statusを200
        format.html { redirect_to games_path, notice: 'Create Ranking!', status: 200 }
        format.js
      else
        # Permission denied.
        format.html { redirect_to root_path, status: 400 }
        format.js
      end
    end
  end

  def index
    @authenticator = Authenticator.new(nil, params[:key], params[:access_token])
    @rankings = @authenticator.get_ranking
    if @rankings
      render json: @rankings, status: 200
    else
      redirect_to root_path, status: 400
    end
  end
 
 private
 
  def ranking_params
    params.require(:ranking).permit(:nickname, :score)
  end 
end
