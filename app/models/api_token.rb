class ApiToken < ActiveRecord::Base
  # Remember to create a migration!

  before_validation :generate_token, on: :create

  def generate_token
    self.token = Random.rand.to_s
  end

  def throttle?
    request_count >= 20
  end

  def record_request!
    if updated_at > 10.minutes.ago
      update!(request_count: (request_count || 0) + 1)
    else
      update!(request_count: 0)
    end
  end

end
