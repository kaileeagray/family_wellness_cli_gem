Goals:

<<<<<<< HEAD
1. Make CLI print by class category or time (evening, afternoon, morning)
2. Don't print classes that have already started or ended
3. with phantomjs there is a delay to load the classes. can we use json or something to make it faster?
4. to deal with load time, create a progress bar. or only load classes at specific locations to speed up process.
    or print after each class is loaded.

5. be able to grab description by making phantomjs click the class linkj
6. instead of loading all classes, load only the category requested to speed up process
=======
1. Make CLI print by location, class category, or time (evening, afternoon, morning)
2. When CLI prints all classes, print location first then print all classes at that location
    - to do this: create location class? Or just build a method in fitness_class.rb that collects all classes within a location and returns
3. with phantomjs there is a delay to load the classes. can we use json or something to make it faster?
4. to deal with load time, create a progress bar. or only load classes at specific locations to speed up process.
    or print after each location is loaded.
>>>>>>> fargo-fitness-cli-gem-v-000/master