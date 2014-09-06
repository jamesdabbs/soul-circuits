class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :playlist

  validates_uniqueness_of :playlist, scope: :user
end
