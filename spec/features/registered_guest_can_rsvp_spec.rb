require 'rails_helper'

RSpec.feature 'registered guest can rsvp' do
  scenario 'they add information and update guest' do
    guest = Guest.create(first_name1: 'Jodi', last_name2: 'Salcedo', code: 'abc123', role: 'guest')
    expect(guest.rsvped).to eq false
    expect(guest.attending).to be nil

    visit root_path

    expect(current_path).to eq login_path

    fill_in 'Password :', with: "abc123"
    click_on 'Submit'

    expect(current_path).to eq welcome_path
    expect(page).to have_content 'travel'

    click_on 'RSVP'

    expect(current_path).to eq edit_guest_path(guest)
    expect(page).to have_content 'Jodi'

    select("Yes")
    select('Hotel')
    fill_in 'Email:', with: 'jodi@email.com'
    fill_in 'Interesting Fact About You:', with: 'Olympic skier'
    click_button 'Submit'

    expect(guest.reload.rsvped).to eq true
    expect(guest.housing).to eq 'Hotel'
    expect(guest.attending).to eq true
    expect(guest.fact).to eq 'Olympic skier'

    expect(page).to have_content 'Success'
  end

end
