require 'rails_helper'

# http://matthewlehner.net/rails-api-testing-guidelines/ used as a starting point
describe "Sales API" do
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
  # let (:sale) {sales.first}

  it 'retrieves a specific sale' do
    # sale = FactoryGirl.create(:sale) # FactoryGirl could be used when this project grows
    # sale = double('Sale', datetime: Time.now, code: 'SM', value: 3.0)
    sales = Sale.create! [{datetime: Time.now, code: 'DO', value: '1.00'}]

    # get "/sales/#{sale.id}"
    get "/sales/#{sales.first.id}.json"

    # # test for the 200 status-code
    expect(response).to be_success

    # # check that the sale attributes are the same.
    # expect(responce_body_as_json['content']).to eq(sale.content)
    expect(json_data['code']).to eq('DO')

    # # ensure that private attributes aren't serialized
    # # expect(responce_body_as_json['private_attr']).to eq(nil)
  end

  it 'creates a sale with the correct date and time' do
    params = multiple_sales.merge(hashed_password: 'correct')
    # post "/sales", @params
    post "/sales", params
    puts responce_body_as_json
    expect(json_data['code']).to eq('FL')
  end

end