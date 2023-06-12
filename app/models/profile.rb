class Profile < ApplicationRecord
    belongs_to :user
    validates :name, :gender, :location, :birth, presence: true
  end
  