class ApiToken < ActiveRecord::Base
  # Remember to create a migration!

  before_validation :generate_token, on: :create

  def generate_token
    self.token = SecureRandom.hex
  end

  def throttled?
    !throttled_at.nil?
  end

  def throttle_requests
    if (request_count.nil? || request_count < 20) || (throttled_at && throttled_at < 1.minute.ago)
      self.throttled_at = nil
    else
      self.throttled_at = Time.now
    end
  end

  def record_request!
    if updated_at > 10.minutes.ago
      throttle_requests
      self.request_count ||= 0
      self.request_count += 1
      save!
    else
      update!(request_count: 0)
    end
  end

end
