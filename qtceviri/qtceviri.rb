require 'gettext'
require 'Qt'

class Ui_Form < Qt::Widget

slots  'fonksiyon()'

include GetText

def setupUi(form)

def fonksiyon
bindtextdomain("qtceviri", :path => "locale")
GetText.set_locale_all("de")
@lineEdit.text = gettext("Hello World")
puts "kkk"
end


form.resize(308, 247)
    @pushButton = Qt::PushButton.new(form)
   
    @pushButton.geometry = Qt::Rect.new(166, 186, 111, 31)
    @lineEdit = Qt::LineEdit.new(form)
 
    @lineEdit.geometry = Qt::Rect.new(40, 30, 131, 61)

    Qt::MetaObject.connectSlotsByName(form)

    form.windowTitle = Qt::Application.translate("Form", "Form", nil, Qt::Application::UnicodeUTF8)
    @pushButton.text = Qt::Application.translate("Form", "PushButton", nil, Qt::Application::UnicodeUTF8)
    @lineEdit.text = "Hello World"
    
    Qt::Object.connect(@pushButton,SIGNAL('clicked()'),self,SLOT('fonksiyon()'))
    

end
end

if $0 == __FILE__
    a = Qt::Application.new ARGV
    u = Ui_Form.new
    w = Qt::Widget.new
    u.setupUi(w)
    w.show
    a.exec
end
