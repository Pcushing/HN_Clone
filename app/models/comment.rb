class Comment < ActiveRecord::Base
  attr_accessible :body, :user_id, :commentable_id, :commentable_type  #, don't need this says railscast
  validates_presence_of :body, :user_id, :commentable_id, :commentable_type

  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable
end
