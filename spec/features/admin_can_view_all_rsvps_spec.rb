require 'rails_helper'
require 'login_helper'

RSpec.feature 'registered guest can rsvp' do
  scenario 'they add information and update guest' do
    guest = Guest.create(first_name1: 'Barney', last_name2: 'Doure', code: 'admin', role: 'Admin', rsvped: true, attending: true)
    guest = Guest.create(first_name1: 'Jodi', last_name2: 'Salcedo', code: 'abc123', role: 'guest', rsvped: true, attending: true)
    guest = Guest.create(first_name1: 'Sam', last_name2: 'Coronado', code: '224', role: 'guest', rsvped: true, attending: true)
    guest = Guest.create(first_name1: 'Lucy', last_name2: 'Lamar', code: '332', role: 'guest', rsvped: true, attending: true)
    guest = Guest.create(first_name1: 'Amanda', last_name2: 'Beamer', code: '23523', role: 'guest', rsvped: true, attending: false)

    visit root_path

    admin_login

    expect(current_path).to eq welcome_path

    click_on 'Guest Information'

    expect(current_path).to eq guest_index_path

    expect(page).to have_content 'Jodi'
    expect(page).to have_content 'Sam'
    expect(page).to have_content 'Lucy'
    expect(page).to have_content 'Amanda'

    click_on 'Logout'

    expect(current_path).to eq login_path
  end

end
