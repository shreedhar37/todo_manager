class User < ActiveRecord::Base
  def to_pleasant_string
    "#{id}. #{first_name}"
  end
end
