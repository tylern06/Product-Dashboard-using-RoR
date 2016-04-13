class ChangeCommentTable < ActiveRecord::Migration
  def change
  	remove_column :comments, :text
  	change_column :comments, :comment, :text
  end
end
