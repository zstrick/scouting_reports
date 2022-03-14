Player.create!([
  {
    name: "Shane McClanahan"
  },
  {
    name: "Drew Rasmussen"
  },
  {
    name: "Corey Kluber"
  },
  {
    name: "Andrew Kittredge"
  },
  {
    name: "Pete Fairbanks"
  },
  {
    name: "Mike Zunino"
  },
  {
    name: "Ji-Man Choi"
  },
  {
    name: "Brandon Lowe"
  },
  {
    name: "Yandy Diaz"
  },
  {
    name: "Wander Franco"
  },
  {
    name: "Randy Arozarena"
  },
  {
    name: "Kevin Kiermaier"
  },
  {
    name: "Manuel Margot"
  },
  {
    name: "Austin Meadows"
  }
])

# Create pitcher reports with pitchers
Player.take(5).each do |player|
  Report.create!(
    player: player,
    scout: FactoryBot.create(:scout),
    summary: Faker::Lorem.paragraph(sentence_count: 10),
    reportable: FactoryBot.build(:pitcher_report)
  )
end

# Create position reports with position players
Player.last(9).each do |player|
  Report.create!(
    player: player,
    scout: FactoryBot.create(:scout),
    summary: Faker::Lorem.paragraph(sentence_count: 10),
    reportable: FactoryBot.build(:position_report)
  )
end

# Create some pitches for pitching reports
PitcherReport.all.each do |pitcher_report|
  25.times do
    FactoryBot.create(:pitch, pitcher_report: pitcher_report)
  end
end
