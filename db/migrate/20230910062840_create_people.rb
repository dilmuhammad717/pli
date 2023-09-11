class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.json :address
      t.json :personal_info
      t.string :email

      t.timestamps
    end
  end
end
