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
      var = self.class.validations
      var.each do |validation|
        puts "validation[1]: #{validation[1]}"
        puts "validation[0]: #{validation[0]} (#{instance_variable_get("@#{validation[0]}")})"
        puts "validation[2]: #{validation[2]}"
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