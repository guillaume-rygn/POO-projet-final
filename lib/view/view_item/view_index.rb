class View_Item_Index

  def index(array)
    puts "\n\n"  
    array.sort_by{|x| x.name.downcase}.each_with_index do |item, index|
      puts "#{index + 1} - #{item.name}"
    end
  end
  
end