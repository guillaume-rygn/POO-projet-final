require_relative '../view_item/view_show'

class View_Shoe_Show < View_Item_Show
  def show(item)
    super(item)
    puts "size : #{item.size}"
  end
end