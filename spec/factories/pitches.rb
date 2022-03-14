FactoryBot.define do
  factory :pitch do
    pitch_type { Pitch::PITCH_TYPES.sample }
    velocity_high { (50..110).to_a.sample }
    velocity_low { velocity_high - 5 }
    pitcher_report
  end
end
