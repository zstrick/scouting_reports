require "rails_helper"

RSpec.describe "view all reports", type: :system do
  before do
    player = create(:player)
    scout = create(:scout)
    @pitcher_report =
      Report.create!(
        player: player,
        scout: scout,
        summary: Faker::Lorem.paragraph(sentence_count: 10),
        reportable: build(:pitcher_report)
      )
    @position_report =
      Report.create!(
        player: player,
        scout: scout,
        summary: Faker::Lorem.paragraph(sentence_count: 10),
        reportable: build(:position_report)
      )
  end

  it "shows a list of all reports" do
    visit root_url

    within "#reports" do
      expect(page).to have_content("PitcherReport")
      expect(page).to have_content("PositionReport")
      expect(page).to have_selector("tr", count: 3)
    end
  end
end
