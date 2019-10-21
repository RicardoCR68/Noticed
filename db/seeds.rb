# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# First User just because
system 'clear'

puts 'Clearing Records'
Note.destroy_all
User.destroy_all

puts "#{User.count} Users!"
puts "#{Note.count} Notes!"
sleep(1)

puts 'Starting the Seed!'

new_user = User.create(
  email: 'a@a',
  password: '123123'
)
puts 'New user created!'

10.times do |n|
  new_note = Note.new(
    title: 'zaz' * (n + 1),
    description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed perferendis nulla iusto cupiditate, iste! Ipsa, eligendi. Ipsa consequatur, eveniet velit libero pariatur nemo obcaecati voluptate vitae, magni laudantium eaque adipisci?',
    due_date: Time.now,
    priority: 'Low'
  )
  new_note.user = new_user

  if new_note.save
    puts "Note ##{Note.count}: #{new_note.title}"
    sleep(1)
  else
    puts 'Something went wrong!'
    puts new_note.errors.messages
  end
end
