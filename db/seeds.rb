# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


cards = ['Plagiat',
  'Podsumowanie',
  'Norwegia',
  'Mazurek',
  'Delfin',
  'Gogle',
  'Zapiekanka',
  'Himalaje',
  'Notes',
  'Ogon'
]

words = [
  'Kopia',
  'Replika',
  'Taniec',
  'Ssak',
  'Ryba',
  'Kartka',
  'Góry',
  'Okulary',
  'Kraj',
  'Konkluzja',
  'Zeszyt',
  'Danie',
  'Półwysep',
  'Papier'
]

words.each do |word|
  Word.where(value: word).first_or_create
end

cards.each do |card|
  db_card = Card.where(title: card).first_or_create
  db_card.words << Word.order('random()').first(5)
end