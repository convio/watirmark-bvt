module WatirmarkBVT
  module RestClientHelpers

    def rest_url
      "http://#{WatirmarkBVT.hostname}:8080/rest"
    end

    def rest_request(url_part, params=nil)
      payload = {:accept => :json}
      payload.merge!(:params => params) if params
      JSON.parse RestClient.get "#{rest_url}/#{url_part}", payload
    end

  end
end