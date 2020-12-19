namespace :dev do
  desc "Configura o ambiente de Desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
           
      show_spinner("Apagando DB...") { %x(rails db:drop) }
      show_spinner("Criando DB...") { %x(rails db:create) }
      show_spinner("Criando tabelas no DB...") { %x(rails db:migrate) }
      %x(rails dev:add_mining_type)
      %x(rails dev:add_coins) 
       
      else
       puts "Você não está em ambiente de desenvolvimento!!!"
    end
  end

  desc "Cadastra as moedas"
    task add_coins: :environment do
      show_spinner("Cadastrando Moedas...") do
          

            coins = [
                      {description: "Bitcoin", acronym: "BTC", url_image:"https://upload.wikimedia.org/wikipedia/commons/c/cf/Bitcoin.com_logo.png", mining_type: MiningType.find_by(acronym: 'PoW')},
                      {description: "Ethereum", acronym: "ETH", url_image:"https://img.icons8.com/nolan/2x/ethereum.png", mining_type: MiningType.all.sample},
                      {description: "Dash", acronym: "DASH", url_image:"https://www.pinclipart.com/picdir/middle/556-5565319_dash-coin-png-email-contact-clipart.png", mining_type: MiningType.all.sample}
                    ]

        #irá percorrer o array coins e verificar se existe no banco de dados e se existir não irá duplicar os registros
        coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastra os tipos de mineração"
    task add_mining_type: :environment do
      show_spinner("Cadastrando tipos de mineração...") do
              
              mining_types = [
                {description: "Proof of Work", acronym: "PoW"},
                {description: "Proof of Stake", acronym: "PoS"},
                {description: "Proof of Capacity", acronym: "PoC"}
              ]

        mining_types.each do |mining_type|
          MiningType.find_or_create_by!(mining_type)
        end
      end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")  
  end  
end
