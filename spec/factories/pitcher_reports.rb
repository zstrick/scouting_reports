FactoryBot.define do
  factory :pitcher_report do
    role { PitcherReport::ROLES.sample }
  end
end
