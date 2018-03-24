class HomeController < ApplicationController
  before_filter :authenticate_user!, only: [:dashboard]

  def index
  end

  def dashboard
  	respond_to do |format|
      format.html 
      format.js   
    end
  end
end
