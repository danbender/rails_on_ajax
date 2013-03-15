class MenuItemsController < ApplicationController
  before_filter :load_menu
  respond_to :json, :html

  def create
    @menu_item = @menu.menu_items.build params[:menu_item]
    if @menu_item.save
      render :json => render_to_string(:partial => 'menus/menu_item', :locals => {:item => @menu_item})
    else
      render :json => @menu_item.errors.full_messages.join(", "), :status => :unprocessable_entity
    end
  end

  private

  def load_menu
    @menu = Menu.find params[:menu_id]
  end
end
