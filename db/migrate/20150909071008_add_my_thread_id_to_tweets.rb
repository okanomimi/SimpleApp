class AddMyThreadIdToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :my_thread_id, :integer
  end
end
