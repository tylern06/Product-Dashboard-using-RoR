class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.string :text
      t.references :product, index: true

      t.timestamps
    end
  end
end
