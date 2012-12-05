class DefaultValueForSkin < ActiveRecord::Migration
  def change
    change_column :mixtapes, :skin, :string, :default => "clear"
  end
end
