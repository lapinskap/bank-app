class ClientsController < ActionController::Base
    def index
        @clients = Client.all
    end
    def new
        @client = Client.new
    end

    def create
        @client = Client.new(bank_account_params)

        if @client.save
            redirect_to bank_account_path(@bank_account.id)
        else
            render "new"
        end
    end

    def edit
        @client = Client.find(params[:id])
    end
    
    def update
        @client = Client.find(params[:id])

        if @client.update(bank_account_params)
            redirect_to bank_account_path(@bank_account.id)
        else
            render "edit"
        end
    end

    def destroy 
        @client = Client.find(params[:id])

        if @client.balance > 0
            redirect_to bank_account_path(@bank_account.id)
        else
            @client.destroy!
            redirect_to bank_accounts_path
        end
    end

    def show
        @client = Client.find(params[:id])
    end

    private

    def bank_account_params
        params.require(:client).permit(:account_number, :client_id)
    end
end