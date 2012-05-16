 require 'Qt'
 require 'gettext'
 require 'rubygems'
 require 'net/ldap'

def aramaFonksiyonu_buton
      $aramaFonksiyonu = @line_arama.text.length
	 if $aramaFonksiyonu !=0
	    ldap = Net::LDAP.new :host => 'localhost',
			  :port => 389,
			  :auth => {
			  :method => :simple,
			  :username => "cn=admin,dc=comu,dc=edu,dc=tr",
			  :password => "parola"
	}
	    filter = Net::LDAP::Filter.eq("mail",@line_arama.text)
	    treebase = "dc=comu,dc=edu,dc=tr"
       	      ldap.search(:base => treebase, :filter => filter) do |entry|
	     	  puts "DN: #{entry.dn}"
	     	  puts "SN: #{entry.sn}"
	     	  @line_ad1.text = "#{entry.givenName}"
	     	  @line_sad1.text = "#{entry.sn}"
	     	  @line_kad1.text = "#{entry.mail}"
	     	  @line_paswd1.text = "#{entry.userPassword}"
 	      	  puts "bir sorgu yapildi"
              end
	      if "#{@line_ad1.text}" == ""
			puts "**"
			Qt::MessageBox.warning self, "Warning", _("Kayit bulunamadi!")
	      end
	 else
	    Qt::MessageBox.warning self, "Warning", _("Arama icin veri girmediniz!")
	 end
  end
  
  def eklemeFonksiyonu_buton
    
    dn = "mail=#{@line_kad.text},ou=#{$bilgi},ou=people,dc=comu,dc=edu,dc=tr"
    attr = {
	  :uid => "#{@line_kad.text}",
	  :cn => "#{@line_ad.text} #{@line_sad.text}",
	  :objectclass => ["organizationalPerson","person","inetorgperson"],
	  :sn => "#{@line_sad.text}",
	  :givenName => "#{@line_ad.text}",
	  :mail => "#{@line_kad.text}",
	  :userPassword => "#{@line_paswd.text}"
    }

    Net::LDAP.open( :host => 'localhost', :port => 389,:base => 
	  'cn=#{@line_ad.text} #{@line_sad.text}', :auth => { :method => :simple, :username => "cn=admin,dc=comu,dc=edu,dc=tr",
	   :password => 'parola' } ) do |ldap|
	    ldap.add( :dn => dn, :attributes => attr )
    end
  
  end

  def silmeFonksiyonu
    $kullaniciSilme = @line_arama.text.length
         if $kullaniciSilme !=0
            ldap = Net::LDAP.new :host => 'localhost',
                          :port => 389,
                          :auth => {
                          :method => :simple,
                          :username => "cn=admin,dc=comu,dc=edu,dc=tr",
                          :password => "parola"
        }
            filter = Net::LDAP::Filter.eq("mail",@line_arama.text)
            treebase = "dc=comu,dc=edu,dc=tr"

              ldap.search(:base => treebase, :filter => filter) do |entry|
                  puts "DN: #{entry.dn}"
                  puts "SN: #{entry.sn}"
=begin
                  @line_ad1.text = "#{entry.givenName}"
                  @line_sad1.text = "#{entry.sn}"
                  @line_kad1.text = "#{entry.mail}"
                  @line_paswd1.text = "#{entry.userPassword}"
=end
                  ldap.delete :dn => entry.dn
 	          @line_ad1.text = nil
         	  @line_sad1.text = nil
         	  @line_kad1.text = nil
		  @line_paswd1.text = nil
                  puts "bir silme yapildi"
              end
            Qt::MessageBox.information self, "Information", "#{@line_arama.text} Kaydi Silindi"
	     @line_arama.text = nil
         else
            Qt::MessageBox.warning self, "Warning", _("Silme icin veri girmediniz!")
         end
  end

def resetleme    # kullanici aramasi yapildiktan sonra yeni bi arama yapilmasi icin sayfayi temizler
 @line_arama.text = nil 
 @line_ad1.text = nil 
 @line_sad1.text = nil
 @line_kad1.text = nil
 @line_paswd1.text = nil 
end 

def dizinAc
        dosya_adi = Qt::FileDialog.new.getOpenFileName(self, tr("Open Image"))
        puts "#{dosya_adi}"
        puts "dizin"
        myfile = File.open("temp.txt")
        myfile.each do |line| puts line; 
		dizi =line.split(",")
		dizi.each do |i|
			 puts i;
		end
	end
end
