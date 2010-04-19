class User < ActiveRecord::Base
  acts_as_authentic
  has_many :user_privileges

  validates_uniqueness_of :username
  validates_uniqueness_of :email
  validates_format_of :email, :with => /([_a-z0-9-]+)(\.[_a-z0-9-]+)*@([a-z0-9-]+)(\.[a-zA-Z0-9\-\.]+)*(\.[a-z]{2,4})/

  def is_admin?
    user_privileges.each do |privilege|
      privilege.privilege == 'Admin'
      return true
    end
    false
  end

  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    UserMailer.deliver_password_reset_instructions(self)  
  end

  def set_phone_provileges
#    self.privilege = 'phone_person'
  end
  
  def set_money_provileges
#    self.privilege = 'money_person'
  end
  
  def set_normal_provileges
#    self.privilege = 'normal'
  end

end
