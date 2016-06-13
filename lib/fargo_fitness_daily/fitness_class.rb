class FargoFitnessDaily::FitnessClass
  attr_accessor :name, :location, :time, :instructor, :url, :categories
  @@all = []
  @@all_categories = ["yoga", "yoga flow", "gentle yoga", "dance", "aerobics", "weight lifting", "cardio"]
  def self.today
    FargoFitnessDaily::Scraper.new
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

  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end



end
