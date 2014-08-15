get "/api_tokens/new" do
  erb :"api_tokens/new"
end

post "/api_tokens" do
  @api_token = ApiToken.create!(params[:api_token])
  redirect "/api_tokens/#{@api_token.id}"
end

get "/api_tokens/:id" do
  @api_token = ApiToken.find(params[:id])
  erb :"api_tokens/show"
end
