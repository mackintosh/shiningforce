#!/usr/bin/ruby1.8

begin # In case you use Gosu via RubyGems.
  require 'rubygems'
rescue LoadError
end

require 'gosu'
require 'model/player'
require 'controller/maps_controller'
require 'controller/player_controller'


class MyWindow < Gosu::Window
  
  def initialize
    super(312, 240, true, 20)
    self.caption = 'Shining Force: Legend of Ruby'
    @player = Player.new(self, 144, 120)
    @controller = PlayerController.new(self, @player)
    @map = MapsController.new(self, "media/maps/map0.txt")
    @song = Gosu::Song.new(self, "media/music/castle01.mp3")
    @song.play(true)
  end
 
  def update
    @map.draw(@player.dx, @player.dy)
    @player.update()
    @controller.update()
  end

  def draw
  end

  def button_down(id)
    if id == Gosu::Button::KbEscape then
      close
    end
  end
end



w = MyWindow.new
w.show
