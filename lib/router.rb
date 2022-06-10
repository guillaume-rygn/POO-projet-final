require_relative 'view/view_client'

class Router
  attr_accessor :viewclient

  def initialize
    @viewmenu = View_Client.new
  end

  def perform
   @viewmenu.perform
  end
end