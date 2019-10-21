class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description
      t.datetime :due_date
      t.string :priority

      t.timestamps
    end
  end
end
