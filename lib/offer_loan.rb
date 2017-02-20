class Loan
  initial_resource = 100000
  @@Loans = []
  define_method(:initialize)do |name, amount, month|
    @name = name
    @amount = amount
    @month = month
    @id = @@Loans.length().+(1)
    end
    define_method(:name)do
      @name
    end
    define_method(:amount)do
      @amount
    end
    define_method(:month)do
      @month
    end
    define_method(:id)do
      @id
    end
    define_singleton_method(:all)do
        @@Loans
    end
    define_method(:save) do
      @@Loans.push(self)
    end

    define_singleton_method(:clear) do
      @@Loans = []
    end
    define_method(:worth_giving?) do
      @amount < initial_resource./(0.5)
    end
    define_method(:interest) do
      @amount * (1 + (0.08 * @month))
    end
    define_method(:resource) do
      initial_resource -=(self.interest())
    end
    define_singleton_method(:find) do |identification|
      found_loan_det = nil
      @@Loans.each() do |loan|
        if loan.id().eql?(identification.to_i())
          found_loan_det = loan
        end
      end
      found_loan_det
    end
  end


    # define_method(:offerloan)do
    #   initial_resource -=(@amount)
    # end
    # define_method(:requestloan)do
    #   initial_resource +=(@amount)
    # end

# class Array
#     define_method(:loan) do
#         amount_array = []
#         amount = self.at(0)
#         self.each() do |string|
#              integ_amount = amount.to_i
#             binding-pry
#             amount_array = integ_amount
#             end
#             amount_array
#         end
#     end
# class Bar
#    define_method(:loan) do |arg|
#      arg        You can generate it in https://api.slack.com/web#auth.
#    end
#  end

# class Object
#     def foo(hash={})

#         puts "a: #{hash[:a]}"
#     end
# end
# foo(:a => 13)

# class Bar
#    define_method(:foo) do |variable1, color: 'blue', **other_options, &block|
#      p  variable1
#      p  color
#      p  other_options
#      p  block.inspect
#    end
#  end
#  a = Bar.new do
#      end
#  a.foo :one, color: 'red', ruby: 'is awesome', foo: :bar do
#    'six'
#  end
# # :one
# # "red"
# # {:ruby=>"is awesome", :foo=>:bar}
