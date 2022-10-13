require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))  

tab = []
for i in 1..61
    x = [page.xpath("//a[@class = 'lientxt']/@href")[i].text[1..-1]].join #[1..-1]pour dégager le premier caractère d'un mot , join pour mettre en string
    page2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{x}"))
    tab = tab << page2.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text  #tab = : pour intégrer des nouvelles valeurs à la suite
end
puts tab