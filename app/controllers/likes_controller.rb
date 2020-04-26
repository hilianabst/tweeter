class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]
  before_action :find_tweet
  before_action :find_like, only: [:destroy]
  before_action :authenticate_user!, :except => [:index]

  # GET /likes
  # GET /likes.json
  def index
    @likes = Like.all
  end

  # GET /likes/1
  # GET /likes/1.json
  def show
  end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit
  end

  #check if a user has already liked a photo
  def already_liked?
    Like.where(user_id: current_user.id, tweet_id:
    params[:tweet_id]).exists?
  end

  # POST /likes
  # POST /likes.json
  def create

    
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
    @tweet.likes.create(user_id: current_user.id)
    end
    redirect_to tweet_path(@tweet)
  end

  private

    def find_tweet
      @tweet = Tweet.find(params[:tweet_id])
    end
end

  # PATCH/PUT /likes/1
  # PATCH/PUT /likes/1.json
  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_to @like, notice: 'Like was successfully updated.' }
        format.json { render :show, status: :ok, location: @like }
      else
        format.html { render :edit }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to tweet_path(@like)
  end

  def find_like 
    @like = @tweet.likes.find (params [:id]) 
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:quantity_like, :quantity_retweet, :tweet_id)
    end
