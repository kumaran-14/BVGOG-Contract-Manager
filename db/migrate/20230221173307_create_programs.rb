class CreatePrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :programs do |t|
      t.text :name, null: false

      t.timestamps
    end
  end
end
