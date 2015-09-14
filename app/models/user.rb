class User < ActiveRecord::Base
  has_many :jawbones
  
  validates :xid, presence: true, uniqueness: true
  validates :e_num1, presence: true
  validates :password, presence: true
end
