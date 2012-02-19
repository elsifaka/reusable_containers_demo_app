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

puts "Example Blog Post Creation"
b = BlogPost.new name: "First Post", title: "This is my first post", content: "Lorem ipsum etc..."
puts "OK" if b.save

puts "Associate it with an entry"
e = Entry.new name: "Blog Post: First Post", permalink: "/first-post", title: b.title, destination_content: b, container: c
puts "OK" if e.save
