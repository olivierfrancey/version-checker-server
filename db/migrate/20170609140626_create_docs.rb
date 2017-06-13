class CreateDocs < ActiveRecord::Migration[5.1]
  def change
    create_table :docs do |t|
      t.string :number
      t.string :encrypted_id
      t.string :title
      t.string :sub_title
      t.text :comments
      t.string :author
      t.numeric :version
      t.boolean :last_version
      t.string :doc_type
      t.string :size
      t.string :file_name
      t.string :group_id, foreign_key: true
      t.string :doc_date
      t.timestamps
    end
  end
end
