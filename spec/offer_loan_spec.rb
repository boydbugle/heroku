require ('rspec')
require ('./lib/offer_loan.rb')

  describe('Loan')do
    before() do
      Loan.clear()
    end
    describe('.name')do
        it("returns the name")do
          loaning= Loan.new("marty",5000,4)
          expect(loaning.name()).to(eq("marty"))
      end
    end
      describe('.amount')do
          it("returns the amount with interest")do
            loaning= Loan.new("marty",5000,4)
            expect(loaning.amount()).to(eq(5000))
        end
    end
      describe('.month')do
        it("returns the month to pay")do
          loaning= Loan.new("marty",5000,4)
          expect(loaning.month()).to(eq(4))
        end
      end
    describe(".all") do
      it("is empty at first") do
        expect(Loan.all()).to(eq([]))
      end
    end
    describe(".save") do
      it("adds a Loan det to the array of saved Loans") do
        loaning= Loan.new("marty",5000,4)
        loaning.save()
        expect(Loan.all()).to(eq([loaning]))
      end
    end
    describe(".clear") do
      it("empties out all of the saved vehicles") do
        Loan.new("marty",5000,4)
        Loan.clear()
        expect(Loan.all()).to(eq([]))
      end
    end

    describe(".worth_giving?") do
      it("returns true if the amount is less than the current resource by half") do
        loaning= Loan.new("marty",5000,4)
        expect(loaning.worth_giving?()).to(eq(true))
      end
    end
    describe(".id") do
      it("returns the id of the vehicle") do
        loaning= Loan.new("marty",5000,4)
        loaning.save()
        expect(loaning.id()).to(eq(1))
      end
    end
    describe(".interest") do
      it("returns the amount as interest") do
        loaning= Loan.new("marty",10000,4)
        expect(loaning.interest()).to(eq(13200))
      end
    end
    describe(".resource") do
      it("returns the current resource from initial resource") do
        loaning= Loan.new("marty",10000,4)
        expect(loaning.resource()).to(eq(86800))
      end
    end
   describe(".find") do
    it("returns a Loan by its id number") do
      loaning= Loan.new("marty",5000,4)
      loaning.save()
      loaning1= Loan.new("Randy",3000,3)
      loaning.save()
      expect(Loan.find(loaning.id())).to(eq(loaning))
    end
   end
  end
      # describe('#offerloan')do
      #     it("returns the current resource pool ")do
      #       loaning= Loan.new("marty",5000,4)
      #       expect(loaning.offerloan()).to(eq(95000))
      #     end
      #   end
      #   describe('#requestloan')do
      #       it("returns the current resource pool ")do
      #         loaning= Loan.new("marty",4000,4)
      #         expect(loaning.requestloan()).to(eq(99000))
      #       end
      #     end

    # describe('Fixnum#loan')do
    #     it("returns amount with interest")do
    #         expect(("1000").loan()).to(eq(1100))
    #     end
    # end
