class AddContributorToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :contributor, :string
  end
end
