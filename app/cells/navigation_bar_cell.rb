class NavigationBarCell < Cell::Rails

  def left_side_menu(controller, action)
    @action = action
    @controller = controller.split('/').last
#    view = controller.match(/emails/) ? 'emails' : 'emails'
    render view: "left_side_menu"
  end

#   def left_slide_menu(controller, action)
#    @action = action
#    @active = method(:active?)
#    @controller = controller.split('/').last
#    view = controller.match(/my_accounts/) ? 'my_accounts' : 'email_dashboards'
#    render view: "left_slide_menu_#{view}"
#  end
end
