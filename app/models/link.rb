class Link < ActiveRecord::Base
  attr_accessible :url
  validates_presence_of :url
  validates_uniqueness_of :url
  validates_format_of :url, :with => /[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix, :on => :create, :message => "Must be a valid url"

  belongs_to :user
  paginates_per 20
end
