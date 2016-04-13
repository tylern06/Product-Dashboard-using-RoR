class ChangePriceName < ActiveRecord::Migration
  def change
  	rename_column :products, :pricing, :price
  end
end
