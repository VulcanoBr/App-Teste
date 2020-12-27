class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end
  
  def search
    if params[:q].blank?
        redirect_to(root_path, alert: "Search esta vazio") and return
    else
        @results = Client.where('name like ? OR email like ?',
        "%#{params[:q]}%", "%#{params[:q]}%")
      #  @results = Car.joins(:user).search(params[:q]).order("users.name DESC")
    end
  end
 
  def show
    
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    client = User.find(params[:id])  
    if client.can_be_destroyed?
      client.destroy!
      redirect_to clients_url, notice: "Cliente foi removido com sucesso."
    else
      redirect_to clients_url, notice: "Cliente #{client.name} NÃO pode ser removido."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :email, :age, :type, :cpf_cnpj, :price, :phone, :unit_price, :q)
    end
end
