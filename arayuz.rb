#karakter girilmedignde pencere acan cancel , ok guncellme rejected calisiyo personl icin faklte etkn degl eksk line girlrse uyarı verir
 require 'Qt'


$ad = 0
$sad = 0
$kad = 0
$paswd = 8

class Uygulama < Qt::TabWidget
  

    slots  'onchangedAd(QString)'
    slots 'onchangedkAd(QString)'
     slots 'onchangedsAd(QString)'
      slots 'onchangedpaswd(QString)'
    slots 'fonksiyon()'
    signals 'my_signals(QString)'
 
 def setupUi(tabWidget)
	
   def random_password(size = 8)
  chars = (('a'..'z').to_a + ('0'..'9').to_a) - %w(i o 0 1 l 0)
  (1..size).collect{|a| chars[rand(chars.size)] }.join
end 
    $parola = random_password.inspect
   
   
	tabWidget.resize(571, 399)
        @tab = Qt::Widget.new()
	@button_ = Qt::DialogButtonBox.new(@tab)
	@button_.geometry = Qt::Rect.new(320, 310, 176, 27)
	@button_.standardButtons = Qt::DialogButtonBox::Cancel|Qt::DialogButtonBox::Ok
	@label_kad = Qt::Label.new(@tab)
	@label_kad.geometry = Qt::Rect.new(20, 160, 81, 20)
	@label_sad = Qt::Label.new(@tab)
	@label_sad.geometry = Qt::Rect.new(20, 80, 81, 20)
	@label_ad = Qt::Label.new(@tab)
	@label_ad.geometry = Qt::Rect.new(20, 40, 81, 20)
	@label_paswd = Qt::Label.new(@tab)
	@label_paswd.geometry = Qt::Rect.new(20, 120, 81, 20)
	@line_ad = Qt::LineEdit.new(@tab)
	@line_ad.geometry = Qt::Rect.new(160, 30, 113, 27)
	@line_sad = Qt::LineEdit.new(@tab)
	@line_sad.geometry = Qt::Rect.new(160, 70, 113, 27)
	@line_paswd = Qt::LineEdit.new(@tab)
	
	@line_paswd.text = Qt::Application.translate(nil, $parola, nil, Qt::Application::UnicodeUTF8)
	
	#@line_paswd.text = "türkçeKarakter"
	@line_paswd.geometry = Qt::Rect.new(160, 110, 113, 27)
	@line_kad = Qt::LineEdit.new(@tab)
	@line_kad.geometry = Qt::Rect.new(160, 150, 113, 27)
	@radio_ogr = Qt::RadioButton.new(@tab)
	@radio_ogr.geometry = Qt::Rect.new(350, 30, 116, 22)
	@radio_per = Qt::RadioButton.new(@tab)
	@radio_per.geometry = Qt::Rect.new(350, 80, 116, 22)
	@comboBox_fklt = Qt::ComboBox.new(@tab)
	@comboBox_fklt.geometry = Qt::Rect.new(160, 200, 111, 27)
	@label_fklt = Qt::Label.new(@tab)
	@label_fklt.geometry = Qt::Rect.new(20, 210, 81, 20)
	@label_bol = Qt::Label.new(@tab)
	@label_bol.geometry = Qt::Rect.new(20, 250, 81, 20)
	@comboBox_bol = Qt::ComboBox.new(@tab)
	@comboBox_bol.geometry = Qt::Rect.new(160, 240, 111, 27)
	tabWidget.addTab(@tab, Qt::Application.translate("TabWidget", "Tab 1", nil, Qt::Application::UnicodeUTF8))
	@tab1 = Qt::Widget.new()
	@button_1 = Qt::DialogButtonBox.new(@tab1)
	@button_1.geometry = Qt::Rect.new(320, 310, 176, 27)
	@button_1.standardButtons = Qt::DialogButtonBox::Cancel|Qt::DialogButtonBox::Ok
	@label_kad1 = Qt::Label.new(@tab1)
	@label_kad1.geometry = Qt::Rect.new(20, 160, 81, 20)
	@label_sad1 = Qt::Label.new(@tab1)
	@label_sad1.geometry = Qt::Rect.new(20, 80, 81, 20)
	@label_ad1 = Qt::Label.new(@tab1)
	@label_ad1.geometry = Qt::Rect.new(20, 40, 81, 20)
	@label_paswd1 = Qt::Label.new(@tab1)
	@label_paswd1.geometry = Qt::Rect.new(20, 120, 81, 20)
	@line_ad1 = Qt::LineEdit.new(@tab1)
	@line_ad1.geometry = Qt::Rect.new(160, 30, 113, 27)
	@line_sad1 = Qt::LineEdit.new(@tab1)
	@line_sad1.geometry = Qt::Rect.new(160, 70, 113, 27)
	@line_paswd1 = Qt::LineEdit.new(@tab1)

	@line_paswd1.geometry = Qt::Rect.new(160, 110, 113, 27)
	@line_kad1 = Qt::LineEdit.new(@tab1)
	@line_kad1.geometry = Qt::Rect.new(160, 150, 113, 27)
	@radio_ogr1 = Qt::RadioButton.new(@tab1)
	@radio_ogr1.geometry = Qt::Rect.new(350, 30, 116, 22)
	@radio_per1 = Qt::RadioButton.new(@tab1)
	@radio_per1.geometry = Qt::Rect.new(350, 80, 116, 22)
	@comboBox_fklt1 = Qt::ComboBox.new(@tab1)
	@comboBox_fklt1.geometry = Qt::Rect.new(160, 200, 111, 27)
	@label_fklt1 = Qt::Label.new(@tab1)
	@label_fklt1.geometry = Qt::Rect.new(20, 210, 81, 20)
	@label_bol1 = Qt::Label.new(@tab1)
	@label_bol1.geometry = Qt::Rect.new(20, 250, 81, 20)
	@comboBox_bol1 = Qt::ComboBox.new(@tab1)
	@comboBox_bol1.geometry = Qt::Rect.new(160, 240, 111, 27)
	
	 @label_kad1.text = Qt::Application.translate("TabWidget", "Kullan\304\261c\304\261 Ad\304\261", nil, Qt::Application::UnicodeUTF8)
        @label_sad1.text = Qt::Application.translate("TabWidget", "Soyad", nil, Qt::Application::UnicodeUTF8)
        @label_ad1.text = Qt::Application.translate("TabWidget", "Ad", nil, Qt::Application::UnicodeUTF8)
        @label_paswd1.text = Qt::Application.translate("TabWidget", "Parola", nil, Qt::Application::UnicodeUTF8)
        @radio_ogr1.text = Qt::Application.translate("TabWidget", "\303\226grenci", nil, Qt::Application::UnicodeUTF8)
        @radio_per1.text = Qt::Application.translate("TabWidget", "Personel", nil, Qt::Application::UnicodeUTF8)
        @label_fklt1.text = Qt::Application.translate("TabWidget", "Fak\303\274lte", nil, Qt::Application::UnicodeUTF8)
        @label_bol1.text = Qt::Application.translate("TabWidget", "B\303\266l\303\274m", nil, Qt::Application::UnicodeUTF8)
	tabWidget.addTab(@tab1, Qt::Application.translate("TabWidget", "Tab 2", nil, Qt::Application::UnicodeUTF8))
	tabWidget.setCurrentIndex(0)
	Qt::MetaObject.connectSlotsByName(tabWidget)  #bunu pek anlamadim 
	tabWidget.windowTitle = Qt::Application.translate("TabWidget", "TabWidget", nil, Qt::Application::UnicodeUTF8)
        @label_kad.text = Qt::Application.translate("TabWidget", "Kullan\304\261c\304\261 Ad\304\261", nil, Qt::Application::UnicodeUTF8)
        @label_sad.text = Qt::Application.translate("TabWidget", "Soyad", nil, Qt::Application::UnicodeUTF8)
        @label_ad.text = Qt::Application.translate("TabWidget", "Ad", nil, Qt::Application::UnicodeUTF8)
        @label_paswd.text = Qt::Application.translate("TabWidget", "Parola", nil, Qt::Application::UnicodeUTF8)
        @radio_ogr.text = Qt::Application.translate("TabWidget", "\303\226grenci", nil, Qt::Application::UnicodeUTF8)
        @radio_per.text = Qt::Application.translate("TabWidget", "Personel", nil, Qt::Application::UnicodeUTF8)
        @label_fklt.text = Qt::Application.translate("TabWidget", "Fak\303\274lte", nil, Qt::Application::UnicodeUTF8)
        @label_bol.text = Qt::Application.translate("TabWidget", "B\303\266l\303\274m", nil, Qt::Application::UnicodeUTF8)
        tabWidget.setTabText(tabWidget.indexOf(@tab), Qt::Application.translate("TabWidget", "Ekle", nil, Qt::Application::UnicodeUTF8))
        tabWidget.setTabText(tabWidget.indexOf(@tab1), Qt::Application.translate("TabWidget", "Düzenle", nil, Qt::Application::UnicodeUTF8))
 
