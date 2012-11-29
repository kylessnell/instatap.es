class AddMixtapeUrlToMixtapes < ActiveRecord::Migration
  def change
    add_column :mixtapes, :mixtape_url, :string
  end
end
