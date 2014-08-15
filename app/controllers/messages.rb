get "/api/:email/messages" do
  unless ApiToken.find_by(token: params[:api_token])
    status 403
    return "Invalid token"
  end
  if email_address = EmailAddress.find_by(email_address: params[:email])
    content_type :xml
    email_address.messages.limit(50).to_xml
  else
    status 404
    "Email address not found."
  end
end
