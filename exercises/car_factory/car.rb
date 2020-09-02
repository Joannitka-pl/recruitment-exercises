class Car
attr_accessor :brand, :color
AVAILABLE_COLORS = %i( black red yellow)

  def initialize(brand, color: AVAILABLE_COLORS.first)
    @brand = brand
    @color = color
    AVAILABLE_COLORS.rotate!(1)
  end

  def brand
    @brand.to_s.capitalize
  end

  def color_name
    @color.to_s.split('_').map{|e| e.capitalize}.join(' ')
  end
end
