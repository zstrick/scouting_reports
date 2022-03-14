require "rails_helper"

RSpec.describe "create reports", type: :system do
  let!(:player) { create(:player) }
  let!(:scout) { create(:scout) }

  it "can create position report" do
    visit root_url

    click_on "Create Position Report"
    select player.name, from: "Player"
    select scout.name, from: "Scout"
    fill_in "Summary", with: "This guy is fast!"
    select "SS", from: "Position"
    select 80, from: "Batting grade"
    fill_in "Running time", with: 4.4
    click_on "Create Report"

    expect(page).to have_content("Report was created.")
    expect(page).to have_content(player.name)
    expect(page).to have_content(scout.name)
    expect(page).to have_content("This guy is fast!")
  end

  it "can create a pitcher report" do
    visit root_url

    click_on "Create Pitcher Report"
    select player.name, from: "Player"
    select scout.name, from: "Scout"
    fill_in "Summary", with: "Throwing gas!"
    select "Starter", from: "Role"
    find("#pitch-type").select("Fastball")
    find("#velocity-low").set 93
    find("#velocity-high").set 95
    click_on "Create Report"

    expect(page).to have_content("Report was created.")

    click_link "Show"

    expect(page).to have_content(player.name)
    expect(page).to have_content(scout.name)
    expect(page).to have_content("Fastball")
    expect(page).to have_content(93)
    expect(page).to have_content(95)
  end
end
