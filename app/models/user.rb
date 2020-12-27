class User < ApplicationRecord

    has_many :cars

   # rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed  
    # before_destroy :can_be_destroyed?
    validates :name, presence: true
    validates :cpf_cnpj, presence: true
    attribute :age, :integer, default: 0

    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    validate :cpfcnpj

   validate :idade

    def can_be_destroyed?
        cars.none?
    end
 
   # def self.search(q)  
   #               where("lower(user.name) LIKE :q", search: "%#{q}%")  
  #  end
    def self.search(search)
        if search
            @parameter = search.downcase 
            where(["lower(name) LIKE ?","%#{@parameter}%"])
        else
            all
        end
    end
  #before_validation :convert_price_to_price_cents
   
 # def convert_price_to_price_cents
    before_save do
    #  @unit_price = price
    #  self.unit_price = @unit_price
    end

    private

    def cpfcnpj
        if ((cpf_cnpj.nil?)  ||  (cpf_cnpj.empty?)  || (cpf_cnpj.blank?))
            errors.add(:cpf_cnpj,  "CPF ou CNPJ não preenchido   !!!  ")
        else
            if cpf_cnpj.length ==  14
                cpf = CPF.new(cpf_cnpj)
                # cpf = cpf.stripped
                if !cpf.valid?
                    errors.add(cpf.formatted.to_s, "CPF  invalido   !!!  ")
                end
            else 
                if cpf_cnpj.length ==  18
                    cnpj = CNPJ.new(cpf_cnpj)
                    # cpf = cpf.stripped
                    if !cnpj.valid?
                        errors.add(cnpj.formatted.to_s, "CNPJ  invalido   !!!  ")
                    end
                else 
                    errors.add(cpf_cnpj.to_s, "CPF ou CNPJ  invalido   !!!  ") 
                end 
            end
        end  
        
    end

    def idade
        if age >  60
            errors.add(age.to_s, "Idade maior que 60")
        end
    end

#   def self.can_be_destroyed(id)
   #     @results = Car.joins(:user).where(params[:id])
       # raise "This account cannot be removed" 
        #end
   #     rend'er json: {}, status: :unprocessable_entyty
  #      @ids = id
        ##    @cars = Car.where('lower(name) LIKE ?', "%#{@parameter}%")
        #Car.where('user_id  = ?', "%#{@ids}%")
 #       Car.where(["user_id = ?","#{@ids}"])
       # if @result.length > 0 
        #    # errors.add(:user_id, 'A valid bar_id is valid.')
        #    return @result
        #else
        #    # errors.add(:user_id, 'Teste da query')
       #    return @result
      #  end

  # end

 

end
