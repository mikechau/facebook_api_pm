
class PagesController < ApplicationController
  def home
    url = "https://graph.facebook.com/me/home?access_token=#{@current_user.facebook_access_token}"
    
    response = open(url).read
    
    @posts = JSON.parse(response)
    
    @videos = @posts["data"].select {|p| p["type"] == "video"}
  end
end
