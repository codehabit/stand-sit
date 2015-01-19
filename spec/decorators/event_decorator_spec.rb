require 'rails_helper'

describe EventDecorator do
  example "stood up two hours ago" do
    Timecop.travel(2.hours.ago) { Event.create(standing: true) }
    last = Event.last.decorate
    expect(last.duration_message).to eq "about 2 hours"
  end

  example "stood up an hour ago" do
    Timecop.travel(1.hour.ago) { Event.create(standing: true) }
    last = Event.last.decorate
    expect(last.duration_message).to eq "about 1 hour"
  end
end

