class Message < ActiveRecord::Base
  belongs_to :email_address

  def self.unassigned
    where(email_address_id: nil)
  end

end
