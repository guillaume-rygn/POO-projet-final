require_relative '../view/view_shoe/view_create'
require_relative '../view/view_shoe/view_update'
require_relative '../model/shoe'
require_relative '../model/annonce'
require_relative 'controller_item'
require_relative '../router_admin'

class Controller_Shoe < Controller_Item

  @@item

  def index_items
    shoes = Shoe.all
    puts "\n\n"  
    i = 0
    shoes.each do |item|
      puts "#{i = i + 1} - #{item.name}"
    end
  end

  def show(itemchoice)
    @@item = itemchoice
    shoe = Shoe.find(itemchoice)
    puts "#{shoe.id} - #{shoe.name} - prix : #{shoe.price} - quantité : #{shoe.quantity} - marque : #{shoe.brand} - couleur : #{shoe.color} - size : #{shoe.size}"
    puts "description:"
    puts "> #{shoe.description}"
    if shoe.author == "user"
      item = Annonce.find(itemchoice)
      puts "Telephone du vendeur : #{item.phone}"
    end
  end

  def create
    params = View_Create_Shoe.new.create_item
    item = Shoe.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], params.values[7],params.values[8], "shop")
    item.save
    puts "\n\nVotre Chaussure a bien été enregistré !\n\n"
    @@item = item.id
    Router_Admin.new.menu_function_item(item.id)
  end

  def update(id)
    shoe = Shoe.find(@@item)
    params = View_Update_Shoe.new.update_item(@@item)
    if shoe.author == "shop" 
      shoe = Shoe.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], "shoe", params.values[7], "shop")
      shoe.saveupdate(@@item)
      puts "Votre chaussure à bien été mis à jour"
    elsif shoe.author == "user"
      newitem = Annonce.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], params.values[7], params.values[8], params.values[9], params.values[10], params.values[11])
      newitem.saveupdate(@@item)
      puts "Votre chaussure à bien été mis à jour"
    end
  end


end