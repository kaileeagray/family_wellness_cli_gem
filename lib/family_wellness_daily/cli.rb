#Our CLI controller. input, welcoming - deal with user

class FamilyWellnessDaily::CLI

  def call
    puts "Please wait while the classes load. This may take up to 1 minute.\n\n"
    #get classes from site
    FamilyWellnessDaily::Scraper.new
    #after classes have loaded, ask user how to view classes
    menu
    goodbye
  end

  def menu
  input = nil
    until input == "exit"
      puts "Enter any fitness class category to view classes of that category. Enter help to view all categories. Enter exit to leave."
      input = gets.strip.downcase
      puts "-----------------------------------------------------------------------------------------------------------------------\n\n"
      if input == "help"
        puts "Enter any of the following categories to see which classes of that category are offered today."
        list_all_categories
        puts "You can also enter view all to see all the classes at Family Wellness today or you can type exit.\n\n"
      elsif input == "view all" || input == "view_all" || input == "view-all"
        list_all_classes
      elsif input != "exit" && FamilyWellnessDaily::FitnessClass.categories.include?(input)
        @current_category = input
        view_by_category
      elsif input != "exit"
        puts "Not sure what to input? Type help to get more info. Type exit to leave. Type view all to see all classes."
      elsif input == "exit"
        #added to allow menu to keep looping but not force user to type exit more than once
        goodbye
      end
    end
  end

  def list_all_categories
    puts "-----------------------------------------------------------------------------------------------------------------------"
    FamilyWellnessDaily::FitnessClass.categories.each do |category|
      puts category
    end
    puts "-----------------------------------------------------------------------------------------------------------------------"

  end

  def view_by_category
    @classes = FamilyWellnessDaily::FitnessClass.collect_by_category(@current_category)
    if @classes.count > 0
      puts "\n\nToday's #{@current_category} fitness classes at Family Wellness include:"
      list_classes
    else
      puts "\n\nSorry there are no #{@current_category} classes today."
      puts "-----------------------------------------------------------------------------------------------------------------------\n\n"
      menu
    end
  end

  def list_all_classes
    puts "Today's fitness classes at Family Wellness in Fargo:"
    @classes = FamilyWellnessDaily::FitnessClass.all
    if @classes.count > 0
      list_classes
    else
      puts "\n\nSorry there are no classes today."
      puts "-----------------------------------------------------------------------------------------------------------------------\n\n"
      menu
    end
  end

  def list_classes
    puts "-----------------------------------------------------------------------------------------------------------------------"
    @classes.each.with_index(1) do |fitclass, i|
      puts "#{i}. #{fitclass.name} - #{fitclass.time}"
    end
    more_info
  end


  def more_info
    input = nil
    until input == "exit"
      puts "\n\nEnter the number of the class you'd like more information on, type menu to return to starting menu, or type exit:"
      input = gets.strip.downcase
      puts "-----------------------------------------------------------------------------------------------------------------------\n\n"
      if input.to_i > 0 && input.to_i <= @classes.count
        fitclass = @classes[input.to_i - 1]
        puts "Name: #{fitclass.name} \nStudio: #{fitclass.studio} \nInstructor: #{fitclass.instructor} \nTime: #{fitclass.time}"
        tags = ""
        fitclass.categories.each do |category|
           tags << category + ", "
         end
         puts "This class has the following tags: #{tags.chop.chop}"
      elsif input == "menu"
        menu
      elsif input == "exit"
      #added to allow more_info to keep looping but not force user to type exit more than once
          goodbye
      else
        puts "Not sure what you want? Type menu, exit, or the number of of class you'd like more info about." unless input == "exit"
      end
    end
  end

  def goodbye
    puts "Have fun at class! You'll feel great after! See you tomorrow!\n\n"
    exit!
  end


end
