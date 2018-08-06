class CreateTeammembers < ActiveRecord::Migration[5.1]
  def change
    create_table :teammembers do |t|
      t.string :name
      t.string :role
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
