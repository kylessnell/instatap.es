class AddSkinToMixtape < ActiveRecord::Migration
  def change
    add_column :mixtapes, :skin, :string
  end
end
