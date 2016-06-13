#Our CLI controller. input, welcoming - deal with user

class FargoFitnessDaily::CLI

  def call
    menu
    FargoFitnessDaily::FitnessClass.today
    goodbye
  end

  def menu
    # puts "Enter all to see all fitness classes at your gyms in Fargo. Enter yoga to see all yoga classes. Enter dance to see all dance classes."
    list_classes
  end

  def list_classes
    #get classes from sites - this is fake, for now
    #how will I get this data?
    puts "Today's fitness classes in Fargo:"
    @classes = FargoFitnessDaily::FitnessClass.all
    @classes.each.with_index(1) do |fitclass, i|
      puts "#{i}. #{fitclass.name} - #{fitclass.location} - #{fitclass.instructor} - #{fitclass.time}"
    end
    more_info
  end


  def more_info
    input = nil
    until input == "exit"
      puts "Enter the number of the class you'd like more information on, type list to see the classes again, or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= @classes.count
        fitclass = @classes[input.to_i - 1]
        puts "Name: #{fitclass.name} \nLocation: #{fitclass.location} \nInstructor: #{fitclass.instructor} \nTime: #{fitclass.time}\nURL: #{fitclass.url}"
        puts "This class has the following tags:"
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
