class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :records, dependent: :destroy
  validates :name, presence: true, length: { minimum: 5 }
  validates :content, presence: true, length: {minimum: 50}
end
