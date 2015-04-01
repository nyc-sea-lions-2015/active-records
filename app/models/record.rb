class Record < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :tracks

  def find_owner(user_id)
    User.find_by(id:user_id).username
  end

end
