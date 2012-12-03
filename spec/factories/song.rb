FactoryGirl.define do
  sequence(:song_id) { |n| "#{n}"}
  factory :song do
    artist "LCD Soundsystem"
    title "Never as tired as when i'm waking up"
    tiny_id { generate(:song_id) }
    youtube_id { generate(:song_id) }
  end

end

