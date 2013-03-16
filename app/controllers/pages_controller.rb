class PagesController < ApplicationController

  def main
    puts session.inspect
    @user = User.new
  end
  
end
