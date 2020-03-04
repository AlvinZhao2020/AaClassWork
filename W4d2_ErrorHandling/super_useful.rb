# PHASE 2
# def convert_to_int(str)
#   Integer(str)
#   rescue ArgumentError
#    p "try to in put a number "
#    nil
#   rescue TypeError
#    p "wrong data type"
#    nil
#   ensure
#     p " no worries "
  
# end

# # PHASE 3
# FRUITS = ["apple", "banana", "orange"]
# class CoffeeErr < StandardError; end 
# class OtherErr < StandardError; end 
# def reaction(maybe_fruit)
#   if FRUITS.include? maybe_fruit
#     puts "OMG, thanks so much for the #{maybe_fruit}!"
#   elsif  maybe_fruit == "coffee"
#     raise CoffeeErr
#   else
#     raise OtherErr
#   end 
# end

# def feed_me_a_fruit
#   begin
#     puts "Hello, I am a friendly monster. :)"

#     puts "Feed me a fruit! (Enter the name of a fruit:)"
#     maybe_fruit = gets.chomp
  
#     reaction(maybe_fruit) 
#     rescue OtherErr
#         puts "u give me some strange thing "
#     rescue CoffeeErr
#         puts "coffee helps alot , but feed me fruit pls"
#         retry
#   end
# end  

# PHASE 4
class LessThanFiveErr < StandardError; end 
class StrNameErr < StandardError;end
class BestFriend 
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    if @yrs_known < 5
    raise LessThanFiveErr.new("Friendship less than 5 year is nothing ") 
    end
    if @name.length == 0 || @fav_pastime.length == 0
    raise StrNameErr.new("u set an empty string when initialize") 
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


