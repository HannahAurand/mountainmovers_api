class AddPictureToTeammembers < ActiveRecord::Migration[5.1]
  def change
    add_column :teammembers, :picture, :string
  end
end
