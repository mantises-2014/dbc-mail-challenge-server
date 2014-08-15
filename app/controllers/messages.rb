get "/api/:email/messages" do
  if @api_token = ApiToken.find_by(token: params[:api_token])
    @api_token.record_request!
    if @api_token.throttled?
      status 429
      return "Too many requests."
    end
    if Random.rand(20) == 19
      status 502
      return "Server error due to white whale impalement."
    end
    if email_address = EmailAddress.find_by(email_address: params[:email])
      content_type :xml
      email_address.messages.limit(50).to_xml
    else
      status 404
      "Email address not found."
    end
  else
    status 403
    return "Invalid token"
  end

end
