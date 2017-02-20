require('sinatra')
  require('sinatra/reloader')
  require('./lib/offer_loan')
  require('./lib/user_account')
  also_reload('lib/**/*.rb')

# when only loans configurations
  get('/') do
    erb(:index)
  end

  # get('/my-account') do
  #   @loans = Loan.all()
  #   erb(:accounts)
  # end

  # get('/request/new') do
  #    erb(:request_loan_form)
  # end

  # get('/offer/new') do
  #    erb(:offer_loan_form)
  # end

  get('/my-account/:id') do
    @loans = Loan.find(params.fetch("id"))
    erb(:loan_detail)
  end

post("/calculator") do
    @amount = params.fetch("amnt")
    @month = params.fetch("months")
    @interest = @amount.interest()
    erb(:interest)
  end

  # post("/my-account") do
  #   @name = params.fetch("person")
  #   @amount = params.fetch("amnt")
  #   @month = params.fetch("months")
  #   loaning= Loan.new(@name,@amount,@month)
  #   loaning.save()
  #   erb(:submission)
  # end

#after adding users configurations
  get('/users/new') do
      erb(:new_account)
    end

  get('/users') do
     @users = Account.all()
    # name = params.fetch('name')
    # Account.new(name).save()
    erb(:users)
  end

  post('/users') do
    @name = params.fetch('name')
    Account.new(@name).save()
    erb(:submission)
  end

  get('/users/:id') do
    @user = Account.find(params.fetch('id').to_i())
    erb(:user)
  end

  get('/users/:id/request/new') do
      @user = Account.find(params.fetch('id').to_i())
      erb(:request_loan_form)
  end

  get('/users/:id/offer/new') do
      @user = Account.find(params.fetch('id').to_i())
      erb(:offer_loan_form)
  end

  get('/my-account') do
     @name = params.fetch("person")
     @amount = params.fetch("amnt")
     @month = params.fetch("months")
     loaning= Loan.new(@name,@amount,@month)
     loaning.save()
    @user = Account.find(params.fetch('user_id').to_i())
    @user.add_loans(loaning)
    erb(:accounts)
  end

  # get('my-account/:id') do
  #   @loans = Loan.find(params.fetch("id")).to_i()
  #  erb(:loan_detail)


  