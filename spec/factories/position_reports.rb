FactoryBot.define do
  factory :position_report do
    position { PositionReport::POSITIONS.sample }
    batting_grade { 80 }
    running_time { 4.2 }
  end
end
