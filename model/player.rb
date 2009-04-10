class Player

  attr_reader :x, :y, :dy, :dx

  def initialize(window, x, y)
    @x, @y = x, y
    @dx, @dy = x, y

    @player = Gosu::Image.load_tiles(window, "media/down.png", 24, 24, false)
    @up    = @player[0..1]
    @right = @player[2..3]
    @left  = @player[4..5]
    @down  = @player[6..7]
    @cur_image = @down

  end

  def turn_up
      @cur_image = @up
      @dy -= 2 
  end

  def turn_right
      @cur_image = @right
      @dx += 2 
  end

  def turn_left
      @cur_image = @left
      @dx -= 2 
  end

  def turn_down    
      @cur_image = @down
      @dy += 2 
  end

  def update
    img = @cur_image[Gosu::milliseconds / 500 % @cur_image.size]
    img.draw(@x, @y-6, 0, 1.0, 1.0)
  end

end
