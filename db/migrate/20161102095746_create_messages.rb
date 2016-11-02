class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :room_id
      t.text :content
      t.string :username

      t.timestamps
    end
  end
end
