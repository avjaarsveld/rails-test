# Not nessesarily an array but that would become apparent where this is used (test would fail)
def json_data_array
  json_data
end

def json_data
  JSON.parse(response.body)['data']
end

def multiple_sales
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

def single_sale
  {
    sales: [
      {
        date: '20140103',
        time: '0815',
        code: 'DO',
        value: '1.00'
      }
    ]
  }
end