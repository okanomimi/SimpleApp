class TweetsController < ApplicationController
 attr_accessor :test, :user_id
  def index
    @tweets = Tweet.all
    @user_id = params[:user_id]
  end

  def show
  end

  def new
    # render :text=> "id = #{params[:id]}"
    @test = params[:id]
  end

  def create
    @tweet = Tweet.new
    @tweet.title = params[:tweet][:title]
    @tweet.content = params[:tweet][:content]
    @tweet.count = 0 
    @tweet.user = @test 
    @tweet.save
    if params[:tweet][:test] != nil
      user = User.find(params[:tweet][:test])
      user.tweet.push(@tweet)
    end
    redirect_to '/tweets/index'
  end

  def count
    if params[:btn_id] == "plus" 
      tweet = Tweet.find(params[:id]) ;
      tweet.count += 1
      tweet.save 
      redirect_to '/tweets/index'
    elsif params[:btn_id] == "delete"
      tweet = Tweet.find(params[:id]) ;
      tweet.destroy

      redirect_to '/tweets/index'
    elsif params[:btn_id] == "test"
      binding.pry ;
      render :action => 'new.html.erb'
    end
  end

end
