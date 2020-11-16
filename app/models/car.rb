class Car < ApplicationRecord
  belongs_to :user

#  def self.search(q)  
#    where("lower(users.name) LIKE :q", search: "%#{q}%").uniq   
#  end
# def self.search(search)
#    if search 
#        where(["lower(name) LIKE ?","%#{search}%"])
 #   else
 #       all
 #   end
#  end
#before_save do
#  self.name = @carname
#end

end
