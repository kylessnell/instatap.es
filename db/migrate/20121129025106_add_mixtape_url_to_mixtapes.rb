class AddMixtapeUrlToMixtapes < ActiveRecord::Migration
  def change
    add_column :mixtapes, :url, :string
  end
end
