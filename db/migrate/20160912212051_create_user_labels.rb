class CreateUserLabels < ActiveRecord::Migration
  def change
    create_table :user_labels do |t|
      t.references :user, index: true, foreign_key: true
      t.references :label, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
