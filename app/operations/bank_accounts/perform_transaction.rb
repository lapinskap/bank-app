module BankAccounts
    class PerformTransaction
        def initialize(amount: , transaction_type: , bank_account_id: )
            @amount = amount.to_f
            @transaction_type = transaction_type
            @bank_account_id = bank_account_id
            @bank_account = BankAccount.where(id: @bank_account_id).first
        end

        def execute!()
            ActiveRecord::Base.transaction do
                AccountTransaction.create!(
                    bank_account: @bank_account,
                    amount: @amount,
                    transaction_type: @transaction_type
                )

                if @transaction_type == "withdraw"
                    @bank_account.update!(balance: @bank_account.balance.to_f - @amount)
                elsif @transaction_type == "deposit" 
                    @bank_account.update!(balance: @bank_account.balance.to_f + @amount)
                end
            end
            
            @bank_account
        end

        private

    end
end