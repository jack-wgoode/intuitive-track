class CreateTechnicians < ActiveRecord::Migration[5.0]
  def change
    create_table :technicians do |t|
      t.string :name
      t.string :department
      t.integer :cert_level
      t.string :email

      t.timestamps
    end
  end
end
