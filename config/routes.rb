TicTacToeRails::Application.routes.draw do
  root 'home#index'

  post 'game/new' => 'game#new'
  get  'game'     => 'game#index'

  post 'api/new' => 'api#new'
  put  'api/play' => 'api#play'
end
