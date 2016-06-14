case self.name.downcase
  when "bodypump ™", "bodypump ™ support instructor"
    self.categories = ["bodypump", "strength"]
  when "indoor cycling", "cycle craze", "spinsanity"
    self.categories = ["cycling", "cardio"]
  when "hydro power", "hydro fitness"
    self.categories = ["water exercise", "strength", "cardio"]
  when "muscle fitness", "abs, back, & booty"
    self.categories = ["strength"]
  when "silversneakers ® classic", "gold n fit"
    self.categories = ["senior fitness"]
  when "yogalates"
    self.categories = ["pilates", "yoga"]
  when "barre-latte'", "barre fitness"
    self.categories = ["barre", "strength", "cardio"]
  when "silversneakers ® splash"
    self.categories = ["senior fitness", "water exercise"]
  when "turbo kick"
    self.categories = ["boxing", "cardio"]
  when "insanity (30 min)", "circuit", "tabata toning", "tabata booty", "deck of cards", "tabata power", "family circuit", "r.i.p.p.e.d"
    self.categories = ["interval training", "cardio", "strength"]
  when "zumba ®", "raw groove", "oula", "step"
    self.categories = ["dance", "cardio"]
  when "yoga mixed level", "yoga level 1"
    self.categories = ["yoga"]
  when "mat pilates ii"
    self.categories = ["pilates", "strength"]
end


def collect_titles
  @titles = []
  days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  #loop through all the days, then through all the entries of that day to collect the class titles
  days.each do |day|
    @document.css("div#GXP#{day}").css("div.GXPEntry").each do |fitclass|
      @titles << fitclass.css("div.GXPTitle").text.strip unless @titles.include?(fitclass.css("div.GXPTitle").text.strip)
    end
  end
  @titles
end

def assign_categories
  hash_title_categories = {}
  @titles.each do |title|
    puts title
    puts "Enter all categories as an array"
    input = gets.strip
    hash_title_categories[title] = input
  end
  hash_title_categories
end
