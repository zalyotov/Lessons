module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(*args)
      @validations ||= []
      @validations << args
    end
  end

  module InstanceMethods
    def validate!
      validations = self.class.validations
      validations.each do |validation|
        self.send(validation[1], instance_variable_get("@#{validation[0]}"), validation[2])
      end
    end

    private

    def presence(var, *)
      raise "Аргумент пустой или nil" if var.to_s.empty?
    end

    def type(var, type)
      raise "Значение атрибута не соответствует заданному классу" unless var.is_a? type
    end

    def format(var, format)
      raise "Значение атрибута не соответствует заданному формату" if var !~ format
    end
  end
end