get "/accounts/new" do
  @email_address = EmailAddress.new
  erb :"accounts/new"
end

post "/accounts" do
  @email_address = EmailAddress.new
  if @email_address.save
    erb :"accounts/success"
  else
    erb :"accounts/new"
  end
end
