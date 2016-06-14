#Our CLI controller. input, welcoming - deal with user

class FargoFitnessDaily::CLI

  def call
    puts "Please wait while the classes load. This may take up to xx minutes."
    FargoFitnessDaily::FitnessClass.today
    list_classes
    more_info
    goodbye
  end

  # def menu
  #  eventually would like to print by category, location, time
  # end

  def list_classes
    #get classes from sites
    puts "Today's fitness classes in Fargo:"
    @classes = FargoFitnessDaily::FitnessClass.all
    @classes.each.with_index(1) do |fitclass, i|
      puts "#{i}. #{fitclass.name} - #{fitclass.location} - #{fitclass.instructor} - #{fitclass.time}"
    end
    # would like to print with location first, then list all classes at location to avoid redundancy
  end


  def more_info
    input = nil
    until input == "exit"
      puts "Enter the number of the class you'd like more information on, type list to see the classes again, or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= @classes.count
        fitclass = @classes[input.to_i - 1]
        puts "Name: #{fitclass.name} \nLocation: #{fitclass.location} \nInstructor: #{fitclass.instructor} \nTime: #{fitclass.time}\nURL: #{fitclass.url}"
        # puts "This class has the following tags:"
        # fitclass.categories.each do |category|
        #   puts category
        # end
        puts "\n\n"
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
