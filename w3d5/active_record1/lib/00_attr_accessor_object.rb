class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name| #can be passed multiple variables to set an accessor for
      define_method(name) do
        instance_variable_get("@#{name}")
      end

      define_method("#{name}=") do |value|
        self.instance_variable_set("@#{name}", value)
      end
    end
  end
end
