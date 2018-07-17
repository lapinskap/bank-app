class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :string
      t.string :client_number

      t.timestamps
    end
  end
end
