require 'rails_helper'

describe SalesController do
  # Also see requests/sales_spec.rb

  describe 'Create' do

    context 'with a password' do
      before(:each) do
        @params = multiple_sales.merge(password: '1234')
      end

      it 'can create' do
        post :create, @params

        expect(response).to be_success
        expect(json_data_array.first['code']).to eq('FL')
        expect(json_data_array.first['date']).to eq('20140103')
        expect(json_data_array.first['hashed_password']).to be_truthy
      end

      it 'creates sales' do
        expect { post :create, @params }.to change(Sale, :count).by(2)
      end

      # xit 'creates a sale with the correct date and time' do
      #   # See request_spec
      # end
    end

    # TODO: What about other invalid params?
    context 'without password' do
      it 'returns an error' do
        post :create, multiple_sales
        expect(response).to have_http_status(:bad_request)
      end
    end

  end

  # Show and Destroy not covered here (yet) as it is tested in request_spec
  # describe 'Show' do
    # it 'returns an error if password is missing' do
    #   ...
    #   expect(response).to have_http_status(403)
    # end
  # end

  # describe 'Destroy' do
  #   # The question does not mention passwords for destroying a sale
  #   it 'can destroy' do
  #     ...
  #   end
  # end
end