require_relative 'view_menu'
require_relative '../model/item'
require_relative '../controller/controller_client'


class View_Client < View_Menu
  
  attr_accessor :controllerclient
  
  def initialize
    @controlleradmin = @controllerclient = Controller_Client.new
  end
  
  def menu  
    while true

      puts "\n\nQue souhaites tu faire ?"
      puts "1 - Afficher tous les Items"
      puts "2 - Connexion admin"
      puts "3 - Quitter l'app"

      choice = gets.chomp.to_i

      case choice 
      when 1
        @controllerclient.index_items(1)
        menu_all_item()
      when 2
        View_Client.new.admin
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
        View_Menu.new.menu
        break
      else
        puts "Erreur veuillez reessayer"
        break
      end
    end
  end

  def menu_function_item
    while true
      puts "\n\nQue souhaites tu faire ?"
      puts "1 - Acheter l'item"
      puts "2 - Revenir au menu précédent"

      choice_update = gets.chomp.to_i

      case choice_update 
        when 1
          @controllerclient.update
        when 2
          break
      else
        puts "Merci de choisir un choix valide"
      end
    end
  end

end
