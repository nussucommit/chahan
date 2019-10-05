# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Booking dummies
Booking.create(
  name: 'John Smith',
  email: 'test@abcd.com',
  category: 'Electronics',
  items: 'Portable Projector',
  quantity: '1',
  purpose: 'Camp')

Booking.create(
  name: 'Bob',
  email: 'test@xyz.com',
  category: 'Electronics',
  items: 'VGA Adapter',
  quantity: '1',
  purpose: 'Presentation')
