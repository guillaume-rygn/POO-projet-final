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
              pricemenu()
              break
            when 4
              pricemenudescending()
              break
            when 5
              shoeonly()
              break
            when 6
              posteronly()
              break
            when 7
              harddriveonly()
              break
            when 8
              annonceonly()
              break
            when 9
              shoponly()
              break
            when 10
              break
          else
            puts "Merci de choisir un choix valide"
          end
        end
  end

  def pricemenu
    puts "\n\nAffichons tous les Items :\n\n"
        @controlleradmin.index_items(2)
        @@typemenu = 2
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
  

  def pricemenudescending
    puts "\n\nAffichons tous les Items :\n\n"
        @controlleradmin.index_items(3)
        @@typemenu = 3
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


  def shoeonly
    puts "\n\nAffichons toutes les chaussures :\n\n"
        @controlleradmin.index_items(4)
        @@typemenu = 4
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
              displayshoe(1)
            when 3
              displayshoe(2)
            when 4
              displayshoe(3)
            when 5
              displayshoe(4)
            when 6
              break
          else
            puts "Merci de choisir un choix valide"
          end
        end
  end

  def posteronly
    puts "\n\nAffichons toutes les posters :\n\n"
        @controlleradmin.index_items(5)
        @@typemenu = 5
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
              displayposter(2)
            when 3
              displayposter(1)
            when 4
              displayposter(3)
            when 5
              displayposter(4)
            when 6
              break
          else
            puts "Merci de choisir un choix valide"
          end
        end
  end


  def harddriveonly
    puts "\n\nAffichons toutes les posters :\n\n"
        @controlleradmin.index_items(6)
        @@typemenu = 6
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
              displayharddrive(1)
            when 3
              displayharddrive(2)
            when 4
              displayharddrive(3)
            when 5
              displayharddrive(4)
            when 6
              break
          else
            puts "Merci de choisir un choix valide"
          end
        end
  end

  def annonceonly
    puts "\n\nAffichons toutes les annonces :\n\n"
        @controlleradmin.index_items(7)
        @@typemenu = 7
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
              displayannonce(1)
            when 3
              displayannonce(2)
            when 4
              displayannonce(3)
            when 5
              displayannonce(4)
            when 6
              break
          else
            puts "Merci de choisir un choix valide"
          end
        end
  end

  def shoponly
    puts "\n\nAffichons toutes les annonces de la boutique :\n\n"
        @controlleradmin.index_items(8)
        @@typemenu = 8
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
              displayshop(1)
            when 3
              displayshop(2)
            when 4
              displayshop(3)
            when 5
              displayshop(4)
            when 6
              break
          else
            puts "Merci de choisir un choix valide"
          end
        end
  end

  def displayshoe(id)
    shoes = Shoe.all

    case id
      when 1 
        ordersize(shoes)
      when 2
        ordersizeinverse(shoes)
      when 3
        orderprice(shoes) 
      when 4
        orderpriceinverse(shoes)     
    else
      puts "Merci de choisir un choix valide"
    end
    
  end

  def displayposter(id)
    poster = Poster.all

    case id
      when 1 
        ordersize(poster)
      when 2
        ordersizeinverse(poster)
      when 3
        orderprice(poster) 
      when 4
        orderpriceinverse(poster)     
    else
      puts "Merci de choisir un choix valide"
    end
    
  end

  def displayharddrive(id)
    harddrive = Harddrive.all

    case id
      when 1 
        ordersize(harddrive)
      when 2
        ordersizeinverse(harddrive)
      when 3
        orderprice(harddrive) 
      when 4
        orderpriceinverse(harddrive)     
    else
      puts "Merci de choisir un choix valide"
    end
    
  end

  def displayannonce(id)
    annonce = Annonce.all

    case id
      when 1 
        ordersize(annonce)
      when 2
        ordersizeinverse(annonce)
      when 3
        orderprice(annonce) 
      when 4
        orderpriceinverse(annonce)     
    else
      puts "Merci de choisir un choix valide"
    end
    
  end

  def displayshop(id)
    items = Items.all
    shopitem = []
    items.each do |item|
      if item.author == "shop"
        shopitem << item
      end
    end

    case id
      when 1 
        ordersize(shopitem)
      when 2
        ordersizeinverse(shopitem)
      when 3
        orderprice(shopitem) 
      when 4
        orderpriceinverse(shopitem)     
    else
      puts "Merci de choisir un choix valide"
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