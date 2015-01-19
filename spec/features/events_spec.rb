require 'rails_helper'

describe EventsController, type: :feature do
  it "tells me I'm standing" do
    Event.create(standing: true)
    visit events_path
    expect(page).to have_content "Currently standing"
  end

  it "changes to sitting" do
    Event.create(standing: true)
    visit events_path
    click_button "Sit"
    expect(page).to have_content "Currently sitting"
  end

  it "tells me when I stood up" do
    Timecop.travel(1.hour.ago) { Event.create(standing: true) }
    visit events_path
    expect(page).to have_content "You stood up about 1 hour ago"
  end
end

