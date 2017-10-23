require 'rails_helper'

def admin_login
  expect(current_path).to eq login_path

  fill_in 'Password :', with: "admin"
  click_on 'Submit'
end
