# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Coin.create!(
    description: "Bitcoin",
    acronym: "BTC",
    url_image:"https://upload.wikimedia.org/wikipedia/commons/c/cf/Bitcoin.com_logo.png"
)
Coin.create!(
    description: "Ethereum",
    acronym: "ETH",
    url_image:"https://img.icons8.com/nolan/2x/ethereum.png"
)
Coin.create!(
    description: "Dash",
    acronym: "DASH",
    url_image:"https://www.pinclipart.com/picdir/middle/556-5565319_dash-coin-png-email-contact-clipart.png"
)