def contact_exists(list, value)
    for contact in list
        if contact[:id] == value
            return contact
        end
    end
    return false
end

def format_phone_number(number)
    digits_only = number.gsub(/\D/, '')
  
    if digits_only.length >= 11
      formatted_number = "(#{digits_only[0..1]}) #{digits_only[2]}#{digits_only[3..6]}-#{digits_only[7..10]}"
      return formatted_number
    else
      return number
    end
  end

def valid_name?(name)
    /^[a-zA-ZÀ-ÿ]+(?:[-'][a-zA-ZÀ-ÿ]+)*[a-zA-ZÀ-ÿ]$/.match?(name) && !name.strip.empty?
end

def new_number
    loop do
      number = gets.chomp
  
      formatted_number = format_phone_number(number)
  
      if /\(?(\d{2})\)?\s?9(\d{4})\-?(\d{4})/.match(formatted_number)
        return formatted_number
      else
        print "Número inválido, tente novamente: "
      end
    end
  end

def add_contact(list, value)
    loop do
        print "Informe o nome do novo contato: "
        name = gets.chomp

        if valid_name?(name)
            print "Informe o telefone do novo contato: "
            number = new_number

            contact = {
                id: value,
                name: name,
                number: number
            }
            list.push(contact)
            break
        else
            puts "Nome inválido. Tente novamente."
        end
    end
end

def remove_contact(list)
    print "Informe o código do contato para remover: "
    contact_index = gets.chomp.to_i
    return puts "Contato não existe." if !contact_exists(list, contact_index)
    list.delete_if { |contact| contact[:id] == contact_index }
end

def update_contact(list)
    print "Informe o código do contato para atualizar: "
    contact_index = gets.chomp.to_i
    contact_to_update = contact_exists(list, contact_index)
    return puts "Contato não existe" if !contact_to_update
    puts "Informe o novo nome do contato #{contact_to_update[:name]}"
    contact_to_update[:name] = gets.chomp
    puts "Informe o novo telefone do contato"
    contact_to_update[:number] = gets.chomp
end

def show_contacts(list)
    return puts "Não há contatos para mostrar" if list.empty?
    list.each do |contact|
        puts "#{contact[:id]} : #{contact[:name]} - #{contact[:number]}"
    end
end