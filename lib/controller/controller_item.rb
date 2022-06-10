require_relative '../model/item'
require_relative '../view/view_item/view_create'
require_relative '../view/view_item/view_update'
require_relative '../model/annonce'
require_relative '../router_admin'


class Controller_Item

  @@item

  def index_items
    items = Item.all
    puts "\n\n"  
    items.sort_by{|x| x.name.downcase}.each_with_index do |item, index|
      puts "#{index + 1} - #{item.name}"
    end
  end


  def show(itemchoice)
    @@item = itemchoice
    item = Item.find(itemchoice)
    puts "#{item.id} - #{item.name} - prix : #{item.price} - quantité : #{item.quantity} - marque : #{item.brand} - couleur : #{item.color}"
    puts "description:"
    puts "> #{item.description}"
  end

  def create
    params = View_Create_Item.new.create_item
    item = Item.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], "other", params.values[6], "shop")
    item.save
    puts "\n\nVotre Item a bien été enregistré !\n\n"
    @@item = item.id
    Router_Admin.new.menu_function_item
  end

  def update(id)
    item = Item.find(@@item)
    params = @view.update_item(@@item)
    if item.author == "shop"
      newitem = Item.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], "other", params.values[6], "shop")
      newitem.saveupdate(@@item)
      puts "Votre item à bien été mis à jour"
    elsif item.author == "user"
      newitem = Annonce.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], params.values[7], params.values[8], params.values[9], params.values[10], params.values[11])
      newitem.saveupdate(@@item)
      puts "Votre item à bien été mis à jour"
    end
  end

  def delete(id)
    Item.remove(id.to_i)
    puts "suppression réussite"
    Router_Admin.new.menu
  end

end