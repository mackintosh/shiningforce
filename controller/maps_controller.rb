module Tiles
  Grass = 1029
  Water = 1029
  Tiles = 1400
end

class MapsController
  def initialize(window, filename)
    
    # load 32x32 tiles
    @tileset = Gosu::Image.load_tiles(window, "media/tileset.png", 24, 24, true)
    
    # load map file
    lines = File.readlines(filename).map { |line| line.chop }
    @height = lines.size
    @width = lines[0].size

    @tiles = Array.new(@width) do |x|
      Array.new(@height) do |y|
        case lines[y][x, 1]
        when "f"
          Tiles::Grass
        when "w"
          Tiles::Water
        else
          nil
        end
      end
    end

  end

  def draw(offset_x, offset_y)
   
    @height.times do |y|
      @width.times do |x|
        tile = @tiles[x][y]
        if tile
          @tileset[tile].draw((x * 24) - offset_x, (y * 24) - offset_y, 0)
        end
      end
    end
  end

  def solid(x, y)
    @tiles[x / 24][y / 24]
  end

end