=begin
 Qt::Object.connect(@radio_per, SIGNAL('clicked(bool)'), @comboBox_bol, SLOT('setDisabled(bool)'))
 Qt::Object.connect(@radio_per, SIGNAL('clicked(bool)'), @comboBox_fklt, SLOT('setDisabled(bool)'))
 Qt::Object.connect(@radio_ogr, SIGNAL('clicked(bool)'), @comboBox_bol, SLOT('setEnabled(bool)'))
 Qt::Object.connect(@radio_ogr, SIGNAL('clicked(bool)'), @comboBox_fklt, SLOT('setEnabled(bool)'))
=end
 Qt::Object.connect(@line_ad,SIGNAL('textChanged(QString)'),self,SLOT('onchangedAd(QString)'))
 Qt::Object.connect(@line_kad,SIGNAL('textChanged(QString)'),self,SLOT('onchangedkAd(QString)'))
 Qt::Object.connect(@line_paswd,SIGNAL('textChanged(QString)'),self,SLOT('onchangedpaswd(QString)'))
 Qt::Object.connect(@line_sad,SIGNAL('textChanged(QString)'),self,SLOT('onchangedsAd(QString)'))


def onchangedAd text
        $ad = text.length
        print $ad , "    ad : \n"

    end
def onchangedkAd text
        $kad = text.length
        print $kad , "    kad : \n"

    end



 def onchangedsAd text
        $sad = text.length
        print $sad , "    sad  \n"
    end
 def onchangedpaswd text
        $paswd = text.length
        print $paswd , "    paswd : \n"

    end

    def fonksiyon
      $x = 2
	puts "fonksiyon icine gelindi "
        dizi = Array.new
        dizi.push($ad)
        dizi.push($sad)
	dizi.push($kad)
	dizi.push($paswd)
        dizi.each do |i|
           if i == 0
	     $x = 0
	       button = sender  #?? anlamadim
	       Qt::MessageBox.warning self, "Warning", "Eksik Bilgi Girdiniz!"
	       puts "i == 0"
