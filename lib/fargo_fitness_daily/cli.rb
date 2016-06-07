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
    @classes = FargoFitnessDaily::FitnessClass.today
    @classes.each.with_index(1) do |fitclass, i|
      puts "#{i}. #{fitclass.name} - #{fitclass.location} - #{fitclass.instructor} - #{fitclass.time}"
    end
    # class method FitnessClass today that returns all classes for today
    # should return an array of classes
    @classes
  end

  def menu
    input = nil
    until input == "exit"
      puts "Enter the number of the class you'd like more information on or type list to see the deals again or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= @classes.count
        fitclass = @classes[input.to_i - 1]
        puts "#{fitclass.name} - #{fitclass.location} - #{fitclass.instructor} - #{fitclass.time}\n#{fitclass.url} \n\n" 
      elsif input == "list"
        list_classes
      else
        puts "Not sure what you want? Type list or exit." unless input == "exit"
      end
    end
  end

  def goodbye
    puts "Have fun at class! You'll feel great after! See you tomorrow!"
  end


end
