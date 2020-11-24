require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult1 = Cult.new("Minh Giao", "Texas", 2020, "Kill")
cult2 = Cult.new("Nga My", "DC", 2019, "Support")
cult3 = Cult.new("Thien Son", "DC", 2020, "Independent")

fl1 = Follower.new("Rahel", 29, "motto1")
fl2 = Follower.new("Duncan", 19, "motto2")
fl3 = Follower.new("Jesus", 23, "motto3")
fl4 = Follower.new("Meredith", 32, "motto6")
fl5 = Follower.new("Raul", 27, "motto4")

bo1 = BloodOath.new("2020/11/16", fl1, cult1)
bo2 = BloodOath.new("2020/10/13", fl2, cult3)
bo3 = BloodOath.new("2020/11/11", fl5, cult3)
bo4 = BloodOath.new("2020/09/12", fl3, cult2)
bo5 = BloodOath.new("2020/01/16", fl4, cult1)
bo6 = BloodOath.new("2019/01/16", fl1, cult3)
bo7 = BloodOath.new("2019/11/16", fl2, cult1)
bo8 = BloodOath.new("2020/03/16", fl2, cult2)
bo9 = BloodOath.new("2020/11/20", fl5, cult1)




binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits