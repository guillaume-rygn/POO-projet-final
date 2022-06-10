require_relative 'router_admin'
require_relative './model/item'
require_relative './controller/controller_annonce'
require_relative './controller/controller_item'


class Router_Client < Router_Admin
  
  attr_accessor :controllerclient
    
  def menu  
    while true

      puts "\n\nQue souhaites tu faire ?"
      puts "1 - Afficher tous les Items"
      puts "2 - Connexion admin"
      puts "3 - Quitter l'app"

      choice = gets.chomp.to_i

      case choice 
      when 1
        menu_all_item()
      when 2
        admin()
        break
      when 3
        puts "\n\nA bientôt !\n\n"
        break
      else
        puts "Merci de choisir un choix valide"
      end

    end
  end

  def admin
    while true
      puts "\n\nmot de passe :"
      print '> '

      choicepsw = gets.chomp.to_i

      case choicepsw 
      when 1234
        puts "Connexion réussi"
        Router_Admin.new.menu
        break
      else
        puts "Erreur veuillez reessayer"
        break
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



  def menu_function_item(id)
    while true
      puts "\n\nQue souhaites tu faire ?"
      puts "1 - Acheter l'item"
      puts "2 - Revenir au menu précédent"

      choice_update = gets.chomp.to_i

      case choice_update 
        when 1
          Controller_Annonce.new.update(id)
        when 2
          break
      else
        puts "Merci de choisir un choix valide"
      end
    end
  end

end
