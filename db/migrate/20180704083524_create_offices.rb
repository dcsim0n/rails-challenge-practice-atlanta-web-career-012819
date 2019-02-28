class CreateOffices < ActiveRecord::Migration[5.1]
  def change
    create_table :offices do |t|
      t.belongs_to :building
      t.belongs_to :company
      t.integer :floor

      t.timestamps
    end
  end
end
