class Station
  attr_accessor :trains
  attr_reader :name
  @@stations = []
  NAME_FORMAT = /^[а-я]+$/i

  class << self
    def all
      @@stations
    end
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations << self
  end

  def each_train
    trains.each { |train| yield(train) } if block_given?
  end

  def arrive(train)
    train.stop if trains << train
  end

  def departure(train)
    train.go(50) if trains.delete(train)
  end

  def train_filter_list
    result = { cargo: 0, passanger: 0 }
    trains.each do |train|
      if train.type == 'cargo'
        result[:cargo] += 1
      else
        result[:passanger] += 1
      end
    end
    result
  end

  def train_list
    result = { cargo: 0, passanger: 0 }
    trains.each do |train|
      if train.class == CargoTrain
        result[:cargo] += 1
      else
        result[:passanger] += 1
      end
    end
    result
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  private

  def validate!
    raise 'В названии станции должны быть только русские буквы' if name !~ NAME_FORMAT
    true
  end
end
