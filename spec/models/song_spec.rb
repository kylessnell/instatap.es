require 'spec_helper'

describe Song do

  it "is invalid without an artist" do
    FactoryGirl.build(:song, :artist => nil).should_not be_valid
  end

  it "is invalid without a title" do
    build(:song, :title => nil).should_not be_valid
  end

  it "is invalid without a tiny_id" do
    FactoryGirl.build(:song, :tiny_id => nil).should_not be_valid
  end

  it "is invalid without a youtube_id" do
    FactoryGirl.build(:song, :youtube_id => nil).should_not be_valid
  end

  it "is invalid with a duplicate tiny_id" do
    FactoryGirl.create(:song, :tiny_id => 12345)
    FactoryGirl.build(:song, :tiny_id => 12345).should_not be_valid
  end

  it "is invalid with a duplicate youtube_id" do
    FactoryGirl.create(:song, :youtube_id => 1234567)
    FactoryGirl.build(:song, :youtube_id => 1234567).should_not be_valid
  end


end