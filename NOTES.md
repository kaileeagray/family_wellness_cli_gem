How to build

1. plan gem and imagine interface
2. project structure
3. entry point - the file run
4. force that to build the CLI interface
5. stub out the interface
6. start making things real
7. discover objects
8. program

- A command line interface for daily yoga and dance classes in Fargo.

user types in family_wellness_daily

show a list of options to view classes that day

option to add/view hard coded scheduled classes

option to open link to website to double check

option to filter results by category - dance, aerobics, yoga

option to view temps, wind - for outdoor workout plans

---
what is a fitness class?

a class has a name
a class has an instructor
a class has a studio
a class has many categories

build an object that has these properties. objects should have one responsibility.


-------------
Whenever you start a program, start at the place the user interacts with the program.

----
build an executable file in bin folder
add #!/usr/bin/env ruby to tell OS to interpret file with ruby.
go one step at a time.
----

we want user to be able to execute like this:  ./bin/fargo_fitness_daily

type // ♥ ls -lah to view permissions (list all attributes)
total 24
drwxr-xr-x   5 kaileegray  staff   170B Jun  7 09:41 .
drwxr-xr-x  15 kaileegray  staff   510B Jun  7 09:45 ..
-rwxr-xr-x   1 kaileegray  staff   344B Jun  7 09:34 console
-rw-r--r--   1 kaileegray  staff    40B Jun  7 09:43 fargo_fitness_daily
-rwxr-xr-x   1 kaileegray  staff   131B Jun  7 09:34 setup


-rw-r--r--   1 kaileegray  staff    40B Jun  7 09:43 fargo_fitness_daily

means file has read and write permissions. does not have executable permissions.

to add executable permissions use check mod (review http://www.thegeekstuff.com/2010/06/chmod-command-examples/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed:+TheGeekStuff+(The+Geek+Stuff))

----

don't put logic in CLI - encapsulate in another file
so use FamilyWellnessDaily::CLI.new.call
to call new CLI

---

in bin file, you need to load interpreter and you need to load the environment

---
 program by faking the program you want to have. bit by bit. don't second guess. make progress. make it more real. even if it will break down we'll discover more with the process.
