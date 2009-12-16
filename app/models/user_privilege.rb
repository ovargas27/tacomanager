class UserPrivilege < ActiveRecord::Base
  validates_numericality_of :user_id
  validates_presence_of :privilege
end
