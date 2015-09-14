class MyThreadsController < ApplicationController
  before_action :set_my_thread, only: [:show, :edit, :update, :destroy]

  # GET /my_threads
  # GET /my_threads.json
  def index
    @my_threads = MyThread.all
  end

  # GET /my_threads/1
  # GET /my_threads/1.json
  def show
  end

  def show_tweets
    @category_id = params[:category_id]
    @thread_id = params[:thread_id]
    @user_id = params[:user_id]
    @my_thread = MyThread.find(params[:thread_id])
    @tweets = @my_thread.tweets
  end

  # GET /my_threads/new
  def new
    @my_thread = MyThread.new
  end

  # GET /my_threads/1/edit
  def edit
  end

  # POST /my_threads
  # POST /my_threads.json
  def create
    @my_thread = MyThread.new(my_thread_params)

    respond_to do |format|
      if @my_thread.save
        format.html { redirect_to @my_thread, notice: 'My thread was successfully created.' }
        format.json { render action: 'show', status: :created, location: @my_thread }
      else
        format.html { render action: 'new' }
        format.json { render json: @my_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_threads/1
  # PATCH/PUT /my_threads/1.json
  def update
    respond_to do |format|
      if @my_thread.update(my_thread_params)
        format.html { redirect_to @my_thread, notice: 'My thread was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @my_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_threads/1
  # DELETE /my_threads/1.json
  def destroy
    @my_thread.destroy
    respond_to do |format|
      format.html { redirect_to my_threads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_thread
      @my_thread = MyThread.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_thread_params
      params.require(:my_thread).permit(:name, :category_id, :tweet_id)
    end
end
