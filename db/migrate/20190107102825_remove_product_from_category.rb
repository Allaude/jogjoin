class RemoveProductFromCategory < ActiveRecord::Migration[5.2]
  def change
    remove_reference :categories, :product, foreign_key: true
  end
end
