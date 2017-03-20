class CargoTrain < Train
  def add_wagon(wagon)
    super if wagon.type == wagon_type
  end

  def remove_wagon(wagon)
    super if wagon.type == wagon_type
  end
  
  private

  def wagon_type
    "cargo"
  end
end