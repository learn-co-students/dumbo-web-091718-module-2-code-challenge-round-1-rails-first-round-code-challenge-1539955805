class AddPowerIdtoSuperheroine < ActiveRecord::Migration[5.1]
  def change
    add_column :heroines, :power_id, :integer
  end
end
