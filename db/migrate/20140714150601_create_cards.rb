class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.references :project, index: true
      t.string :title
      t.text :body
      t.integer :position

      t.timestamps
    end
  end
end
