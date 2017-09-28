require 'rails_helper'

RSpec.feature 'unregistered guest can login' do
  scenario 'they add correct code and view welcome page' do
    visit root_path

    expect(current_path).to eq login_path

    within('.login-user-form') do
      fill_in 'code', with: "abc123"
    end

    click_on 'Submit'

    expect(current_path).to eq welcome_path
  end
end
