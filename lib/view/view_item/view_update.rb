require_relative '../view'

class View_Item_Update < View
  def update_item(id)
    item = Item.find(id)

    property = item_property

    if item.author == "user"
      phone = phone()
      return params = {id: item.id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], size: "", type: "other", color: property[5], storage: "", author: "user", phone: phone}
    else
      return params = {id: item.id, name: property[0], price: property[1], quantity: property[2], brand: property[3], description: property[4], color: property[5] }
    end

  end
end
