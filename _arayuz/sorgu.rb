 require 'Qt'
 require 'gettext'
 require 'rubygems'
 require 'net/ldap'

$ekleme_onceden_yapilmismi = 0

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

def duzenle	
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
                  ldap.delete :dn => entry.dn
        #          @line_ad1.text = nil
         #         @line_sad1.text = nil
          #        @line_kad1.text = nil
           #       @line_paswd1.text = nil
                  puts "bir silme yapildi"
              end
    dn = "mail=#{@line_kad1.text},ou=ogrenci,ou=people,dc=comu,dc=edu,dc=tr"
    attr = {
          :uid => "#{@line_kad1.text}",
          :cn => "#{@line_ad1.text} #{@line_sad1.text}",
          :objectclass => ["organizationalPerson","person","inetorgperson"],
          :sn => "#{@line_sad1.text}",
          :givenName => "#{@line_ad1.text}",
          :mail => "#{@line_kad1.text}",
          :userPassword => "#{@line_paswd1.text}"
    }

    Net::LDAP.open( :host => 'localhost', :port => 389,:base =>
          'cn=#{@line_ad.text} #{@line_sad.text}', :auth => { :method => :simple, :username => "cn=admin,dc=comu,dc=edu,dc=tr",
           :password => 'parola' } ) do |ldap|
            ldap.add( :dn => dn, :attributes => attr )
    end
puts "*"
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
    dizi = Array.new
    dizi[0] = "#{@line_ad.text} #{@line_sad.text}"  # cn 
    dizi[1] = @line_kad.text  # mail adresi
    dizi[2] = $bilgi
    dizi[3] = @line_paswd.text
    Net::LDAP.open( :host => 'localhost', :port => 389,:base =>
          'cn=#{@line_ad.text} #{@line_sad.text}', :auth => { :method => :simple, :username => "cn=admin,dc=comu,dc=edu,dc=tr",
           :password => 'parola' } ) do |ldap|
            ldap.add( :dn => dn, :attributes => attr )
    end
    file = File.open("ldap.txt","a+")  # tek tek eklenenler 
    line = dizi.join(",")
    file.puts("#{line}")
    
  end

def resetleme    # kullanici aramasi yapildiktan sonra yeni bi arama yapilmasi icin sayfayi temizler
 @line_arama.text = nil 
 @line_ad1.text = nil 
 @line_sad1.text = nil
 @line_kad1.text = nil
 @line_paswd1.text = nil 
end 

def dizinAc  # toplu ekleme parolayi zaten burada uretiyo diye text te parola yazmıyo
        dosya_adi = Qt::FileDialog.new.getOpenFileName(self, tr("Open Image"))
        puts "#{dosya_adi}"
        puts "dizin"
        myfile = File.open("#{dosya_adi}")
        myfile.each do |line| puts line; 
		dizi =line.split(",")
	        puts dizi[0] # cn
		puts dizi[1] # mail
		puts dizi[2] #ou
	        
  	def random_password(size = 8)
          chars = (('a'..'z').to_a + ('0'..'9').to_a) - %w(i o 0 1 l 0)
          (1..size).collect{|a| chars[rand(chars.size)] }.join
        end
            dizi[3] = random_password.inspect
            dizi[3] = dizi[3].gsub!(/\W/,"")
       
		puts dizi[3] # parola
		puts "****"
		@temp = Array.new
		@temp = dizi[0].split(" ") # kullanici adi ve soyadini ayirsin diye
    dn = "mail=#{dizi[1]},ou=#{dizi[2]},ou=people,dc=comu,dc=edu,dc=tr"
    attr = {
          :uid => "#{dizi[1]}",
          :cn => "#{dizi[0]}",
          :objectclass => ["organizationalPerson","person","inetorgperson"],
          :sn => "#{@temp[1]}",
          :givenName => "#{@temp[1]}",
          :mail => "#{dizi[1]}",
          :userPassword => "#{dizi[3]}"
    }
    Net::LDAP.open( :host => 'localhost', :port => 389,:base =>
          'cn=#{dizi[0]}', :auth => { :method => :simple, :username => "cn=admin,dc=comu,dc=edu,dc=tr",
           :password => 'parola' } ) do |ldap|
            ldap.add( :dn => dn, :attributes => attr )
    end
	end
end


def dialogBox
	 text = Qt::InputDialog.getText self, "Input Dialog","Kullanici Sayisini Giriniz:  "
	 puts text 
$i = 0
text = text.to_i
while $i < text
        puts $i
        $i = $i + 1;
	dizi = Array.new
        dizi[0] = "adi#{$i}"
        dizi[1] = "soyad#{$i}"

        def random_password(size = 8)
          chars = (('a'..'z').to_a + ('0'..'9').to_a) - %w(i o 0 1 l 0)
          (1..size).collect{|a| chars[rand(chars.size)] }.join
        end
            dizi[2] = random_password.inspect
            dizi[2] = dizi[2].gsub!(/\W/,"")
        r = rand(2) # r == 0 ise ou = ogrenci degilse ou = person olsun diye 
        line = dizi.join(",")
	newfile = File.open("gecici.txt", "a+")   # gecici kullanicilar text 
	newfile.puts("#{line}")
end
end
def toplu_sil

        dosya_adi = Qt::FileDialog.new.getOpenFileName(self, tr("Open Image"))
        puts "#{dosya_adi}"
        puts "dizin"
        myfile = File.open("#{dosya_adi}")
	dizi = Array.new
	myfile.each do |line| puts line;
                dizi =line.split(",")
                puts dizi[0] # cn
                puts dizi[1] # mail
                puts dizi[2] #ou
	       ldap = Net::LDAP.new :host => 'localhost',
                          :port => 389,
                          :auth => {
                          :method => :simple,
                          :username => "cn=admin,dc=comu,dc=edu,dc=tr",
                          :password => "parola"
        }
            filter = Net::LDAP::Filter.eq("mail",dizi[1])
            treebase = "dc=comu,dc=edu,dc=tr"

              ldap.search(:base => treebase, :filter => filter) do |entry|
                  puts "DN: #{entry.dn}"
                  puts "SN: #{entry.sn}"
                  ldap.delete :dn => entry.dn
	    end
	end
	File.delete("#{dosya_adi}")
end



