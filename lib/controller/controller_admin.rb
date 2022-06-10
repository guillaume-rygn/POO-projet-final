require_relative '../model/item'
require_relative '../view/view'
require_relative '../model/shoe'
require_relative '../model/poster'
require_relative '../model/harddrive'
require_relative '../model/annonce'


class Controller_Admin

  @@item

  def initialize
    @view = View.new
  end

  def index_items(id)
    items = Item.all
    puts "\n\n"  
    if id == 1
      items.sort_by{|x| x.name.downcase}.each_with_index do |item, index|
        puts "#{index + 1} - #{item.name}"
      end
    elsif id == 2
      items.sort_by{|x| x.price[1..-1].to_f}.each_with_index do |item, index|
        puts "#{index + 1} - #{item.name} - #{item.price}"
      end
    elsif id == 3
      items.sort_by{|x| x.price[1..-1].to_f}.reverse!.each_with_index do |item, index|
        puts "#{index + 1} - #{item.name} - #{item.price}"
      end
    elsif id == 4
      i = 1
      items.each do |item|
        if item.type == "shoe"
          puts "#{i} - #{item.name}"
          i = i + 1
        end
      end
    elsif id == 5
      i = 1
      items.each do |item|
        if item.type == "poster"
          puts "#{i} - #{item.name}"
          i = i + 1
        end
      end
    elsif id == 6
      i = 1
      items.each do |item|
        if item.type == "hard drive"
          puts "#{i} - #{item.name}"
          i = i + 1
        end
      end
    elsif id == 7
      i = 1
      items.each do |item|
        if item.author == "user"
          puts "#{i} - #{item.name} - type :#{item.type}"
          i = i + 1
        end
      end
    elsif id == 8
      i = 1
      items.each do |item|
        if item.author == "shop"
          puts "#{i} - #{item.name} - type :#{item.type}"
          i = i + 1
        end
      end
    end
  end

  def show(itemchoice)
    @@item = itemchoice
    item = Item.find(itemchoice)
    puts "#{item.id} - #{item.name} - prix : #{item.price} - quantité : #{item.quantity} - marque : #{item.brand} - couleur : #{item.color}"
    puts "description:"
    puts "> #{item.description}"
    if item.type == "shoe"
      shoe = Shoe.find(itemchoice)
      puts "size : #{shoe.size}"
    end
    if item.type == "poster"
      poster = Poster.find(itemchoice)
      puts "size : #{poster.size}"
    end
    if item.type == "hard drive"
      harddrive = Harddrive.find(itemchoice)
      puts "size : #{harddrive.size}"
      puts "storage : #{harddrive.storage}"
    end
    if item.author == "user"
      item = Annonce.find(itemchoice)
      puts "Telephone du vendeur : #{item.phone}"
    end

    return item
  end

  def create
    params = @view.create_item("article")

    
    if params.values.length < 8
      item = Item.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], "other", params.values[6], "shop")
      item.save
      puts "\n\nVotre Item a bien été enregistré !\n\n"
    else 
      if params.values[7] == "shoe"
        item = Shoe.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], params.values[7],params.values[8], "shop")
        item.save
        puts "\n\nVotre Chaussure a bien été enregistré !\n\n"
      elsif params.values[7] == "hard drive"
        item = Harddrive.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], params.values[7],params.values[8], params.values[9], "shop")
        item.save
        puts "\n\nVotre dique dur a bien été enregistré !\n\n"
      else
        item = Poster.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], params.values[7],params.values[8], "shop")
        item.save
        puts "\n\nVotre Poster a bien été enregistré !\n\n"
      end
    end

    @@item = item.id
    View_Menu.new.menu_function_item
  end

  def update
    item = Item.find(@@item)
    params = @view.update_item(@@item)
    if item.type == "other"
      if item.author == "shop"
        newitem = Item.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], "other", params.values[6], "shop")
        newitem.saveupdate(@@item)
        puts "Votre item à bien été mis à jour"
      elsif item.author == "user"
        newitem = Annonce.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], params.values[7], params.values[8], params.values[9], params.values[10], params.values[11])
        newitem.saveupdate(@@item)
        puts "Votre item à bien été mis à jour"
      end
    elsif item.type == "shoe"
      if item.author == "shop" 
        item = Shoe.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], "shoe", params.values[7], "shop")
        item.saveupdate(@@item)
        puts "Votre chaussure à bien été mis à jour"
      elsif item.author == "user"
        newitem = Annonce.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], params.values[7], params.values[8], params.values[9], params.values[10], params.values[11])
        item.saveupdate(@@item)
        puts "Votre chaussure à bien été mis à jour"
      end
    elsif item.type == "poster"
      if item.author == "user" 
        newitem = Annonce.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], params.values[7], params.values[8], params.values[9], params.values[10], params.values[11])
        item.saveupdate(@@item)
        puts "Votre poster à bien été mis à jour"
      elsif item.author == "shop" 
        item = Poster.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], "poster", params.values[7], "user")
        item.saveupdate(@@item)
        puts "Votre poster à bien été mis à jour"
      end

    elsif item.type == "hard drive"
      if item.author == "user" 
        newitem = Annonce.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], params.values[7], params.values[8], params.values[9], params.values[10], params.values[11])
        item.saveupdate(@@item)
        puts "Votre disque dur à bien été mis à jour"
      elsif item.author == "shop" 
        item = Harddrive.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], "poster",params.values[7], params.values[8],"user")
        item.saveupdate(@@item)
        puts "Votre disque dur à bien été mis à jour"
      end
    end

  end

  def delete
    Item.remove(@@item.to_i)
    puts "suppression réussite"
    View_Menu.new.menu
  end

end