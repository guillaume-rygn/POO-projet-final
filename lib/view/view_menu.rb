require_relative '../controller/controller_admin'

class View_Menu

  attr_accessor :controlleradmin

  @@typemenu = 1

  def initialize
    @controlleradmin = Controller_Admin.new
  end

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
        @controlleradmin.create
      when 3
        puts "\n\nA bientôt Admin !\n\n"
        break
      else
        puts "Merci de choisir un choix valide"
      end

    end
  end


  def menu_all_item
    puts "\n\nAffichons tous les Items :\n\n"
        @controlleradmin.index_items(1)
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
              Controller_Client.new.create
              break
            when 2
             menu_show_item()
             break
            when 3
              pricemenu(2)
              break
            when 4
              pricemenu(3)
              break
            when 5
              shoes = Shoe.all
              itemonly(4, "chaussure", shoes)
              break
            when 6
              posters = Poster.all
              itemonly(5, "poster", posters)
              break
            when 7
              harddrives = Harddrive.all
              itemonly(6, "disque dur", harddrives)
              break
            when 8
              pricemenu(7)
              break
            when 9
              pricemenu(8)
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
                @controlleradmin.show(item.id)
                menu_function_item()
              end
            end
          elsif @@typemenu == 2
            items.map{|item| item.price[1..-1]}
            items.sort_by{|x| x.price[1..-1].to_f}.each_with_index do |item, index|
              if itemchoice.to_i == index + 1
                @controlleradmin.show(item.id)
                menu_function_item()
              end
            end
          elsif @@typemenu == 3
            items.map{|item| item.price[1..-1]}
            items.sort_by{|x| x.price[1..-1].to_f}.reverse!.each_with_index do |item, index|
              if itemchoice.to_i == index + 1
                @controlleradmin.show(item.id)
                menu_function_item()
              end
            end
          elsif @@typemenu == 4
            i = 1
            items.each do |item, index|
              if item.type == "shoe"
                if itemchoice.to_i == i
                  @controlleradmin.show(item.id)
                  menu_function_item()
                end
                i = i + 1
              end
            end
          elsif @@typemenu == 5
            i = 1
            items.each do |item, index|
              if item.type == "poster"
                if itemchoice.to_i == i
                  @controlleradmin.show(item.id)
                  menu_function_item()
                end
                i = i + 1
              end
            end
          elsif @@typemenu == 6
            i = 1
            items.each do |item, index|
              if item.type == "hard drive"
                if itemchoice.to_i == i
                  @controlleradmin.show(item.id)
                  menu_function_item()
                end
                i = i + 1
              end
            end
          elsif @@typemenu == 7
            i = 1
            items.each do |item, index|
              if item.author == "user"
                if itemchoice.to_i == i
                  @controlleradmin.show(item.id)
                  menu_function_item()
                end
                i = i + 1
              end
            end
          elsif @@typemenu == 8
            i = 1
            items.each do |item, index|
              if item.author == "shop"
                if itemchoice.to_i == i
                  @controlleradmin.show(item.id)
                  menu_function_item()
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


  def menu_function_item
    while true
      puts "\n\nVoulez-vous modifier cet item ?"
      puts "1 - Modifier l'item"
      puts "2 - Supprimer l'item"
      puts "3 - Revenir au menu précédent"

      choice_update = gets.chomp.to_i

      case choice_update 
        when 1
          @controlleradmin.update
        when 2
          @controlleradmin.delete
          break
        when 3
          break
      else
        puts "Merci de choisir un choix valide"
      end
    end
  end

  

  private 

  def pricemenu(id)
    puts "\n\nAffichons tous les Items :\n\n"
        @controlleradmin.index_items(id)
        @@typemenu = id
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
  

  def itemonly(id, item, array)
    puts "\n\nAffichons toutes les #{item} :\n\n"
        @controlleradmin.index_items(id)
        @@typemenu = id
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