module UsersHelper
	 def calculate_completition(user)
	    user.percentage = 50
	    if user.facebook != ""
	      user.percentage += 10
	      ## @author : Ayatallah
	      ## Increase User points by 50 when user input his facebook account link
	      user.points += 50
	    end
	    if user.twitter != ""
	      user.percentage += 10
	      ## @author : Ayatallah
	      ## Increase User points by 50 when user input his twitter account link
	      user.points += 50
	    end
	    if user.googleplus != ""
	      user.percentage += 10
	      ## @author : Ayatallah
	      ## Increase User points by 50 when user input his g+ account link
	      user.points += 50
	    end
	    if user.age > 0
	      user.percentage += 10
	      ## @author : Ayatallah
	      ## Increase User points by 50 when user input his age
	      user.points += 50
	    end
	    if user.car_model != ""
	      user.percentage += 10
	      ## @author : Ayatallah
	      ## Increase User points by 50 when user input his car model
	      user.points += 50
    end
end
end
