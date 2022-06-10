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
        method(:menu).super_method.call
        break
      else
        puts "Erreur veuillez reessayer"
        break
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