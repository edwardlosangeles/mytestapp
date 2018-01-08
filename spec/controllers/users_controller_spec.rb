# RSpec Functional Tests

require 'rails_helper'

describe UsersController, type: :controller do

	let(:user1) { User.create!(email: 'test1@example.com', password: '1234567890') }
	let(:user2) { User.create!(email: 'test2@example.com', password: '1234567890') }

	describe 'GET #show' do

		context 'when a user is logged in' do

			before do
				sign_in user1
			end
			
			it 'loads correct user details' do
				get :show, params: { id: user1.id }
				expect(response).to be_ok
				expect(assigns(:user)).to eq user1
				# added myself, don't know if this is right
				expect(response).to render_template('show')
			end

			it 'redirects to root_path if get show of another user' do
				get :show, params: { id: user2.id }
				expect(response).to_not be_ok
				expect(response).to redirect_to(new_user_session_path)
			end

		end # context 'when a user is logged in'

		context 'when a user is not logged in' do

			it 'redirects to login' do
				get :show, params: { id: user1.id }
				expect(response).to redirect_to(new_user_session_path)
			end

		end # context 'when a user is not logged in'

	end # describe 'GET #show'

end # describe UsersController