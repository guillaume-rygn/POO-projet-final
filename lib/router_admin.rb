require_relative './controller/controller_item'
require_relative './controller/controller_shoe'
require_relative './controller/controller_poster'
require_relative './controller/controller_harddrive'

class Router_Admin

  attr_accessor :controlleradmin

  @@typemenu = 1


  def perform
    puts "-----------------------------------------"
    puts "|                                       |"
    puts "|        Bienvenue sur LeBonCLI         |"
    puts "|                                       |"
    puts "-----------------------------------------"
    menu()
  end

  def menu 
    while true

      puts "\n\nBonjour Admin, Que souhaites tu faire ?"
      puts "1 - Afficher tous les Items"
      puts "2 - Creer un Item"
      puts "3 - Quitter l'interface admin"

      choice = gets.chomp.to_i

      case choice 
      when 1
        menu_all_item()
      when 2
        menu_create() 
      when 3
        puts "\n\nA bientôt Admin !\n\n"
      break
      else
        puts "Merci de choisir un choix valide"
      end

    end
  end

  def menu_create
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
        Controller_Item.new.create
        break
      when 2
        Controller_Shoe.new.create    
        break
      when 3
        Controller_Poster.new.create
        break
      when 4
        Controller_Harddrive.new.create
        break
      when 5
        break
      else
        puts "Merci de choisir un choix valide"
      end

    end
  end


  def menu_all_item
    puts "\n\nAffichons tous les Items :\n\n"
        Controller_Item.new.index_items
        @@typemenu = 1
        while true
          puts "\n\nQue souhaites tu faire ?"
          puts "1 - Poster une annonce" 
          puts "2 - Afficher un Item par id"
          puts "3 - Afficher les items par ordre croissant de prix"
          puts "4 - Afficher les items par ordre décroissant de prix"
          puts "5 - Afficher que les chaussures"
          puts "6 - Afficher que les poster"
          puts "7 - Afficher que les disque dur"
          puts "8 - Afficher que les annonces"
          puts "9 - Afficher que les produits de la boutique"
          puts "10 - Revenir au menu général"

          choice_item = gets.chomp.to_i

          case choice_item 
            when 1
              Controller_Annonce.new.create
              break
            when 2
             menu_show_item()
             break
            when 3
              items = Item.all
              puts "\n\nAffichons tous les Items par prix croissant :\n\n"
              orderprice(items)
              break
            when 4
              items = Item.all
              puts "\n\nAffichons tous les Items par prix décroissant:\n\n"
              orderpriceinverse(items)
              break
            when 5
              shoes = Shoe.all
              puts "\n\nAffichons toutes les chaussures :\n\n"
              Controller_Shoe.new.index_items
              @@typemenu = 2
              itemonly(shoes)
              break
            when 6
              posters = Poster.all
              puts "\n\nAffichons toutes les poster :\n\n"
              Controller_Poster.new.index_items
              @@typemenu = 3
              itemonly(posters)
              break
            when 7
              harddrives = Harddrive.all
              puts "\n\nAffichons toutes les disques durs :\n\n"
              Controller_Harddrive.new.index_items
              @@typemenu = 4
              itemonly(harddrives)
              break
            when 8
              puts "\n\nAffichons toutes les annonces :\n\n"
              Controller_Annonce.new.index_items
              @@typemenu = 5
              pricemenu()
              break
            when 9
              items = Item.all
              i = 1
              @@typemenu = 6
              puts "\n\nAffichons toutes les items en boutique :\n\n"
              items.each do |item|
                if item.author == "shop"
                  puts "#{i} - #{item.name} - type :#{item.type}"
                  i = i + 1
                end
              end
              pricemenu()
              break
            when 10
              break
          else
            puts "Merci de choisir un choix valide"
          end
        end
  end


  def menu_show_item
    while true 
      puts "\n\nChoississez l'id de votre Item :\n\n"
      itemchoice = gets.chomp.to_i
      if itemchoice >= 1 && itemchoice <= Item.all.length 
          items = Item.all
          if @@typemenu == 1
            items.sort_by{|x| x.name.downcase}.each_with_index do |item, index|
              if itemchoice.to_i == index + 1
                Controller_Item.new.show(item.id)
                menu_function_item(item.id)
              end
            end
          elsif @@typemenu == 2
            i = 1
            items.each do |item, index|
              if item.type == "shoe"
                if itemchoice.to_i == i
                  Controller_Shoe.new.show(item.id)
                  menu_function_item(item.id)
                end
                i = i + 1
              end
            end
          elsif @@typemenu == 3
            i = 1
            items.each do |item, index|
              if item.type == "poster"
                if itemchoice.to_i == i
                  Controller_Poster.new.show(item.id)
                  menu_function_item(item.id)
                end
                i = i + 1
              end
            end
          elsif @@typemenu == 4
            i = 1
            items.each do |item, index|
              if item.type == "hard drive"
                if itemchoice.to_i == i
                  Controller_Harddrive.new.show(item.id)
                  menu_function_item(item.id)
                end
                i = i + 1
              end
            end
          elsif @@typemenu == 5
            i = 1
            items.each do |item, index|
              if item.author == "user"
                if itemchoice.to_i == i
                  Controller_Item.new.show(item.id)
                  menu_function_item(item.id)
                end
                i = i + 1
              end
            end
          elsif @@typemenu == 6
            i = 1
            items.each do |item, index|
              if item.author == "shop"
                if itemchoice.to_i == i
                  Controller_Item.new.show(item.id)
                  menu_function_item(item.id)
                end
                i = i + 1
              end
            end
          end
        break
      else
        puts "Merci de choisir un choix valide"
      end
    end
  end


  def menu_function_item(id)
    item = Item.find(id)
    while true
      puts "\n\nVoulez-vous modifier cet item ?"
      puts "1 - Modifier l'item"
      puts "2 - Supprimer l'item"
      puts "3 - Revenir au menu précédent"

      choice_update = gets.chomp.to_i

      case choice_update 
        when 1
          if item.type === "other"
            Controller_Item.new.update(id)
          elsif item.type === "shoe"
            Controller_Shoe.new.update(id)
          elsif item.type === "poster"
            Controller_Poster.new.update(id)
          elsif item.type === "hard drive"
            Controller_Harddrive.new.update(id)
          end
        when 2
          Controller_Item.new.delete(id)
          break
        when 3
          break
      else
        puts "Merci de choisir un choix valide"
      end
    end
  end



  private 

  def pricemenu
        while true
          puts "\n\nQue souhaites tu faire ?"
          puts "1 - Afficher un Item par id"
          puts "2 - Revenir au menu général"

          choice_item = gets.chomp.to_i

          case choice_item 
            when 1
             menu_show_item()
             break
            when 2
              break
          else
            puts "Merci de choisir un choix valide"
          end
        end
  end
  

  def itemonly(array)
        while true
          puts "\n\nQue souhaites tu faire ?"
          puts "1 - Afficher un Item par id"
          puts "2 - Afficher par taille croissante"
          puts "3 - Afficher par taille décroissante"
          puts "4 - Afficher par prix croissant"
          puts "5 - Afficher par prix décroissant"
          puts "6 - Revenir au menu général"

          choice_item = gets.chomp.to_i

          case choice_item 
            when 1
             menu_show_item()
             break
            when 2
              display(1, array)
            when 3
              display(2, array)
            when 4
              display(3, array)
            when 5
              display(4, array)
            when 6
              break
          else
            puts "Merci de choisir un choix valide"
          end
        end
  end

  
  def display(id, array)
    case id
      when 1 
        ordersize(array)
      when 2
        ordersizeinverse(array)
      when 3
        orderprice(array) 
      when 4
        orderpriceinverse(array)     
    else
      puts "Merci de choisir un choix valide"
    end
    
  end

  def ordersize(array)
    puts "\n\n"
    array.sort_by{|x| x.size}.each_with_index do |item|
      puts "#{item.name} #{item.size}"
    end
  end

  def ordersizeinverse(array)
    puts "\n\n"
    array.sort_by{|x| x.size}.reverse!.each_with_index do |item|
      puts "#{item.name} #{item.size}"
    end
  end

  def orderprice(array)
    puts "\n\n"
    array.sort_by{|x| x.price[1..-1].to_f}.each_with_index do |item|
      puts "#{item.name} #{item.price}"
    end
  end

  def orderpriceinverse(array)
    puts "\n\n"
    array.sort_by{|x| x.price[1..-1].to_f}.reverse!.each_with_index do |item|
      puts "#{item.name} #{item.price}"
    end
  end

end