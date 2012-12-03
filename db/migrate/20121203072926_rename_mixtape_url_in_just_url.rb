class RenameMixtapeUrlInJustUrl < ActiveRecord::Migration
  def change
    rename_column :mixtapes, :mixtape_url, :url
  end
end
