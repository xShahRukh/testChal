class HomeController < ApplicationController
  require 'net/http' 
  
  def index
    begin
      source = 'https://randomuser.me/api'
      resp = Net::HTTP.get_response(URI.parse(source))
      data = resp.body
      @result = JSON.parse(data)
      User.create(data: @result["results"][0])

      @male = User.where("data->>'gender' = ?", "male")
      @female = User.where("data->>'gender' = ?", "female")

    rescue Exception => e
      @error = e
    end
  end
end
