class CreateIdentities < ActiveRecord::Migration[5.1]
  def change
    create_table :identities do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
