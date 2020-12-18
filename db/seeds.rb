# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Array de registros
spinner = TTY::Spinner.new("[:spinner] Cadastrando Moedas...")
spinner.auto_spin
coins = [
            {description: "Bitcoin", acronym: "BTC", url_image:"https://upload.wikimedia.org/wikipedia/commons/c/cf/Bitcoin.com_logo.png"},
            {description: "Ethereum", acronym: "ETH", url_image:"https://img.icons8.com/nolan/2x/ethereum.png"},
            {description: "Dash", acronym: "DASH", url_image:"https://www.pinclipart.com/picdir/middle/556-5565319_dash-coin-png-email-contact-clipart.png"}
        ]

    #irá percorrer o array coins e verificar se existe no banco de dados e se existir não irá duplicar os registros
coins.each do |coin|
    Coin.find_or_create_by!(coin)
end
spinner.success("(Concluído!)")
    