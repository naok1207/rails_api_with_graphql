class CreateLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :labels do |t|
      t.references :post, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
