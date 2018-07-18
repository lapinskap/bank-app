class BankAccount < ApplicationRecord
  belongs_to :client

  validates :client, presence: true
  validates :account_number, presence: true, uniqueness: true
  validates :balance, presence: true, numericality: true

  before_validation :load_defaults
  
  has_many :account_transactions

  def to_s
    account_number
  end

  def load_defaults
    if self.new_record?
      self.balance = 0.00
    end
  end

end
