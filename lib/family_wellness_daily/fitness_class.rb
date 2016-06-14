class FamilyWellnessDaily::FitnessClass
  attr_accessor :name, :time, :instructor, :categories, :studio
  @@all = []
  @@all_categories = ["cardio", "barre", "bodypump", "strength", "dance", "cycling", "interval training", "boxing", "yoga", "water exercise", "senior fitness"]

  def self.today
    FamilyWellnessDaily::Scraper.new
    # this should return all instances of FitnessClass
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def assign_categories
    case self.name.downcase
    when "bodypump ™", "bodypump ™ support instructor"
        self.categories = ["bodypump", "strength"]
      when "indoor cycling", "Cycle Craze"
        self.categories = ["cycling", "cardio"]
      when "hydro power"
        self.categories = ["water exercise", "strength"]
      when "muscle fitness"
        self.categories = ["strength"]
      when "silversneakers ® classic"
        self.categories = ["senior fitness"]
      when "yogalates"
        self.categories = ["pilates", "yoga"]
      when "barre-latte'", "barre fitness"
        self.categories = ["barre", "strength", "cardio"]
      when "silversneakers ® splash"
        self.categories = ["senior fitness", "water exercise"]
      when "turbo kick"
        self.categories = ["boxing", "cardio"]
      when "insanity (30 min)"
        self.categories = ["interval training", "cardio"]
      when "zumba ®", "raw groove", "oula", "step"
        self.categories = ["dance", "cardio"]
      when "yoga mixed level"
        self.categories = ["yoga"]
    end
  end



end
