require 'rails_helper'

# http://matthewlehner.net/rails-api-testing-guidelines/ used as a starting point
describe "Sales API" do
  # let (:sales) {[
  #   {
  #     date: '20140103',
  #     time: '0700',
  #     code: 'FL',
  #     value: '2.00'
  #   },
  #   {
  #     date: '20140103',
  #     time: '0815',
  #     code: 'DO',
  #     value: '1.00'
  #   }
  # ]}
  # let (:sale) {sales.first}

  it 'retrieves a specific sale' do
    # # sale = FactoryGirl.create(:sale) # FactoryGirl could be used when this project grows

    # get "/sales/#{sale.id}"
    get "/sales/1.json"

    # # test for the 200 status-code
    expect(response).to be_success

    # # check that the sale attributes are the same.
    # expect(json['content']).to eq(sale.content)

    # # ensure that private attributes aren't serialized
    # # expect(json['private_attr']).to eq(nil)
  end
end