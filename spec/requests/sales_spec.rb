require 'rails_helper'

# http://matthewlehner.net/rails-api-testing-guidelines/ used as a starting point
describe "Sales API" do

  describe 'GET' do

    before(:each) do
      # sale = FactoryGirl.create(:sale) # FactoryGirl could be used when this project grows
      sale_params = single_sale[:sales].first
      @sales = Sale.create! [ sale_params.merge!(password: '123') ]
    end

    it 'retrieves a specific sale with password' do
      get "/sales/#{@sales.first.id}.json", password: '123'

      # test for the 200 status-code
      expect(response).to be_success

      # check that the sale attributes are the same.
      expect(json_data['code']).to eq('DO')

      expect(json_data['hashed_password']).to be_truthy
    end

    it 'returns and error if password not specified' do
      get "/sales/#{@sales.first.id}.json"

      expect(response).to have_http_status(:not_found)
    end

    it 'returns error for wrong password' do
      get "/sales/#{@sales.first.id}.json", password: 'wrong'

      # TODO: staus: 403 if sale with id exists but password does not match
      # e.g. expect(response).to have_http_status(403)
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST' do

    it 'creates sales with the correct date and time' do
      # TODO: DRY up (this is used elsewhere)
      params = multiple_sales.merge(password: 'correct')

      post "/sales", params

      expect(json_data_array.first['date']).to eq('20140103')
      expect(json_data_array.last['date']).to eq('20140103')

      expect(json_data_array.first['time']).to eq('0700')
      expect(json_data_array.last['time']).to eq('0815')
    end

    it 'creates a sale with the correct date and time' do
      # TODO: DRY up (this is used elsewhere)
      params = single_sale.merge(password: 'correct')

      post "/sales", params

      expect(json_data.first['date']).to eq('20140103')
      expect(json_data.first['time']).to eq('0815')
    end
  end

  describe 'DELETE' do
    # The question does not mention passwords for destroying a sale
    sale_params = single_sale[:sales].first
    sale = Sale.create! sale_params.merge!(password: '123')
    sale.reload

    it 'destroys a sale' do
      expect{ delete "/sales/#{sale.id}"}.to change(Sale, :count).by(-1)
    end
  end

end