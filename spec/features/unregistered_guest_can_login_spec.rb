require 'rails_helper'

RSpec.feature 'unregistered guest can login' do
  scenario 'they add correct code and view welcome page' do
    visit root_path

    within('.code') do
      fill_in 'Code', with: "#{{}}"
    end

    click_on 'Submit'

    expect(current_path).to eq welcome_path
  end
end
