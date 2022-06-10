class View_Harddrive_Index
  def index(array)
    i = 0
    array.each do |item|
      puts "#{i = i + 1} - #{item.name}"
    end
  end
 
end