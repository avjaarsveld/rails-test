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
    sales = Sale.create! [{date: '20140103', time: '0815', code: 'DO', value: '1.00'}]

    get "/sales/#{sales.first.id}.json"

    # test for the 200 status-code
    expect(response).to be_success

    # # check that the sale attributes are the same.
    expect(json_data['code']).to eq('DO')

    # # ensure that private attributes aren't serialized
    # # expect(responce_body_as_json['private_attr']).to eq(nil)
  end

  it 'creates sales with the correct date and time' do
    # TODO: DRY up (this is used elsewhere)
    params = multiple_sales.merge(hashed_password: 'correct')

    post "/sales", params

    expect(json_data_array.first['date']).to eq('20140103')
    expect(json_data_array.last['date']).to eq('20140103')

    expect(json_data_array.first['time']).to eq('0700')
    expect(json_data_array.last['time']).to eq('0815')
  end

end