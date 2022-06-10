require 'csv'

class View
  def create_item(typecreate)

    id = Item.all.length
    id = id + 1

    puts Item.all.length

    while true
      puts "\n\nQue souhaitez vous créer ?"
      puts "1 - item simple"
      puts "2 - chaussure"
      puts "3 - poster"
      puts "4 - disque dur"

      choice = gets.chomp.to_i
      case choice
        when 1
          property = item_property
          if typecreate == "annonce"
            phone = phone()
            return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: "", type: "other", color: property[5], storage: "", author: "user", phone: phone}
          else
            return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], color: property[5]}
          end
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

          if typecreate == "annonce"
            phone = phone()
            return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: size, type: "shoe", color: property[5], storage: "", author: "user", phone: phone}
          else
            return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: size, type: "shoe", color: property[5]}
          end

        when 3
          property = item_property
          puts "\n\n Quel est la taille de votre poster ? (0,1,2)"
          print "> "
          size = gets.chomp.to_i

          until size >= 0 || size > 2 || size.is_number? do
            print "Merci de rentrer une taille valide:\n"
            print "> "
            size = gets.chomp.to_i
          end

          if typecreate == "annonce"
            phone = phone()
            return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: "A#{size}", type: "poster", color: property[5], storage: "", author: "user", phone: phone}
          else
            return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: "A#{size}", type: "poster", color: property[5]}
          end 

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

          if typecreate == "annonce"
            phone = phone()
            return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: size, type: "hard drive", color: property[5], storage: "#{storage}TB", author: "user", phone: phone}
          else
            return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: size, type: "hard drive", color: property[5], storage: "#{storage}TB"}
          end
          else
        puts "Merci de choisir un choix valide"
      end
        
    end
  end

  def update_item(choice_item)
    id = choice_item

    property = item_property

    item = Item.find(id)

    if item.type == "shoe"
      puts "\n\n Quel est la taille de la chaussure ?"
      print "> "
      size = gets.chomp.to_i

      until size >= 0 || size.is_number? do
        print "Merci de rentrer une quantité valide:\n"
        print "> "
        size = gets.chomp.to_i
      end
      if item.author == "user"
        phone = phone()
        return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: size, type: "shoe", color: property[5], storage: "", author: "user", phone: phone}
       else
        return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: size, color: property[5] }
      end

    elsif item.type == "poster"
      puts "\n\n Quel est la taille de votre poster ? (0,1,2)"
      print "> "
      size = gets.chomp.to_i

      until size >= 0 || size > 2 || size.is_number? do
        print "Merci de rentrer une taille valide:\n"
        print "> "
        size = gets.chomp.to_i
      end

      if item.author == "user"
        phone = phone()
        return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: "A#{size}", type: "poster", color: property[5], storage: "", author: "user", phone: phone}
      else
        return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: "A#{size}", color: property[5]}
      end


    elsif item.type == "hard drive"
      puts "\n\n Quel est la taille de votre disque dur ? (en pouce)"
      print "> "
      size = gets.chomp.to_i

      until size >= 0 || size.is_number? do
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

      if item.author == "user"
        phone = phone()
        return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: size, type: "hard drive", color: property[5], storage: "#{storage}TB", author: "user", phone: phone}
      else
        return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: size, type: "hard drive", color: property[5], storage: "#{storage}TB"}
      end
      
        
    else
      if item.author == "user"
        phone = phone()
       return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: "", type: "other", color: property[5], storage: "", author: "user", phone: phone}
      else
        return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], color: property[5] }
      end
    end
  

    
  end


  def buy_item(choice_item)

    item = Item.find(choice_item)
    if item.quantity.to_i == 0
      return
      puts "\n\nCet Item n'est plus en stock il a été victime de son succès"
    else
      while true
        puts "\n\nConfirmez-vous ce choix ? (y/n)"
        print '> '

        choicebuy = gets.chomp.downcase

        case choicebuy 
        
        when "y"
          while true
            puts "\n\nquantité ?"
            print '> '
      
            choicequantity = gets.chomp.to_i

              if (item.quantity.to_i - choicequantity.to_i) >= 0 && choicequantity.to_i > 0
                puts "Cela fera un total de #{item.price} x #{choicequantity} = $#{total(item.price, choicequantity)}"
                while true
                  puts "\n\nConfirmez-vous ce choix ? (y/n)"
                  print '> '

                  finalchoice = gets.chomp.downcase

                  case finalchoice 
                  when "y"
                    puts "Achat confirmé"
                    newquantity = item.quantity.to_i - choicequantity.to_i
                    return newquantity
                  when"n"
                    puts "une autre quantité peut etre ?"
                    break
                  else
                    puts "Erreur veuillez reessayer"
                  end

                end
              elsif choicequantity == 0
                puts "Erreur merci de mettre une quantité valide"
              else
                puts "Rupture stock pour se produit veuillez réessayer avec un autre produit" 
              end
          end
          puts "Achat confirmé"
          break
        when "n"
          puts "une prochaine fois !"
          return n
        else
          puts "Erreur veuillez reessayer"
        end
      end
    end
  end

  private 

  def is_number?
    true if Float(self) rescue false
  end

  def item_property
    puts "\n\nQuelle est le nom de votre item ?"
    print "> "
    name = gets.chomp

    while name.length > 30 || name.length < 1
      puts "\n\nMerci de rentrer un nom d'item entre 1 et 30 caractères ?"
      print "> "
      name = gets.chomp
    end

    puts "\n\n Quel est le prix de votre item ? (en dollar)"
    print "> "
    price = gets.chomp.to_i

    until price >= 0 || price.is_number? do
      print "Merci de rentrer un nombre valide:\n"
      print "> "
      price = gets.chomp.to_i
    end
    price = "$#{price}"

    puts "\n\n Quel est la quantité de votre item ?"
    print "> "
    quantity = gets.chomp.to_i

    until quantity >= 0 || quantity.is_number? do
      print "Merci de rentrer une quantité valide:\n"
      print "> "
      quantity = gets.chomp.to_i
    end

    puts "\n\nQuelle est la marque de votre item ?"
    print "> "
    brand = gets.chomp

    while brand.length > 30 || brand.length < 1
      puts "\n\nMerci de rentrer un nom d'item entre 1 et 30 caractères ?"
      print "> "
      brand = gets.chomp
    end

    puts "\n\nQuelle est la description de votre item ?"
    print "> "
    description = gets.chomp

    while description.length > 60 || description.length < 1
      puts "\n\nMerci de rentrer une description d'item entre 1 et 60 caractères ?"
      print "> "
      description = gets.chomp
    end

    puts "\n\nQuelle est la couleur de votre item ?"
    print "> "
    color = gets.chomp

    while color.length > 20 || color.length < 1
      puts "\n\nMerci de rentrer une couleur entre 1 et 20 caractères ?"
      print "> "
      color = gets.chomp
    end

    return name,price,quantity,brand,description,color
  end

  def total(price, quantity)
    numberprice = price[1..-1]
    total = numberprice.to_f * quantity
    return total.truncate(2)
  end

  def phone
    puts "\n\nQuelle est votre numéro de téléphone ?"
    print "> "
    phonenumber = gets.chomp.to_i

    until phonenumber.to_s.length == 9
      puts "\n\nMerci de rentrer un numéro de téléphone valide"
      print "> "
      phonenumber = gets.chomp.to_i
    end
    return "0#{phonenumber}"

  end

end