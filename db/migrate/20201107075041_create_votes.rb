class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :article, index: true, foreign_key: true
      t.references :author, index: true

      t.timestamps
    end
    add_foreign_key :votes, :users, column: :author_id
  end
end
