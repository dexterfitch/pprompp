# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Character.create(name: "Gobzin", species: "Goblin", race: "Merfolk", age: 23, average_lifespan: 148, physical_description: "Small, green, with a yellowfin tail.",  notes: "Perhaps they tend to use shipwrecks as their lair?", shared: true)
Character.create(name: "Nilfen", species: "Mouseguard", race: "Field", age: "15", average_lifespan: "50", physical_description: "About 50cm tall, with a bobbed tail, and brown fur. Walks upright unless going at top speed, then switches to all fours.", notes: "Shoutout to Reepicheep", shared: "true")