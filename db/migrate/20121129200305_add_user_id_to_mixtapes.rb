class AddUserIdToMixtapes < ActiveRecord::Migration
  def change
    add_column :mixtapes, :user_id, :string
  end
end
  