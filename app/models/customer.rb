class Customer < ApplicationRecord
  validates :name, presence: true
  def error_full_messages
    self.errors.full_messages.collect do |message|
      ERROR_MESSAGES_TO_REPLACE[message] || message
    end
  end
end
