class Task < ActiveRecord::Base

  attr_accessible :description, :complete, :due_date

end
