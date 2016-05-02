require 'rails_helper'

describe Sale do

  context 'given a datetime like 20000101 0700, sale' do
    # let(:sale) { FactoryGirl.create(:sale, datetime: ...) } # could be used when this project grows
    sales = Sale.create! [{datetime: "20000101 0700".to_datetime, password: '123'}]

    it 'should have a time like 0700' do
      expect(sales.first.time).to eq('0700')
    end

    it 'should have a date like 20000101' do
      expect(sales.first.date).to eq('20000101')
    end
  end

  context 'given a date and time like 20000101 and 0700, sale' do
    sales = Sale.create! [{date: "20000101", time: "0700", password: '123'}]

    it 'should have a time like 0700' do
      expect(sales.first.time).to eq('0700')
    end

    it 'should have a date like 20000101' do
      expect(sales.first.date).to eq('20000101')
    end
  end

  context 'given a password' do
    before(:each) do
      #TODO: DRY up (also used elsewhere)
      sale_params = single_sale[:sales].first
      @sale = Sale.create! sale_params.merge!(password: '123')
    end

    it "should create a sale with a hashed password" do
      expect(@sale.hashed_password).to be_truthy
    end

    it "should find a sale give its id and password" do
      expect(Sale.find_with_password(@sale.id, "123")).to eq(@sale)
    end

    it "should not find a sale give its id and incorrect password" do
      expect(Sale.find_with_password(@sale.id, "1234")).to be_nil
    end
  end
end