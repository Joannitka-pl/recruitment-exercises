require_relative 'car'

class CarPark
  attr_accessor :capacity, :cars

  def initialize(capacity)
    @capacity  = capacity

    @cars = []
  end

  def places_left
    @capacity
  end

  def receive(*car)
    car.flatten!
    car.length.times do
    
      if @capacity >= 1
      @cars.push(car.slice!(0))
      @cars.flatten!
      @capacity -=1
      
      else
        puts 'There is not enough space for all cars.'
      end
    end

  def retrieve(n)
    @cars.pop(n)
  end

  def brands
    @cars.map(&:brand).uniq
  end

  def brands_stats
    brands = @cars.map(&:brand) 
    counts = Hash.new(0)
    brands.each { |name| counts[name] += 1 }
    return counts
    end
  end
end
