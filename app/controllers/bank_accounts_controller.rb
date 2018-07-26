class BankAccountsController < ActionController::Base
    def index
        @bank_accounts = BankAccount.all
    end
    def new
    end

    def create
    end
    
    def update
    end

    def destroy 
    end
    
    def show
        @bank_account = BankAccount.find(params[:id])
    end
end