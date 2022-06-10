require_relative '../view'

class View_Item_Create < View
  def create_item

    id = Item.all.length
    id = id + 1

    property = item_property

    return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], color: property[5]}
  end

end