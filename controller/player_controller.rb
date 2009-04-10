class PlayerController
  def initialize(window, player)
        @window = window
        @player = player
  end

  def update
    if @window.button_down? Gosu::Button::KbUp then
      @player.turn_up()
    elsif @window.button_down? Gosu::Button::KbDown then
      @player.turn_down()
    elsif @window.button_down? Gosu::Button::KbLeft then
      @player.turn_left()
    elsif @window.button_down? Gosu::Button::KbRight then
      @player.turn_right()
    end
  end
end

