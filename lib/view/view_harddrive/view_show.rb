require_relative '../view_item/view_show'

class View_Harddrive_Show < View_Item_Show
  def show(item)
    super(item)
    puts "size : #{item.size}"
    puts "storage : #{item.storage}"
  end
end