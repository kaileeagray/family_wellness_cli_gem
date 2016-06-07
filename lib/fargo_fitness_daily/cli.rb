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
    puts <<-DOC.gsub /^\s*/, ""
      1. Raw Groove - Family Wellness - 8 AM
      2. Connective Tissue Restorative - Sacred Earth - 11 AM
      3. Hot Detox Yoga - Mojo - 4 PM
      4. Dance Mixx - Jazzercise Fargo The PRACS Building - 5:45 PM
      5. Restorative - Mojo - 7 PM
      6. Zumba - Family Wellness - 7 PM
    DOC
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
