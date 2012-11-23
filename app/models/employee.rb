class Employee < ActiveRecord::Base
  attr_accessible :branch_location, :cell_phone, :department, :ext, :fname, :lname, :position, :supervisor
  has_one :attendance, :dependent => :destroy
end
