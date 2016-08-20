class GoogleApi

  GOOGLE_ENDPOINT =
    "https://maps.googleapis.com/maps/api/directions/json?mode=transit&" +
    "key=#{::Figaro.env.google_api_key}"

  def get_directions origin, destination
    url = GOOGLE_ENDPOINT + "&origin=#{origin}" + "&destination=#{destination}"

    puts url

    response = RestClient.new(url, :use_ssl => true).get

    JSON.parse(response)
  end

end
