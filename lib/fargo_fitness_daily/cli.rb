#Our CLI controller. input, welcoming - deal with user

class FargoFitnessDaily::CLI

  def call
    list_classes
    menu
    goodbye
  end

  def list_classes
    #get classes from sites - this is fake, for now
    #how will I get this data?
    puts "Today's fitness classes in Fargo:"
    FargoFitnessDaily::FitnessClass.today
    # class method FitnessClass today that returns all classes for today
    # should return an array of classes
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the class you'd like more information on or type list to see the deals again or type exit:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on class 1..."
      when "2"
        puts "More info on class 2..."
      when "list"
        list_classes
      else
        puts "Not sure what you want? Type list or exit."
      end
    end
  end

  def goodbye
    puts "Have fun at class! You'll feel great after! See you tomorrow!"
  end


end
