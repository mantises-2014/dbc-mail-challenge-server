before "/api/:email/messages*" do
  halt 403, "Invalid token" if api_token.nil?

  # /messages/count requests are exempt from rate limiting
  if request.path_info.match(/count$/)
    api_token.record_request!
    halt 429, "Too many requests" if api_token.throttled?
  end

  halt 502, "Server error due to white whale impalement." if Random.rand(20) == 19
  halt 404, "Email address not found." if EmailAddress.find_by(email_address: params[:email]).nil?
end

get "/api/:email/messages" do
  email_address = EmailAddress.find_by(email_address: params[:email])

  content_type :xml
  email_address.messages.order("id desc").limit(50).to_xml
end

get "/api/:email/messages/count" do
  email_address = EmailAddress.find_by(email_address: params[:email])
  count = email_address.messages.order("id DESC").where("id > ?", params[:last_id]).count.to_s

  content_type :xml
  {count: count}.to_xml
end
