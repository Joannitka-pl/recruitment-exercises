class Car
  attr_accessor :brand, :color
  AVAILABLE_COLORS = %i[black red yellow]

  def initialize(brand, color: AVAILABLE_COLORS.first)
    @brand = brand
    @color = color
    AVAILABLE_COLORS.rotate!(1)
  end

  def brand
    if @brand.is_a?(Array)
      @brand.first.to_s.capitalize
    else
      @brand.to_s.capitalize
    end
  end

  def color_name
    @color.to_s.split('_').map { |e| e.capitalize }.join(' ')
  end
end
