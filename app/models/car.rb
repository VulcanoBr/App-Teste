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

    def self.search(search)
      if search
          @parameter = search.downcase 
          where(["lower(name) LIKE ?","#{@parameter}"])
      else
        all
      end
    end



#if params[:search].blank?
#  @cars = Car.all
#else
####  @parameter = params[:search].downcase
#    @results = Car.joins(:user).where('lower (users.name) LIKE ?', "%#{@parameter}%").order("users.name DESC")
#   @results = Car.joins(:user).where('users.name LIKE ?', "%#{params[:q]}%").order("users.name DESC")
#   @results = Car.joins(:user).where(params[:q]).order("users.name DESC")
####  @cars = Car.where('lower(name) LIKE ?', "%#{@parameter}%")
#end

end
