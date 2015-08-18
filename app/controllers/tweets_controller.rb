class TweetsController < ApplicationController
 attr_accessor :test, :user_id, :order

#  def initialize
#    
#  end

  def index
    if @order == "iine"
      @tweets = Tweet.order(count: :asc)
      p "TTTTTTTTTTTTTT"
    else
      @tweets = Tweet.all

      p "FFFFFFFFFFFFFF"
    end
    @user_id = params[:user_id]
  end

  def popularity
      @tweets = Tweet.order(count: :asc)
      render :action => 'index'
  end

  def new
    # render :text=> "id = #{params[:id]}"
    @test = params[:id]
  end

  def create
    @tweet = Tweet.new
    @tweet.title = params[:tweet][:title]
    @tweet.contributor = params[:tweet][:contributor]
    @tweet.content = params[:tweet][:content]
    @tweet.count = 0 
    @tweet.password = "default"
    @tweet.password_confirmation = "default"
    # @tweet.user = @test 
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
    elsif params[:btn_id] == "iine"
      @tweets = Tweet.order(count: :asc)
      # redirect_to '/tweets/index'
    end
  end

   def count2
    if params[:btn_id] == "plus" 
      tweet = Tweet.find(params[:id]) ;
      tweet.count += 1
      tweet.save 
      redirect_to '/tweets/popularity'
    elsif params[:btn_id] == "delete"
      tweet = Tweet.find(params[:id]) ;
      tweet.destroy
      redirect_to '/tweets/popularity'
     end
  end


end
