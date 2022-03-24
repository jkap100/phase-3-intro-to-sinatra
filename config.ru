require 'sinatra'

class App < Sinatra::Base
  get '/hello' do
    '<h2>Hello <em>World</em>!</h2>'
  end

  get '/potato' do
    "<p>Boil 'em, mash 'em, stick 'em in a stew</p>"
  end

  set :default_content_type, 'application/json'

  get '/dice' do
    dice_roll = rand(1..6)

    # "<h2>You rolled a #{dice_roll}</h2>"
    { roll: dice_roll }.to_json
  end

  get '/add/:n1/:n2' do
    n1 = params[:n1].to_i
    n2 = params[:n2].to_i

    sum = n1 + n2
    { result: sum }.to_json
  end

  get '/game/:id' do
    game = Game.find(params[:id])
    game.to_json
  end
end

run App
