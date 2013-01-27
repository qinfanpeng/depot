class User < ActiveRecord::Base
 attr_accessible :password, :name

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true

  def self.authenticate(name, password)
    user = find_by_name name
    if user and user.password == password
      user
    end
  end

end
