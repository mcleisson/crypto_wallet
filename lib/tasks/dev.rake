namespace :dev do
  desc "Configura o ambiente de Desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
        spinner = TTY::Spinner.new("[:spinner] Apagando DB")
        spinner.auto_spin
        %x(rails db:drop)
        spinner.success("(DB deletada com sucesso!)")
        
        spinner = TTY::Spinner.new("[:spinner] Criando DB")
        spinner.auto_spin
        %x(rails db:create)
        spinner.success("(DB criado com sucesso!)")
        
        spinner = TTY::Spinner.new("[:spinner] Criando tabelas na DB")
        spinner.auto_spin
        %x(rails db:migrate)
        spinner.success("(Tabelas criadas com sucesso!)")
        
        spinner = TTY::Spinner.new("[:spinner] Inserindo registros nas tabelas no Banco de dados")
        spinner.auto_spin
        %x(rails db:seed)
        spinner.success("(Registros inseridos com sucesso!)")
    else
      puts "Você não está em ambiente de desenvolvimento!!!"
    end
  end

end
