class Game < ActiveRecord::Base
  belongs_to :host, class_name: :User
  belongs_to :traveler, class_name: :User


  def format_date
    str_time = self.date + " " + self.time
    time = Time.parse(str_time)
    time.strftime("%A, %b %d %I:%M: %p")
  end
end
