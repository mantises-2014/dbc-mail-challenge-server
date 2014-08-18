helpers do
  def api_token
    @api_token ||= ApiToken.find_by(token: params[:api_token])
  end
end
