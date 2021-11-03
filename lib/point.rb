class Point
  attr_reader :x, :y
  def initialize(x,y)
    @x,@y= x, y
  end
  def to_s
    "(#{@x},#{@y})"
  end
  def * (valor)
    Point.new(@x * valor, @y * valor)
  end
end
