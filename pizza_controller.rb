require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('./models/pizza_order')
also_reload('./models/*')


#index - show pizzas

get '/pizza_orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

#new - display form to make a new pizza ordered

get '/pizza_orders/new' do
  erb(:new)

end

#create - create database entry for the pizza pizza_orders

post '/pizza_orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

#edit - display form to edit a pizza ordered

get '/pizza_orders/edit' do
  erb(:edit)

end

#show - display ones

get '/pizza_orders/:id' do

  #p params[:id]
  @order = PizzaOrder.find(params[:id])
  erb(:show)

end

#update - updates a database for the edited ordered

post '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])

  @order.update(params)

  erb(:create)
end
#delete - deletes a pizza order from the database

post '/pizza_orders/delete/:id' do
  @order = PizzaOrder.find(params[:id])
  @order.delete()
  #erb(:delete)
  redirect '/pizza_orders'


end
