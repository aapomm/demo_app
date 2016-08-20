class TextSender

  def initialize mobile_number
    @body = {
      :mobile_number => mobile_number,
      :shortcode => Figaro.env.shortcode,
      :client_id => Figaro.env.chikka_client_id,
      :secret_key => Figaro.env.chikka_secret_key
    }
  end

  def send_reply message, request_id
    reply_body = {
      :message_type => 'REPLY',
      :request_cost => 'FREE',
      :message_id => generate_message_id,
      :message => message,
      :request_id => request_id
    }

    headers = {}
    request_body = @body.merge reply_body

    rest_client = RestClient.new Figaro.env.chikka_endpoint, {:use_ssl => true}
    rest_client.post headers, request_body, {}
  end



  private

  def generate_message_id
    Time.now.strftime '%Y%m%d%H%M%S%L'
  end

end
