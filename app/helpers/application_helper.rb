module ApplicationHelper
    def number_of_accounts
        BankAccount.count
    end
    def number_of_clients
        Client.count
    end
end
