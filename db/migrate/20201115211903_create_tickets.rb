class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :ticket_number
      t.string :asset
      t.text :issue
      t.string :priority
      t.references :technician
      t.references :end_user
      t.timestamps
    end
  end
end
