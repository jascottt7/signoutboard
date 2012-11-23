class Attendance < ActiveRecord::Base
  attr_accessible :comment, :employee_id, :out_of_office, :reason, :return_time, :return_time_string
  belongs_to :employee

  def signout
   self.out_of_office = 'true'
   self.save
  end
  
  def signin
   self.out_of_office = 'false'
   self.comment = ''
   self.return_time = ''
   self.reason = ''
   self.save
  end
  
 
  def time_to_next_quarter_hour(time)
    array = time.to_a
    quarter = ((array[1] % 60) / 15.0).ceil
    array[1] = (quarter * 15) % 60
    Time.local(*array) + (quarter == 4 ? 3600 : 0)
  end  
  
def return_time_string
    return_time = Time.now
    return_time = time_to_next_quarter_hour(return_time + 1.hour)
    return_time = return_time.strftime("%a %b %e %l:%M %P")
  end

  def return_time_string=(return_time_str)
    self.return_time = DateTime.parse(return_time_str)
    rescue ArgumentError
        @return_time_invalid = true
  end
  
  def validate
    errors.add(:return_time, "is invalid") if @return_time_invalid
  end
end
