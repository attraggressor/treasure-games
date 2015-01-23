class PlayerHistoryPositionsController < ApplicationController

  def index
    @players_position = PlayerPosition.all
    @hash = Gmaps4rails.build_markers(@players_position) do |player_position, marker|
      marker.lat player_position.latitude
      marker.lng player_position.longitude
      marker.infowindow "Peter Griffin Ate Here #{player_position.id} HotDog/s"
    end
  end
end
