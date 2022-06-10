require_relative '../view/view_poster/view_create'
require_relative '../view/view_poster/view_update'
require_relative '../model/poster'
require_relative '../model/annonce'
require_relative 'controller_item'
require_relative '../router_admin'

class Controller_Poster < Controller_Item

  @@item

  def index_items
    posters = Poster.all
    puts "\n\n"  
    i = 0
    posters.each do |item|
      puts "#{i = i + 1} - #{item.name}"
    end
  end

  def show(itemchoice)
    @@item = itemchoice
    poster = Poster.find(itemchoice)
    puts "#{poster.id} - #{poster.name} - prix : #{poster.price} - quantité : #{poster.quantity} - marque : #{poster.brand} - couleur : #{poster.color} - size : #{poster.size}"
    puts "description:"
    puts "> #{poster.description}"
    if poster.author == "user"
      item = Annonce.find(itemchoice)
      puts "Telephone du vendeur : #{item.phone}"
    end
  end

  def create
    params = View_Create_Poster.new.create_item
    item = Poster.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], params.values[7],params.values[8], "shop")
    item.save
    puts "\n\nVotre Poster a bien été enregistré !\n\n"
    @@item = item.id
    Router_Admin.new.menu_function_item(item.id)
  end

  def update(id)
    poster = Poster.find(@@item)
    params = View_Update_Poster.new.update_item(@@item)
    if poster.author == "shop" 
      poster = Poster.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], "poster", params.values[7], "shop")
      poster.saveupdate(@@item)
      puts "Votre poster à bien été mis à jour"
    elsif poster.author == "user"
      newitem = Annonce.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], params.values[7], params.values[8], params.values[9], params.values[10], params.values[11])
      newitem.saveupdate(@@item)
      puts "Votre poster à bien été mis à jour"
    end
  end


end