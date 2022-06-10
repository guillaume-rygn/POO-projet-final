require_relative'controller_admin'
require_relative '../model/item'
require_relative '../model/shoe'
require_relative '../model/poster'
require_relative '../view/view'

class Controller_Client < Controller_Admin

  def update
    response = @view.buy_item(@@item)

    if response != "n" 
      item = Item.find(@@item)
      if item.type == "other"
        newquantityitem = Item.new(item.id, item.name, item.price, response, item.brand, item.description, item.type, item.color,item.author)
        newquantityitem.saveupdate(newquantityitem.id)
      elsif item.type == "shoe"
        item = Shoe.find(@@item)
        newquantityitem = Shoe.new(item.id, item.name, item.price, response, item.brand, item.description, item.size, item.type, item.color,item.author)
        newquantityitem.saveupdate(newquantityitem.id)
      elsif item.type == "poster"
        item = Poster.find(@@item)
        newquantityitem = Poster.new(item.id, item.name, item.price, response, item.brand, item.description, item.size, item.type, item.color,item.author)
        newquantityitem.saveupdate(newquantityitem.id)
      elsif item.type == "hard drive"
        item = Harddrive.find(@@item)
        newquantityitem = Harddrive.new(item.id, item.name, item.price, response, item.brand, item.description, item.size, item.type, item.color, item.storage,item.author)
        newquantityitem.saveupdate(newquantityitem.id)
      end
    end
    
  end

  def create
    params = @view.create_item("annonce")

    item = Annonce.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], params.values[7],params.values[8], params.values[9], params.values[10], params.values[11])
    item.save
    puts "\n\nVotre Anonnce a bien été enregistré !\n\n"
  end

end