var Menu = {
  init: function() {
    $('a.new-menu').on('click', this.toggleMenuForm);
    $('form#new_menu').on('ajax:success', this.appendMenu);
    $('form#new_menu').on('ajax:error', this.showErrors);
  },

  toggleMenuForm: function(e) {
    e.preventDefault();
    $('form#new_menu').toggleClass('hidden');
  },

  appendMenu: function(event, data) {
    $('ul.menus').append(data)
  },

  showErrors: function(xhr, data, status) {
    if (data.statusText == "Unauthorized") return window.location = data.responseText
    $('ul.menus').before(data.responseText)
  }
}

$(document).ready(function() {
  Menu.init();
})
