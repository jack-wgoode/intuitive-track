class AddColumnsToTechnicians < ActiveRecord::Migration[5.0]
  def change
    add_column :technicians, :full_name, :string
    add_column :technicians, :uid, :string
    add_column :technicians, :avatar_url, :string
  end
end
