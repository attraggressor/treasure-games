Rails.application.routes.draw do

  get 'players_map' => 'player_history_positions#index'

  post 'treasure_hunt.json' => 'player_current_positions#index', defaults: { format: 'json' }

end
