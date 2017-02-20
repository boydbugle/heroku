class Account
    @@Accounts = []

    define_method(:initialize) do |name|
      @name = name
      @id = @@Accounts.length().+(1)
      @all_loans = []
    end
    

    define_method(:name) do
      @name
    end

    define_method(:id) do
      @id
    end

    define_method(:loans) do
      @all_loans
    end
   

    define_method(:add_loans) do |loan|
        @all_loans.push(loan)
    end
 
    define_singleton_method(:all) do
      @@Accounts
    end

    define_method(:save) do
      @@Accounts.push(self)
    end

    define_singleton_method(:clear) do
      @@Accounts = []
    end

    define_singleton_method(:find) do |id|
      found_user = nil
      @@Accounts.each() do |account|
        if account.id().eql?(id)
          found_user = account
        end
      end
      found_user
    end
  end
