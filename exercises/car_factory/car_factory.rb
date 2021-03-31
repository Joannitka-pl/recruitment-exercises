require 'pry'
require_relative 'car'

class CarFactory
  attr_accessor :fdbrand

  SUPPORTED_BRANDS = %i[fiat lancia ford subaru]

  def initialize(factory, brands: SUPPORTED_BRANDS)
    @factory = factory
    @brands = brands

    raise UnsupportedBrandException.brand_not_supported_error(@brands) unless SUPPORTED_BRANDS.include?(@brands) || @brands.is_a?(Array)
  end

  def make_car(fdbrand = nil)
    @fdbrand = fdbrand

    if @brands.is_a?(Array) && @fdbrand == nil
      raise UnsupportedBrandException.no_brand_error
    elsif @brands.is_a?(Array) && !@brands.include?(@fdbrand)
      raise UnsupportedBrandException.no_brand_error
    else
      @fdbrand = @brands
      Car.new(@brands)
    end
  end

  def brand
    if @fdbrand.nil?
      @brands.to_s.capitalize
    else
      @fdbrand.to_s.capitalize
    end
  end

  def name
    if @brands.is_a?(Symbol)
      @factory.to_s + ' (produces ' + @brands.to_s.capitalize + ')'
    elsif @brands.is_a?(Array)
      message = @brands.map { |x| x.to_s.capitalize}.join(', ')
      @factory.to_s + ' (produces ' + message + ')'
    end
  end

  def make_cars(car_amount)
    cars = []
    if car_amount.is_a?(Integer)
    car_amount.times do
      cars << Car.new(SUPPORTED_BRANDS.first)
      SUPPORTED_BRANDS.rotate!(1)
    end
    cars
  else 
    
      car_amount.map {|k,v| if SUPPORTED_BRANDS.include?(k)
        v.times do
      cars << Car.new(k)
        end
      end}
    end
      cars
  end

  class UnsupportedBrandException < StandardError

    def self.brand_not_supported_error(brands)
      raise UnsupportedBrandException, "Brand not supported: '#{(brands).to_s.capitalize}'" unless SUPPORTED_BRANDS.include?(brands)
    end
  
    def self.no_brand_error
      raise UnsupportedBrandException, 'Factory does not have a brand or do not support it' 
    end
  end
end