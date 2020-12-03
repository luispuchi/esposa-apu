class CreateBreastfeedings < ActiveRecord::Migration[6.0]
  def change
    create_table :breastfeedings do |t|
      t.integer :volume
      t.integer :minutes
      t.belongs_to :baby, null: false, foreign_key: true

      t.timestamps
    end
  end
end
