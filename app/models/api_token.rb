class ApiToken < ActiveRecord::Base
  # Remember to create a migration!

  before_validation :generate_token, on: :create

  def generate_token
    self.token = Random.rand.to_s
  end

end
