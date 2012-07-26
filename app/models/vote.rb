class Vote < ActiveRecord::Base
  attr_accessible :user_id, :votable_id, :votable_type, :down, :up
  belongs_to :votable, :counter_cache => true, :polymorphic => true

  validate :not_users_own_votable, :on => :create
  validate :unique_user_vote_on_votable, :on => :create
  validate :up_or_down_not_both_true, :on => :create
  validate :up_or_down_not_both_nil, :on => :create

  private
    def not_users_own_votable
      if self.votable.user_id == self.user_id
        errors.add(:user_id, "can't vote on your own items")
      end
    end

    def unique_user_vote_on_votable
      if !Vote.find_by_user_id_and_votable_id(self.user_id, self.votable_id).nil?
        errors.add(:user_id, "can't vote on something twice")
      end
    end

    def up_or_down_not_both_true
      if !self.down.nil? && !self.up.nil?
        errors.add(:user_id, "can't vote both up and down")
      end
    end

    def up_or_down_not_both_nil
      if self.down.nil? && self.up.nil?
        errors.add(:user_id, "must vote either up or down")
      end
    end
end
