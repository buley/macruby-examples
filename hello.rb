framework 'AppKit'

#
# Initialize the stuff
#
# We build the status bar item menu
def setupMenu
  menu = NSMenu.new
  menu.initWithTitle 'FooApp'
  mi = NSMenuItem.new
  mi.title = 'Hellow from MacRuby!'
  mi.action = 'sayHello:'
  mi.target = self
  menu.addItem mi

  mi = NSMenuItem.new
  mi.title = 'Quit'
  mi.action = 'quit:'
  mi.target = self
  menu.addItem mi

  menu
end

# Init the status bar
def initStatusBar(menu)
  status_bar = NSStatusBar.systemStatusBar
  status_item = status_bar.statusItemWithLength(NSVariableStatusItemLength)
  status_item.setMenu menu 
  img = NSImage.new.initWithContentsOfFile 'macruby_logo.png'
  status_item.setImage(img)
end

#
# Menu Item Actions
#
def sayHello(sender)
    alert = NSAlert.new
    alert.messageText = 'This is MacRuby Status Bar Application'
    alert.informativeText = 'Cool, huh?'
    alert.alertStyle = NSInformationalAlertStyle
    alert.addButtonWithTitle("Yeah!")
    response = alert.runModal
end
def quit(sender)
  app = NSApplication.sharedApplication
  app.terminate(self)
end

# Rock'n Roll
app = NSApplication.sharedApplication
# Create the status bar item, add the menu and set the image
initStatusBar(setupMenu)
app.run
