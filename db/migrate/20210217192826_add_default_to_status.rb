class AddDefaultToStatus < ActiveRecord::Migration[5.2]
  def change
  	change_column :applications, :status, :string, default: "In progress"
  end
end
