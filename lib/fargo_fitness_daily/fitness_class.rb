class FargoFitnessDaily::FitnessClass
  @@all = []

  def self.today
    # this should return all instances of FitnessClass
    @@all
    puts <<-DOC.gsub /^\s*/, ""
      1. Raw Groove - Family Wellness- 8 AM
      2. Connective Tissue Restorative - Sacred Earth - 11 AM
      3. Hot Detox Yoga - Mojo - 4 PM
      4. Dance Mixx - Jazzercise Fargo The PRACS Building - 5:45 PM
      5. Restorative - Mojo - 7 PM
      6. Zumba - Family Wellness - 7 PM
    DOC
    class_1 = FitnessClass.new
    class_1.name = "Raw Groove"
    class_1.location = "Family Wellness"
    class_1.time = "8 AM"
    class_1.instructor = "Jeanne"
    class_1.url = "http://www.familywellnessfargo.org/fitness/group-fitness/"

    class_2 = FitnessClass.new
    class_2.name = "Dance Mixx"
    class_2.location = "Jazzercise Fargo The PRACS Building"
    class_2.time = "5:45 PM"
    class_2.instructor = "Nicole"
    class_2.url = "http://jcls.jazzercise.com/facility/jazzercise-fargo-the-pracs-building"

    class_3 = FitnessClass.new
    class_3.name = "Gentle Yoga"
    class_3.location = "Ecce Yoga"
    class_3.time = "12 PM"
    class_3.instructor = "Brenda"
    class_3.url = "https://calendar.google.com/calendar/render?cid=4nhnmmset6f8ehr9d798pqhg5s%40group.calendar.google.com#main_7"


  end

end
