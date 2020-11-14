class CreateEndUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :end_users do |t|
      t.string :name
      t.string :employee_number
      t.string :department
      t.string :email

      t.timestamps
    end
  end
end
