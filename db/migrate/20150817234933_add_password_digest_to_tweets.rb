class AddPasswordDigestToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :password_digest, :string
  end
end
