
require 'rubygems'
require 'gettext'

class HelloWorld
  include GetText

  bindtextdomain("hello", :path => "locale")

  def hello
    print _("Hello World\n")
  end
end

if __FILE__ == $0
  a = HelloWorld.new

  GetText.set_locale_all("en")

  a.hello 

  GetText.set_locale_all("de")
  p GetText.locale.to_s
  a.hello # Show in English
end
