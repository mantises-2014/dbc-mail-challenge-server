class EmailAddress < ActiveRecord::Base
  has_many :messages

  after_create :create_messages

  def create_messages
    50.times do
      unassigned_messages = Message.unassigned
      if unassigned_messages.count > 0
        unassigned_messages.first.update! email_address: self
      end
    end
  end
end
