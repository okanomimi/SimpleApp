class AddMyThreadIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :my_thread_id, :integer
  end
end
