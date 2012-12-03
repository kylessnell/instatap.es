# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mixtapes_song do
    mixtape
    song
  end

end
