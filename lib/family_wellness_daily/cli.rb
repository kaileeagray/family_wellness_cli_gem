#Our CLI controller. input, welcoming - deal with user

class FamilyWellnessDaily::CLI

  def call
    puts "Please wait while the classes load. This may take up to xx minutes."
    FamilyWellnessDaily::FitnessClass.today
    list_classes
    more_info
    goodbye
  end

  # def menu
  #   would like to print by category or time
  # end

  def list_classes
    #get classes from sites
    puts "Today's fitness classes at Family Wellness in Fargo:"
    @classes = FamilyWellnessDaily::FitnessClass.all
    @classes.each.with_index(1) do |fitclass, i|
      puts "#{i}. #{fitclass.name} - #{fitclass.time}"
    end
  end


  def more_info
    input = nil
    until input == "exit"
      puts "\n\nEnter the number of the class you'd like more information on, type list to see the classes again, or type exit:"
      input = gets.strip.downcase
      puts "\n\n"
      if input.to_i > 0 && input.to_i <= @classes.count
        fitclass = @classes[input.to_i - 1]
        puts "Name: #{fitclass.name} \nStudio: #{fitclass.studio} \nInstructor: #{fitclass.instructor} \nTime: #{fitclass.time}"
        tags = ""
        fitclass.categories.each do |category|
           tags << category + ", "
         end
         puts "This class has the following tags: #{tags.chop.chop}"
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
