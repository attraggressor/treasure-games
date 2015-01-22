class PlayerCurrentPositionsController < ApplicationController
  before_action :player_params, :player_check, :player_throttle

  WIN_DISTANCE = 5

  def index

    treasure_location = TreasurePosition.active
    distance = DistanceCounterService.count_distance(@current_location ,treasure_location).to_i

    if distance.between?(0, WIN_DISTANCE)
      PlayerMailer.treasure_notice(@email).deliver

    elsif distance > WIN_DISTANCE
      msg = { :status => 'ok', :distance => distance }

    elsif distance < 0
      msg = { :status => 'error', :distance => "Success!", :error => "wrong value" }
    end

    respond_with(msg)
  end

  private

  def player_throttle
    key = player_token_key
    player_cache = Rails.cache.fetch(key, expires_in: 1.minute) { 1 }

    if player_cache.to_i < 20
      Rails.cache.write(key, player_cache + 1)
    else
      msg = {:status => 'error', :error => "503"}
      respond_with(msg)
    end
  end

  def player_token_key
    "#{@token}_cache_key_#{Time.now.strftime("%H%M%d%m%y")}"
  end

  def player_check
    @player = Player.find_or_create_by(token: @token)
    @player.player_positions.create do |player_position|
      player_position.latitude = @current_location.first
      player_position.longitude = @current_location.second
    end
  end

  def player_params
    @token = params[:token]
    @current_location = params[:current_location].map(&:to_f)
    @email = params[:email]
  end

  def respond_with(msg)
    respond_to do |format|
      format.json  { render :json => msg }
    end
  end
end
