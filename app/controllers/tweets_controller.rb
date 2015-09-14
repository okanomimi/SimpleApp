require "pry"
class TweetsController < ApplicationController
 attr_accessor :test, :user_id, :order

#  def initialize
#    
#  end

 #
 # === 投稿を表示する
 # カテゴリの指定がなければ、全部表示すうｒ
 #
  def index
    @user_id = params[:id]
    @category_id = params[:category_id]
    if @category_id == nil
      @tweets = Tweet.all
    else
      @tweets = Tweet.where(category_id: @category_id)
    end
  end

  

  #
  # === 人気順に表示
  #
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
    @tweet.title = params["tweet"]["title"]
    @tweet.contributor = params["tweet"]["contributor"]
    @tweet.content = params["tweet"]["content"]
    @tweet.count = 0 
    @tweet.password = "default"
    @tweet.password_confirmation = "default"
    # @tweet.user = @test 
    user = User.find_by(id: params["tweet"]["user_id"])
    @tweet.user= user
    category = Category.find_by(id: params["tweet"]["category_id"])
    @tweet.category= category
    my_thread = MyThread.find_by(id: params["tweet"]["thread_id"])
    p @tweet
    @tweet.my_thread = my_thread

    # @tweet.user_id << User.find_by(id: 1)
  
    p @tweet.user_id
    # @tweet.user_id << params[:tweet][:idd]
    # @tweet.categories << Category.find_by(id: params[:category_id])
    # @tweet.category_id << Category.find_by(id: 1)
    # @tweet.category.create()
    @tweet.save
    if params[:tweet][:test] != nil
      user = User.find(params[:tweet][:test])
      user.tweet.push(@tweet)
    end
    redirect_to '/'
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
