class FargoFitnessDaily::FitnessClass
  attr_accessor :name, :location, :time, :instructor, :url
  def self.today
    # this should return all instances of FitnessClass
    # puts <<-DOC.gsub /^\s*/, ""
    #   1. Raw Groove - Family Wellness- 8 AM
    #   2. Connective Tissue Restorative - Sacred Earth - 11 AM
    #   3. Hot Detox Yoga - Mojo - 4 PM
    #   4. Dance Mixx - Jazzercise Fargo The PRACS Building - 5:45 PM
    #   5. Restorative - Mojo - 7 PM
    #   6. Zumba - Family Wellness - 7 PM
    # DOC

    #scrape all fitness locations to collect class information for that day
    self.scrape_class_schedules
  end

  def self.scrape_class_schedules
    # Sites to search:
    # Family Wellness
    # Mojo
    # Ecce
    # Jazzercise
    # Sacred Earth
    # Spirit Room
    # Zero Gravity Fitness

      classes = [class_1, class_2, class_3]
      classes << self.scrape_mojo
      classes << self.scrape_family_wellness
      classes << self.scrape_jazzercise
      classes << self.scrape_ecce
      classes << self.scrape_sacred_earth
      classes << self.scrape_zg
      classes << self.scrape_spirit

      class_1 = FargoFitnessDaily::FitnessClass.new
      class_1.name = "Raw Groove"
      class_1.location = "Family Wellness"
      class_1.time = "8 AM"
      class_1.instructor = "Jeanne"
      class_1.url = "http://www.familywellnessfargo.org/fitness/group-fitness/"

      class_2 = FargoFitnessDaily::FitnessClass.new
      class_2.name = "Dance Mixx"
      class_2.location = "Jazzercise Fargo The PRACS Building"
      class_2.time = "5:45 PM"
      class_2.instructor = "Nicole"
      class_2.url = "http://jcls.jazzercise.com/facility/jazzercise-fargo-the-pracs-building"

      class_3 = FargoFitnessDaily::FitnessClass.new
      class_3.name = "Gentle Yoga"
      class_3.location = "Ecce Yoga"
      class_3.time = "12 PM"
      class_3.instructor = "Brenda"
      class_3.url = "https://calendar.google.com/calendar/render?cid=4nhnmmset6f8ehr9d798pqhg5s%40group.calendar.google.com#main_7"


      deals
    end

    def self.scrape_mojo
      # go to mojo, find the day and classes
      # instantiate a class for each class offered that day
      # return an array of classes created here?
    end

    def self.scrape_family_wellness
      # go to family wellness, find the day and classes
      # instantiate a class for each class offered that day
      doc = Nokogiri::HTML(open("http://www.familywellnessfargo.org/fitness/group-fitness/"))

      # first get day of the week to move to that section of the schedule. require 'date' to use Date
      #.strftime info http://ruby-doc.org/stdlib-2.1.1/libdoc/date/rdoc/Date.html#method-i-strftime
      day = Date.today.strftime("%A")

      # using date collect that day's classes and 
      binding.pry
    end

    def self.scrape_jazzercise
      # go to jazzercise, find the day and classes
      # instantiate a class for each class offered that day
    end

    def self.scrape_ecce
      # go to ecce, find the day and classes
      # instantiate a class for each class offered that day
    end

    def self.scrape_sacred_earth
      # go to sacred earth, find the day and classes
      # instantiate a class for each class offered that day
    end

    def self.scrape_zg
      # go to zero gravity, find the day and classes
      # instantiate a class for each class offered that day
    end

    def self.scrape_spirit
      # go to spirit room, find the day and classes
      # instantiate a class for each class offered that day
    end
end
