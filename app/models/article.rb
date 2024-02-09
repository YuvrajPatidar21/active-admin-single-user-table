class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true, length: {minimum: 10}

  before_save do
    self.title = title.titleize
    self.description = description.capitalize
  end
  after_save do
    user.add_role :author
  end

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
end
