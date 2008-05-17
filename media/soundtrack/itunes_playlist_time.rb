require 'rubygems'
require 'hpricot'

list = Hpricot.parse(File.read("railsconf_2008_warmup_mix.xml"))
total_milliseconds = 0
(list/:key).each do |key|
  if key.inner_html == 'Total Time'
    total_milliseconds += key.next.inner_html.to_i
  end
end

minutes = total_milliseconds/60000
seconds = (total_milliseconds%60000)/1000
p "Total Time = #{minutes}:#{seconds.to_s.rjust(2,'0')}"