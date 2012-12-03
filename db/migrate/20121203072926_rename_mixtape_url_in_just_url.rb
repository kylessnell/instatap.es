class RenameMixtapeUrlInJustUrl < ActiveRecord::Migration
  def change
    rename_column :mixtapes, :url, :url
  end
end
