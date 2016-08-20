class RestClient

  def initialize uri, options = {}
    @uri = URI.parse uri
    @http = Net::HTTP.new @uri.host, @uri.port
    @http.use_ssl = options[:use_ssl]
    @http.verify_mode = options[:verify_mode]
  end

  def post headers = {}, body = {}, options = {:as_json => false}
    @request = Net::HTTP::Post.new @uri.request_uri
    self.set_headers headers
    self.set_body body, options[:as_json]

    @http.request(@request).body
  end

  def get headers = {}
    @request = Net::HTTP::Get.new @uri.request_uri
    self.set_headers headers

    @http.request(@request).body
  end


  protected

  def set_headers headers
    headers.each { |key, val| @request[key] = val } if headers.any?
  end

  def set_body body, as_json
    if as_json
      @request.body = body
    else
      @request.set_form_data body
    end
  end

end
