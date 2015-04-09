module UsersHelper
	 def calculate_completition(user)
	    user.percentage = 50
	    if user.facebook != ""
	      user.percentage += 10
	    end
	    if user.twitter != ""
	      user.percentage += 10
	    end
	    if user.googleplus != ""
	      user.percentage += 10
	    end
	    if user.age > 0
	      user.percentage += 10
	    end
	    if user.car_model != ""
	      user.percentage += 10
    end
end
end
