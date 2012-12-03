require 'spec_helper'

describe MixtapesSong do

  it 'is invalid without a track number' do
    mixtapes_song = create(:mixtapes_song)
    mixtapes_song.track_number = nil
    mixtapes_song.should_not be_valid
  end

  describe "#set_track_number" do
    context "on create" do
      it "increments the track number based on the associated mixtape" do
        mixtapes_song = create(:mixtapes_song)
        mixtapes_song.track_number.should eq 1
        mixtapes_song2 = create(:mixtapes_song)
        mixtapes_song2.track_number.should eq 1
        mixtapes_song3 = create(:mixtapes_song, :mixtape => mixtapes_song.mixtape.reload)
        mixtapes_song3.track_number.should eq 2
      end
    end
  end
end
