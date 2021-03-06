require_relative'controller_item'
require_relative '../model/item'
require_relative '../model/shoe'
require_relative '../model/poster'
require_relative '../view/view_annonce/view_create'
require_relative '../view/view_annonce/view_update'
require_relative '../view/view_annonce/view_index'



class Controller_Annonce < Controller_Item

  def index_items
    annonces = Item.all
    View_Annonce_Index.new.index(annonces)
  end

  def create
    params = View_Annonce_Create.new.create_item

    item = Annonce.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], params.values[7],params.values[8], params.values[9], params.values[10], params.values[11])
    item.save
    puts "\n\nVotre Anonnce a bien été enregistré !\n\n"
  end

  def update(id)
    response =  View_Annonce_Update.new.buy_item(id)

    if response != "n" 
      item = Item.find(id)
      if item.type == "other"
        newquantityitem = Item.new(item.id, item.name, item.price, response, item.brand, item.description, item.type, item.color,item.author)
        newquantityitem.saveupdate(newquantityitem.id)
      elsif item.type == "shoe"
        item = Shoe.find(id)
        newquantityitem = Shoe.new(item.id, item.name, item.price, response, item.brand, item.description, item.size, item.type, item.color,item.author)
        newquantityitem.saveupdate(newquantityitem.id)
      elsif item.type == "poster"
        item = Poster.find(id)
        newquantityitem = Poster.new(item.id, item.name, item.price, response, item.brand, item.description, item.size, item.type, item.color,item.author)
        newquantityitem.saveupdate(newquantityitem.id)
      elsif item.type == "hard drive"
        item = Harddrive.find(id)
        newquantityitem = Harddrive.new(item.id, item.name, item.price, response, item.brand, item.description, item.size, item.type, item.color, item.storage,item.author)
        newquantityitem.saveupdate(newquantityitem.id)
      end
    end
    
  end



end