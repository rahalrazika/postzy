class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.text :title
      t.text :content
      t.references :author, index: true

      t.timestamps
    end
    add_foreign_key :articles, :users, column: :author_id
  end
end
