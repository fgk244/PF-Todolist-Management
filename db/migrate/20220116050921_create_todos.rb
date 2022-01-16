class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :date
      t.string :contents
      t.string :memo

      t.timestamps
    end
  end
end
