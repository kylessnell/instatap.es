require 'spec_helper'

describe Mixtape do 

  it "is invalid without a name" do
    build(:mixtape, name: nil).should_not be_valid
  end

  it "is creates a mixtape_url on create" do
    create(:mixtape).should be_valid
  end

  it "is invalid without a user id" do
    build(:mixtape, user_id: nil).should_not be_valid
  end

  it "is invalid with a duplicate mixtape_url" do
    mixtape1 = create(:mixtape)
    mixtape2 = create(:mixtape)
    mixtape2.mixtape_url = mixtape1.mixtape_url
    mixtape2.should_not be_valid
  end

  describe "song_ids=" do
    it "creates mixtapes_songs records with sequential track numbers" do
      song1 = create(:song)
      song2 = create(:song)
      mixtape = create(:mixtape, :song_ids => [song1.id, song2.id])
      mixtapes_songs = mixtape.mixtapes_songs
      mixtapes_songs.first.track_number.should eq 1
      mixtapes_songs.last.track_number.should eq 2
    end
  end

end