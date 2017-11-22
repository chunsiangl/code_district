require 'rails_helper'

RSpec.feature "SignIns", type: :feature do
	describe 'sign in' do
		before(:each) do
			User.create(first_name: 'k', last_name: 'k', email: 'k@k.com', password: '1111111')
		end

		it 'signs in and show homepage title' do
			visit '/login'
			within('form[action="/login"]') do
				fill_in 'email', with: 'k@k.com'
				fill_in 'password', with: '1111111'
			end
			click_button 'Submit'
			expect(page).to have_content 'Welcome to Code District'
			end
		end  
end
