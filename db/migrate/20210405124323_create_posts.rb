class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string     :name,                     null: false
      t.text       :explain,                  null: false
      t.integer    :training_status_id,       null: false

      t.timestamps
    end
  end
end
