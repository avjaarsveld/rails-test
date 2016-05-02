module Requests
  module JsonHelpers
    def json_data
      response = responce_body_as_json['data']
      response.kind_of?(Array) ? response.first : response
    end

    # Not nessesarily an array but that would become apparent where this is used (test would fail)
    def json_data_array
      response = responce_body_as_json['data']
    end

    private
    def responce_body_as_json
      JSON.parse(response.body)
    end
  end
end