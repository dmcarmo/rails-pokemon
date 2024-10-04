module ApplicationHelper
  def trainer_age(age)
    if age > 1
      return "#{age} years old"
    else
      return "#{age} year old"
    end
  end
end
