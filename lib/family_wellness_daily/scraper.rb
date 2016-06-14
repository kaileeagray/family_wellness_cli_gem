class FamilyWellnessDaily::Scraper

  def initialize
    scrape_family_wellness
    FamilyWellnessDaily::FitnessClass.all
  end

  def get_document(url)
    browser = Watir::Browser.new(:phantomjs)
    browser.goto(url)
    Nokogiri::HTML(browser.html)
  end


  def get_day
    Date.today.strftime("%A")
  end


  def scrape_family_wellness
    # go to family wellness, find the day and classes
    # instantiate a class for each class offered that day

    # first get day of the week to move to that section of the schedule. require 'date' to use Date
    #.strftime info http://ruby-doc.org/stdlib-2.1.1/libdoc/date/rdoc/Date.html#method-i-strftime

    # using date collect that day's classes, assign categories


    # http://stackoverflow.com/questions/30746397/can-nokogiri-interpret-javascript-web-scraping for approach
    # with Watir, phantomjs

    document = get_document("http://www.familywellnessfargo.org/fitness/group-fitness/")

    document.css("div#GXP#{get_day}").css("div.GXPEntry").each do |fitclass|
      new_class = FamilyWellnessDaily::FitnessClass.new
      new_class.name = fitclass.css("div.GXPTitle").text.strip
      new_class.time = fitclass.css("div.GXPTime").text.strip
      new_class.instructor = fitclass.css("div.GXPInstructor").text.strip
      new_class.studio = fitclass.css("div.GXPStudio").text.strip
      new_class.assign_categories
      new_class.save
    end

  end

end
