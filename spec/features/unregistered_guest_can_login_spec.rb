require 'rails_helper'

RSpec.feature 'unregistered guest can login' do
  scenario 'they add correct code and view welcome page' do
    guest = Guest.create(first_name1: 'Jodi', last_name2: 'Salcedo', code: 'abc123', role: 'guest')

    visit root_path

    expect(current_path).to eq login_path

    fill_in 'Password:', with: "abc123"

    click_on 'Submit'

    expect(current_path).to eq welcome_path

    expect(page).to have_content 'travel'
  end

  scenario 'they add incorrect code and view error message' do
    guest = Guest.create(first_name1: 'Jodi', last_name2: 'Salcedo', code: 'abc123', role: 'guest')

    visit root_path

    expect(current_path).to eq login_path

    fill_in 'Password:', with: "232"


    click_on 'Submit'

    expect(current_path).to eq login_path

    expect(page).to have_content 'Lawrence'
  end
end
