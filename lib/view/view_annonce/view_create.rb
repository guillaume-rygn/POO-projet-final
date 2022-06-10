require_relative '../view'

class View_Annonce_Create < View
  def create_item

    id = Item.all.length
    id = id + 1

    while true

      puts "\n\nQuel objet souhaitez vous créer ?"
      puts "1 - Item classique"
      puts "2 - Chaussure"
      puts "3 - Poster"
      puts "4 - Disque dur"
      puts "5 - retour en arrière"

      choice = gets.chomp.to_i

      case choice 
        when 1
          property = item_property
          phone = phone()
          return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: "", type: "other", color: property[5], storage: "", author: "user", phone: phone}
          break
          
        when 2
          property = item_property
          puts "\n\n Quel est la taille de la chaussure ?"
          print "> "
          size = gets.chomp.to_i
      
          until size >= 0 || size.is_number? do
            print "Merci de rentrer une quantité valide:\n"
            print "> "
            size = gets.chomp.to_i
          end
          phone = phone()
          return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: size, type: "shoe", color: property[5], storage: "", author: "user", phone: phone}
          break

        when 3
          property = item_property
          puts "\n\n Quel est la taille de votre poster ? en A (0,1,2)"
          print "> "
          size = gets.chomp.to_i

          until size >= 0 || size > 2 || size.is_number? do
            print "Merci de rentrer une taille valide:\n"
            print "> "
            size = gets.chomp.to_i
          end
          phone = phone()
          return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: "A#{size}", type: "poster", color: property[5], storage: "", author: "user", phone: phone}        
          break

        when 4
          property = item_property
          puts "\n\n Quel est la taille de votre disque dur ? (en pouce)"
          print "> "
          size = gets.chomp.to_i
      
          until size >= 0 || size > 2 || size.is_number? do
            print "Merci de rentrer une taille valide:\n"
            print "> "
            size = gets.chomp.to_i
          end
      
          puts "\n\n Quel est la capacité de stockage de votre disque dur ? (en TB)"
          print "> "
          storage = gets.chomp.to_i
      
          until storage >= 0 || size.is_number? do
            print "Merci de rentrer une taille valide:\n"
            print "> "
            storage = gets.chomp.to_i
          end
          phone = phone()
          return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: size, type: "hard drive", color: property[5], storage: "#{storage}TB", author: "user", phone: phone}       
          break
        when 5
          break
      else
        puts "Merci de choisir un choix valide"
      end

    end
  end
end