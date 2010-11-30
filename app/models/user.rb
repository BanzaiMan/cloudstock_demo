class User < ActiveRecord::Base
  validates_length_of :name, :minimum => 5
end
