require 'capybara/poltergeist'

class FargoFitnessDaily::Scraper

  def initialize
    # # Sites to search:
    # # Family Wellness
    # # Mojo
    # # Ecce
    # # Jazzercise
    # # Sacred Earth
    # # Spirit Room
    # # Zero Gravity Fitness
    #
    # class_1 = FargoFitnessDaily::FitnessClass.new
    # class_1.name = "Raw Groove"
    # class_1.location = "Family Wellness"
    # class_1.time = "8 AM"
    # class_1.instructor = "Jeanne"
    # class_1.categories = ["dance", "aerobics", "cardio"]
    # class_1.url = "http://www.familywellnessfargo.org/fitness/group-fitness/"
    #
    # class_2 = FargoFitnessDaily::FitnessClass.new
    # class_2.name = "Dance Mixx"
    # class_2.location = "Jazzercise Fargo The PRACS Building"
    # class_2.time = "5:45 PM"
    # class_2.instructor = "Nicole"
    # class_2.categories = ["dance", "aerobics", "cardio"]
    # class_2.url = "http://jcls.jazzercise.com/facility/jazzercise-fargo-the-pracs-building"
    #
    # class_3 = FargoFitnessDaily::FitnessClass.new
    # class_3.name = "Gentle Yoga"
    # class_3.location = "Ecce Yoga"
    # class_3.time = "12 PM"
    # class_3.instructor = "Brenda"
    # class_3.categories = ["yoga", "gentle yoga"]
    # class_3.url = "https://calendar.google.com/calendar/render?cid=4nhnmmset6f8ehr9d798pqhg5s%40group.calendar.google.com#main_7"
    # classes = [class_1, class_2, class_3]
    #
    # # classes << scrape_mojo
    #
    # # classes <<
    # # classes << scrape_ecce
    # # classes << scrape_sacred_earth
    # # classes << scrape_zg
    # # classes << scrape_spirit
    #
    # classes
    #scrape_mojo
    scrape_jazzercise
    scrape_family_wellness



    FargoFitnessDaily::FitnessClass.all
  end

  def get_document(url)
    browser = Watir::Browser.new(:phantomjs)
    browser.goto(url)
    Nokogiri::HTML(browser.html)
  end


  def get_day
    Date.today.strftime("%A")
  end

  def scrape_mojo
    # MindBody Online site
    # go to mojo, find the day and classes
    # instantiate a class for each class offered that day
    #http://conkuer.com/2014/05/29/headless-web-browsing-for-complex-website-scraping.html
    # ^^ used source above to help scrape mindbodyonline
    session = Capybara::Session.new(:poltergeist)
    session.visit "https://clients.mindbodyonline.com/ASP/home.asp?studioid=43924"
    sleep 4

    page = session.within_frame 'mainFrame' do
      Nokogiri::HTML(session.html)
    end

    even_rows = page.css('.evenRow')
    odd_rows = page.css('.oddRow')

    binding.pry
    #
    # browser = Watir::Browser.new(:phantomjs)
    # browser.goto("https://clients.mindbodyonline.com/classic/home?studioid=43924")
    # data = Nokogiri::HTML(browser.frame(:name => "mainFrame").html)
    #
    # even_rows = data.css('.evenRow')
    # odd_rows = data.css('.oddRow')
    #
    # binding.pry

    # document = Nokogiri::HTML(browser.html)
    #
    # document.css("div#GXP#{get_day}").css("div.GXPEntry").each do |fitclass|
    #   new_class = FargoFitnessDaily::FitnessClass.new
    #   new_class.name = fitclass.css("div.GXPTitle").text
    #   new_class.time = fitclass.css("div.GXPTime").text
    #   new_class.instructor = fitclass.css("div.GXPInstructor").text
    #   new_class.location = "Family Wellness"
    #   new_class.url = "http://www.familywellnessfargo.org/fitness/group-fitness/"
    #   new_class.save
    # end

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
      new_class = FargoFitnessDaily::FitnessClass.new
      new_class.name = fitclass.css("div.GXPTitle").text
      new_class.time = fitclass.css("div.GXPTime").text
      new_class.instructor = fitclass.css("div.GXPInstructor").text
      new_class.location = "Family Wellness"
      new_class.url = "http://www.familywellnessfargo.org/fitness/group-fitness/"
      new_class.save
    end


  end

  def scrape_jazzercise
    # go to jazzercise, find the day and classes
    # instantiate a class for each class offered that day
    doc = get_document("http://jcls.jazzercise.com/facility/jazzercise-fargo-the-pracs-building")
    new_class = FargoFitnessDaily::FitnessClass.new
    new_class.name = doc.css("div#calendar td.today p.class-info span.name").text
    new_class.time = doc.css("div#calendar td.today p.time").text
    new_class.instructor = doc.css("div#calendar td.today p.class-info span.instructor").text
    new_class.location = "Jazzercise at The PRACS Building"
    new_class.url = "http://jcls.jazzercise.com/facility/jazzercise-fargo-the-pracs-building"
    new_class.save

  end

  def scrape_ecce
    # this is a google calendar
    # go to ecce, find the day and classes
    # instantiate a class for each class offered that day
  end

  def scrape_sacred_earth
    # MindBody Online site
    # go to sacred earth, find the day and classes
    # instantiate a class for each class offered that day
  end

  def scrape_zg
    # MindBody Online site
    # go to zero gravity, find the day and classes
    # instantiate a class for each class offered that day
  end

  def scrape_spirit
    # this is a google calendar
    # go to spirit room, find the day and classes
    # instantiate a class for each class offered that day
  end

end
