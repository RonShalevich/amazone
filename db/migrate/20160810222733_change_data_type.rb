class ChangeDataType < ActiveRecord::Migration[5.0]
  def self.up
    change_column :products, :price, :float
  end
  # def self.down
  #   change_column :Products, :price, :integer
  # end
end
