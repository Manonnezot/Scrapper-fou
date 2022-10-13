require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))   

crypto_scrapper = Hash.new

def crypto_name(x)
  return [page.xpath("/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{x}]/td[3]/div").text]
end

for i in 1..20
  crypto_scrapper[page.xpath("/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[3]/div").text] = page.xpath("/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[5]/div/a/span").text
end
puts crypto_scrapper

##Pour sauver les erreurs  
##begin
#do_something()
#rescue StandardError => e
  ## Only your app's exceptions are swallowed. Things like SyntaxErrror are left alone. 
#end

#"Maintenant, fini de se faire mâcher le travail par tes gentils formateurs de THP"
#=> non mais LOL!
#ha !
