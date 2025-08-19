class CreateAgencies < ActiveRecord::Migration[8.0]
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :email
      t.text :description
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.string :phone
      t.text :address

      t.timestamps
    end
  end
end
