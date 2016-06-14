class FamilyWellnessDaily::FitnessClass
  attr_accessor :name, :time, :instructor, :categories, :studio
  @@all = []
  @@all_categories = ["cardio", "barre", "bodypump", "strength", "dance", "cycling", "interval training", "boxing", "yoga", "water exercise", "senior fitness", "medical"]
  @@hash_title_categories = {"Circuit"=>["interval training", "cardio", "strength"], "Spinsanity"=>["cycling", "cardio"],
                      "Zumba ®"=>["dance", "cardio"], "Hydro Power"=>["water exercise", "strength", "cardio"],
                      "Hydro Fitness"=>["water exercise", "strength", "cardio"], "Gold N Fit"=>["senior fitness"],
                      "Indoor Cycling"=>["cycling", "cardio"], "Tabata Toning"=>["interval training", "cardio", "strength"],
                      "Parkinson's Program"=>["medical"], "Mat Pilates"=>["pilates", "strength"], "PD FIT"=>["medical"], "BODYPUMP ™"=>["bodypump", "strength"],
                      "Yoga Level 1"=>["yoga"], "Raw Groove"=>["dance", "cardio"], "R.I.P.P.E.D. ®"=>["interval training", "cardio", "strength"],
                      "Cycle Craze"=>["cycling", "cardio"], "Family Circuit"=>["interval training", "cardio", "strength"], "Abs, Back, & Booty"=>["strength"],
                      "Tabata Toning (30 min)"=>["interval training", "cardio", "strength"], "OULA"=>["dance", "cardio"],
                      "BODYPUMP ™ Support Instructor"=>["bodypump", "strength"], "Muscle Fitness"=>["strength"], "SilverSneakers ® Classic"=>["senior fitness"],
                      "Yogalates"=>["pilates", "yoga"], "Barre-latte'"=>["barre", "strength", "cardio"], "SilverSneakers ® Splash"=>["senior fitness", "water exercise"],
                      "Barre Fitness"=>["barre", "strength", "cardio"], "Turbo Kick"=>["boxing", "cardio"], "Yoga Mixed Level"=>["yoga"], "Step"=>["dance", "cardio"],
                      "Mat Pilates II"=>["pilates", "strength"], "Tabata Booty"=>["interval training", "cardio", "strength"], "Deck of Cards"=>["interval training", "cardio", "strength"],
                      "Tabata Power"=>["interval training", "cardio", "strength"], "Yoga Strength"=>["yoga", "strength"], "INSANITY (30 min)"=>["interval training", "cardio", "strength"],
                       "Yogaflow"=>["yoga", "cardio"], "Cycle Sculpt"=>["cycling", "strength", "cardio"], "Candle Light Yoga"=>["yoga"], "Zumba Step"=>["dance", "cardio"]}
  def self.today
    FamilyWellnessDaily::Scraper.new
    # this should return all instances of FitnessClass
  end

  def self.all
    @@all
  end

  def self.categories
    @@hash_title_categories.values.flatten.uniq
  end

  def self.collect_by_category(category)
    classes_of_category = []
    @@all.each do |fitclass|
      classes_of_category << fitclass if fitclass.categories.include?(category)
    end
    classes_of_category
  end

  def save
    @@all << self
  end

  def assign_categories
    #class titles taken from website by scraping all titles and then manually assigning categories in console
    self.categories = @@hash_title_categories[self.name]
  end

end
