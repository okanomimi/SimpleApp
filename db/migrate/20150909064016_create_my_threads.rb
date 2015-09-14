class CreateMyThreads < ActiveRecord::Migration
  def change
    create_table :my_threads do |t|
      t.string :name
      t.integer :category_id
      t.integer :tweet_id

      t.timestamps
    end
  end
end
