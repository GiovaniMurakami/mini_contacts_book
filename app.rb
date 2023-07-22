require './methods'

id = 1
contacts = []

loop do
puts "1. Adicionar contatos"
puts "2. Remover contatos"
puts "3. Atualizar contato"
puts "4. Visualizar contatos"
puts "5. Sair"

print "Escolha uma opção: "
option = gets.chomp.to_i

case option
    when 1
        puts '----------'
        add_contact(contacts, id)
        id += 1
        puts '----------'
    when 2
        puts '----------'
        remove_contact(contacts)
        puts '----------'
    when 3
        puts '----------'
        update_contact(contacts)
        puts '----------'
    when 4
        puts '----------'
        show_contacts(contacts)
        puts '----------'
    when 5
        puts '----------'
        puts "Até mais."
        break
    else
        puts '----------'
        puts "Opção inválida"
    end
end