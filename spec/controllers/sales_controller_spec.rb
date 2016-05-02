require 'rails_helper'

describe SalesController do
  # See requests/sales_spec.rb
  let :multiple_sales do
    {
      sales: [
        {
          date: '20140103',
          time: '0700',
          code: 'FL',
          value: '2.00'
        },
        {
          date: '20140103',
          time: '0815',
          code: 'DO',
          value: '1.00'
        }
      ]
    }
  end

  describe 'Create' do
    before(:each) do
      @params = multiple_sales.merge(hashed_password: 'correct')
    end

    it 'can create' do
      post :create, @params
      expect(response).to be_success
      parsed_response = JSON.parse(response.body)
    end

    it 'creates sales' do
      expect { post :create, @params }.to change(Sale, :count).by(2)
    end

    it 'creates sales only if password is valid' do
      @params[:hashed_password] = 'wrong'
      expect { post :create, @params }.to change(Sale, :count).by(0)
    end

    it 'returns and 403 if password is invalid' do
      @params[:hashed_password] = 'wrong'
      post :create, @params
      expect(response).to have_http_status(403)
    end

    # it 'creates a sale with the correct date and time' do
    #   post :create, @params
    #   expect(json_data['code']).to eq('DO')
    # end

    # TODO: What about invalid params?
  end

  # describe 'Show' do
  #   it 'can show a sale' do

  #   end
  # end

  # describe 'Destroy' do
  #   # The question does not mention passwords for destroying a sale

  #   it 'can destroy' do

  #   end
  # end
end