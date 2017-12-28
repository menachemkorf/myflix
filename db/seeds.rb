# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

commedies = Category.create(name: 'Comeddies')
dramas = Category.create(name: 'Dramas')


monk = Video.create(title: 'Monk', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', small_cover_url: '/tmp/monk.jpg', large_cover_url: '/tmp/monk_large.jpg', category: dramas)
Video.create(title: 'Monk 2', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', small_cover_url: '/tmp/monk.jpg', large_cover_url: '/tmp/monk_large.jpg', category: dramas)


Video.create(title: 'Futurama', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', small_cover_url: '/tmp/futurama.jpg', large_cover_url: '/tmp/monk_large.jpg', category: commedies)
Video.create(title: 'Family Guy', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', small_cover_url: '/tmp/family_guy.jpg', large_cover_url: '/tmp/monk_large.jpg', category: commedies)

Video.create(title: 'Futurama', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', small_cover_url: '/tmp/futurama.jpg', large_cover_url: '/tmp/monk_large.jpg', category: commedies)
Video.create(title: 'Family Guy', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', small_cover_url: '/tmp/family_guy.jpg', large_cover_url: '/tmp/monk_large.jpg', category: commedies)

Video.create(title: 'Futurama', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', small_cover_url: '/tmp/futurama.jpg', large_cover_url: '/tmp/monk_large.jpg', category: commedies)
Video.create(title: 'Family Guy', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', small_cover_url: '/tmp/family_guy.jpg', large_cover_url: '/tmp/monk_large.jpg', category: commedies)

Video.create(title: 'Futurama', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', small_cover_url: '/tmp/futurama.jpg', large_cover_url: '/tmp/monk_large.jpg', category: commedies)
Video.create(title: 'Family Guy', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', small_cover_url: '/tmp/family_guy.jpg', large_cover_url: '/tmp/monk_large.jpg', category: commedies)

alice = User.create(name: 'Alice Clip', password: 'alice', email: 'alice@example.com')

Review.create(user: alice, video: monk, rating: 3, content: 'This is a so so video.')
Review.create(user: alice, video: monk, rating: 5, content: 'This is a great video.')


