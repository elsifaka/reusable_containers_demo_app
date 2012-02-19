# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Container Creation"
c = Container.new name: "Default", layout: "default"
puts "OK" if c.save

puts "Entry Creation"
e = Entry.new name: "Home", title: "Homepage", permalink:"/", destination_action: "misc#homepage", container: c
puts "OK" if e.save
