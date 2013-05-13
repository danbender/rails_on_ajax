class MenusController < ApplicationController
  before_filter :authenticated?, :except => :index

  def index
    @menus = Menu.all
    @menu = Menu.new
  end

  def create
    @menu = Menu.new params[:menu]
    @menu.save
  end

  def show
    @menu = Menu.find params[:id]
    @menu_item = @menu.menu_items.build
  end
end
