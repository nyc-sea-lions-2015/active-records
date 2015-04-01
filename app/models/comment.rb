class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :record

  def find_author(user_id)
    User.find_by(id:user_id).username
  end
end
