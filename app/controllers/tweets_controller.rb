class TweetsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  rescue_from Pundit::NotAuthorizedError do
    redirect_to root_path, alert: "You aren't allowed to do that"
  end

  def index
    @tweets = Current.user.tweets
    authorize @tweets
  end

  def new
    @tweet = Tweet.new
    authorize @tweets
  end

  def create
    @tweet = Current.user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: 'Tweet was scheduled successfully'
    else
      render :new
    end
    authorize @tweets
  end

  def edit

  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: 'Tweet was updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: 'Tweet was unscheduled'
  end

  private

  def tweet_params
    params.require(:tweet).permit(:twitter_account_id, :body, :publish_at)
  end

  def set_tweet
    @tweet = Current.user.tweets.find(params[:id])
  end
end
