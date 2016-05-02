module Requests
  module JsonHelpers
    def json_data
      response = responce_body_as_json['data']
      response.kind_of?(Array) ? response.first : response
    end

    private
    def responce_body_as_json
      JSON.parse(response.body)
    end
  end
end