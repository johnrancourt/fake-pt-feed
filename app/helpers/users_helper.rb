module UsersHelper

=begin
  def randomize
    #get QRDA file and store the string in a variable 
    @QRDA_file = IO.read('app/db/QRDAs/CMS22v2_in_BP.xml')
    #insert a random last name TODO 
  end

  def feedpts   
    #send to a paritcular address
    email(@QRDA_file) 
    #at a particular rate, so pause for this long. 
    #loop until input tells you to stop
  end

=end


end
