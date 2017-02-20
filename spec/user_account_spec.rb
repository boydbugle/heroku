require('rspec')
  require('user_account')
  require ('./lib/offer_loan.rb')

  describe('Account') do
    before() do
      Account.clear()
    end

     describe('#name') do
      it("returns the name of the user") do
        user = Account.new("Kenya Kazi")
        expect(user.name()).to(eq("Kenya Kazi"))
      end
    end
    
    describe('#id') do
      it("returns the id of the user") do
        user = Account.new("Kenya Kazi")
        expect(user.id()).to(eq(1))
      end
    end

    describe('#loans') do
      it("initially returns an empty array of loans for the user") do
        user = Account.new("Kenya Kazi")
        expect(user.loans()).to(eq([]))
      end
    end

    describe('#add_loans') do
      it("adds a new loan to a user") do
        user = Account.new("Kenya Kazi")
        loaning = Loan.new("marty",5000,4)
        user.add_loans(loaning)
        expect(user.loans()).to(eq([loaning]))
      end
    end

    describe(".all") do
      it("is empty at first") do
        expect(Account.all()).to(eq([]))
      end
    end

     describe("#save") do
      it("adds a user to the array of saved users") do
        user = Account.new("Kenya Kazi")
        user.save()
        expect(Account.all()).to(eq([user]))
      end
    end

    describe(".clear") do
      it("empties out all of the saved users") do
        Account.new("Kenya Kazi").save()
        Account.clear()
        expect(Account.all()).to(eq([]))
      end
    end

    describe(".find") do
      it("returns a user by its id number") do
        user = Account.new("Kenya Kazi")
        user.save()
        user1 = Account.new("Radar")
        user1.save()
        expect(Account.find(user1.id())).to(eq(user1))
      end
    end
  end