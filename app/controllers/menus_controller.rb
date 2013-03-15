class MenusController < ApplicationController
  before_filter :authenticated?, :except => :index
  respond_to :json, :html

  def index
    @menus = Menu.all
    @menu = Menu.new
  end

  def create
    @menu = Menu.new params[:menu]

    if @menu.save
      render :json => render_to_string(:partial => 'menus/menu', :locals => {:menu => @menu}).to_json
    else
      render :json => @menu.errors.full_messages.join(", "), :status => :unprocessable_entity
    end
  end

  def show
    @menu = Menu.find params[:id]
    @menu_item = @menu.menu_items.build
  end
end
