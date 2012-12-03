require 'spec_helper'

describe Track do

  it 'is invalid without a track number' do
    track = create(:track)
    track.position = nil
    track.should_not be_valid
  end

  describe "#set_position" do
    context "on create" do
      it "increments the track number based on the associated mixtape" do
        track = create(:track)
        track.position.should eq 1
        track2 = create(:track)
        track2.position.should eq 1
        track3 = create(:track, :mixtape => track.mixtape.reload)
        track3.position.should eq 2
      end
    end
  end
end
