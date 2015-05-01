#@author:Zuishek
Then(/^Number of requests should be (\d+)$/) do |arg1|
Request.where(:offerer_id => 1).where(:response => nil).count.should == arg1.to_i
end