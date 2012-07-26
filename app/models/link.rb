class Link < ActiveRecord::Base
  attr_accessible :url, :title
  #Collapse all url validations into one line, same for title, then move format into lib w/ regex as per railscast 211
  validates_presence_of :url, :title
  validates_uniqueness_of :url
  validates_format_of :url, :with => /[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix, :on => :create, :message => "Must be a valid url"

  validate :less_than_fifteen_minutes_from_creation, :on => :update

  has_many :votes
  has_many :comments, :as => :commentable
  belongs_to :user
  

  paginates_per 20

  private

    def less_than_fifteen_minutes_from_creation
      if (Time.now - self.created_at) > 900
        errors.add(:url, "can't  modify after 15 minutes from creation")
      end
    end
end
