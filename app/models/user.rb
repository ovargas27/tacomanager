class User < ActiveRecord::Base
  acts_as_authentic
  has_many :user_privileges

  def is_admin?
    user_privileges.each do |privilege|
      privilege.privilege == 'Admin'
      return true
    end
    false
  end

end