=begin
                quit = Qt::PushButton.new('Quit')
                quit.resize(75, 30)
                quit.setFont(Qt::Font.new('Times', 18, Qt::Font::Bold))
                Qt::Object.connect(quit, SIGNAL('clicked()'), quit, SLOT('close()'))
                quit.show()
=end 
	        break
	   end
       	end
      if $paswd < 8 and $x != 0
		puts "$paswd < 8"
		Qt::MessageBox.warning self, "Warning", "8 karakterden az karakter girdiniz!"
		
      end
      if $x!=0 and $paswd >= 8
	  puts "update()"
	  update()
	  Qt::MessageBox.information self, "Information", "Bilgiler Kaydedildi"     
      end
     
    end

 Qt::Object.connect(@button_, SIGNAL('rejected()'), tabWidget, SLOT('close()'))
 Qt::Object.connect(@button_, SIGNAL('accepted()'),self, SLOT('fonksiyon()'))

 Qt::Object.connect(@button_1,SIGNAL('rejected()'),tabWidget,SLOT('close()'))
 Qt::Object.connect(@button_1,SIGNAL('accepted()'),tabWidget,SLOT('update()'))

   end
end


if $0 == __FILE__
   a = Qt::Application.new ARGV
   u = Uygulama.new
   w = Qt::TabWidget.new
   u.setupUi(w)
   w.show

   a.exec

end






	