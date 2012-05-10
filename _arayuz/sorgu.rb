 require 'Qt'
 require 'gettext'
 require 'rubygems'
 require 'net/ldap'

def aramaFonksiyonu_buton
      $aramaFonksiyonu = @line_arama.text.length
	 if $aramaFonksiyonu !=0
    	#Qt::MessageBox.information self, "Information", _("Arama Yapildi.")
	    ldap = Net::LDAP.new :host => 'localhost',
			  :port => 389,
			  :auth => {
			  :method => :simple,
			  :username => "cn=admin,dc=comu,dc=edu,dc=tr",
			  :password => "parola"
	}
	    filter = Net::LDAP::Filter.eq("cn",@line_arama.text)
	    treebase = "dc=comu,dc=edu,dc=tr"

	    ldap.search(:base => treebase, :filter => filter) do |entry|
		  puts "DN: #{entry.dn}"
		  puts "SN: #{entry.sn}"
		  @line_ad1.text = "#{entry.givenName}"
		  @line_sad1.text = "#{entry.sn}"
		  @line_kad1.text = "#{entry.uid}"
		  @line_paswd1.text = "#{entry.userPassword}"
		  puts "bir sorgu yapildi"
	 end
	 else
	    Qt::MessageBox.warning self, "Warning", _("Arama icin veri girmediniz!")
	 end
  end
  
  def eklemeFonksiyonu_buton
    
    dn = "mail=adres@comu.edu.tr,ou=ogrenci,ou=people,dc=comu,dc=edu,dc=tr"
    attr = {
	  :uid => "adres@comu.edu.tr",
	  :cn => "#{@line_ad.text} #{@line_sad.text}",
	  :objectclass => ["organizationalPerson","person","inetorgperson"],
	  :sn => "@line_sad",
	  :givenName => "#{@line_ad.text}",
	  :mail => "#{@line_kad.text}"
    }
=begin
Net::LDAP.open(:host => 'localhost') do |ldap|
  puts "***"
  ldap.add(:dn => dn, :attributes => attr)
end
=end

    Net::LDAP.open( :host => 'localhost', :port => 389,:base => 
	  'cn=#{@line_ad} #{@line_sad}', :auth => { :method => :simple, :username => "cn=admin,dc=comu,dc=edu,dc=tr",
	   :password => 'parola' } ) do |ldap|
	    ldap.add( :dn => dn, :attributes => attr )
    end
  
  end




