# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category = Category.create(title: "Władca Pierścieni")

questions_array = [
	{content: "Które z wymienionych nie jest antydepresantem", answers: ["Sildenafil", "Cymbalta", "Azafen", "Elendil"], correct_answer: "Elendil"},
	{content: "Którym z kolei królem Gondoru był Aragorn", answers: ["5", "20", "39", "52"], correct_answer: "39"},
	{content: "Jak nazywała się stolica Rohanu", answers: ["Edoras", "Osgiliath", "Bree", "Dale"], correct_answer: "Edoras"},
	{content: "Który z Valarów stworzył krasnoludy", answers: ["Aule", "Manwe", "Varda", "Mandos"], correct_answer: "Aule"},
	{content: "Jak nazywało się Minas Morgul przed przejęciem przez siły Mordoru", answers: ["Minas Ithil", "Minas Anor", "Minas Tirith", "Minas Ereb"], correct_answer: "Minas Ithil"}
]
category.questions.create(questions_array)