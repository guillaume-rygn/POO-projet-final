require_relative '../view'

class View_Create_Item < View
  def update_item(id)
    id = choice_item

    property = item_property

    item = Item.find(id)
    if item.author == "user"
      phone = phone()
      return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: "", type: "other", color: property[5], storage: "", author: "user", phone: phone}
    else
      return params = {id: id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], color: property[5] }
    end

  end
end
