class MenusController < ApplicationController
  before_filter :authenticated?, :except => :index

  def index
    @menus = Menu.all
    @menu = Menu.new
  end

  def create
    @menu = Menu.new params[:menu]
    if @menu.save
      redirect_to root_path
    else
      @menus = Menu.all
      render :index
    end
  end

  def show
    @menu = Menu.find params[:id]
    @menu_item = @menu.menu_items.build
  end
end
