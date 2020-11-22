class User < ApplicationRecord

  validates :name, presence: true
  validates :cpf_cnpj, presence: true
  attribute :age, :integer, default: 0

   

  
   # validates_inclusion_of  :name, :in => %w( m, f )

  # validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    validate :cpfcnpj

   validate :idade
 
   # def self.search(q)  
   #               where("lower(user.name) LIKE :q", search: "%#{q}%")  
  #  end

    private

    def cpfcnpj
        if ((cpf_cnpj.nil?)  ||  (cpf_cnpj.empty?)  || (cpf_cnpj.blank?))
            errors.add("",  "CPF não preenchido   !!!  ")
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


end
