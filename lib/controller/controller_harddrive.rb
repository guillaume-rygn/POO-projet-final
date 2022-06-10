require_relative '../view/view_harddrive/view_create'
require_relative '../view/view_harddrive/view_update'
require_relative '../view/view_harddrive/view_index'
require_relative '../view/view_harddrive/view_show'
require_relative '../router_admin'
require_relative '../model/harddrive'
require_relative '../model/annonce'
require_relative 'controller_item'

class Controller_Harddrive < Controller_Item

  @@item

  def index_items
    harddrives = Harddrive.all
    View_Harddrive_Index.new.index(harddrives)
  end

  def show(itemchoice)
    @@item = itemchoice
    harddrive = Harddrive.find(itemchoice)
    View_Harddrive_Show.new.show(harddrive)
  end

  def create
    params = View_Create_Harddrive.new.create_item
    item = Harddrive.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], params.values[7],params.values[8], params.values[9], "shop")
    item.save
    puts "\n\nVotre dique dur a bien été enregistré !\n\n"
    @@item = item.id
    Router_Admin.new.menu_function_item(item.id)
  end

  def update(id)
    harddrive = Harddrive.find(@@item)
    params = View_Update_Harddrive.new.update_item(@@item)
    if harddrive.author == "user" 
      newitem = Annonce.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], params.values[7], params.values[8], params.values[9], params.values[10], params.values[11])
      item.saveupdate(@@item)
      puts "Votre disque dur à bien été mis à jour"
    elsif harddrive.author == "shop" 
      item = Harddrive.new(params.values[0], params.values[1], params.values[2], params.values[3], params.values[4], params.values[5], params.values[6], params.values[7],params.values[8], params.values[9],"user")
      item.saveupdate(@@item)
      puts "Votre disque dur à bien été mis à jour"
    end
  end


end