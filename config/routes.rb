Rails.application.routes.draw do

  post 'treasure_hunt.json' => 'player_current_positions#index', defaults: { format: 'json' }

end
