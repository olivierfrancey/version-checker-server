class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :project_name
      t.string :firme
      t.timestamps
      # foreign_key :groups, :users
    end
    add_index :groups, :name, unique: true
  end
end
