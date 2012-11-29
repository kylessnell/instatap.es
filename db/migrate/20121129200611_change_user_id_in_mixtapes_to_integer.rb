class ChangeUserIdInMixtapesToInteger < ActiveRecord::Migration
  def change
    add_column :mixtapes, :user_id_temp, :integer
    # WARNING: can't have a lot of mixtape record
    # NOTE: some ppl dont' like data migrations here
    Mixtape.find_each do |mixtape|
      mixtape.user_id_temp = mixtape.user_id.to_i
      mixtape.save!
    end
    remove_column :mixtapes, :user_id
    rename_column :mixtapes, :user_id_temp, :user_id
  end
end
