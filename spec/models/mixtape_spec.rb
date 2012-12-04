require 'spec_helper'

describe Mixtape do 

  it "is creates a url on create" do
    create(:mixtape).should be_valid
  end

  it "is invalid without a user id" do
    build(:mixtape, user_id: nil).should_not be_valid
  end

  it "is invalid with a duplicate url" do
    mixtape1 = create(:mixtape)
    mixtape2 = create(:mixtape)
    mixtape2.url = mixtape1.url
    mixtape2.should_not be_valid
  end

  describe "song_ids=" do
    it "creates tracks records with sequential track numbers" do
      song1 = create(:song)
      song2 = create(:song)
      mixtape = create(:mixtape, :song_ids => [song1.id, song2.id])
      tracks = mixtape.tracks
      tracks.first.position.should eq 1
      tracks.last.position.should eq 2
    end
  end

end