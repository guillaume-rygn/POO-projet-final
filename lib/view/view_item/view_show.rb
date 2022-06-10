class View_Item_Show
  def show(item)
    puts "#{item.id} - #{item.name} - prix : #{item.price} - quantité : #{item.quantity} - marque : #{item.brand} - couleur : #{item.color} - type : #{item.type} - vendur : #{item.author}"
    puts "description:" 
    puts "> #{item.description}"
    if item.author == "user"
      itemannonce = Annonce.find(item.id)
      puts "Telephone du vendeur : #{itemannonce.phone}"
    end
  end
 
end