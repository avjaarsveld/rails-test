require 'rails_helper'

describe Sale do

  context 'given a datetime like 20000101 0700, sale' do
    # let(:sale) { FactoryGirl.create(:sale, datetime: ...) } # could be used when this project grows
    sales = Sale.create! [{datetime: "20000101 0700".to_datetime}]

    it 'should have a time like 0700' do
      expect(sales.first.time).to eq('0700')
    end

    it 'should have a date like 20000101' do
      expect(sales.first.date).to eq('20000101')
    end
  end

  context 'given a date and time like 20000101 and 0700, sale' do
    sales = Sale.create! [{date: "20000101", time: "0700"}]

    it 'should have a time like 0700' do
      expect(sales.first.time).to eq('0700')
    end

    it 'should have a date like 20000101' do
      expect(sales.first.date).to eq('20000101')
    end
  end
end