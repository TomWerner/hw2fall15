class Class

  def attr_accessor_with_history(*args)
    args.each do |attr_name|
      attr_name = attr_name.to_s   # make sure it's a string
      attr_reader attr_name        # create the attribute's getter
      class_eval %Q(
        def #{attr_name}_history
          if @#{attr_name}_history == nil; @#{attr_name}_history = []; end
          return @#{attr_name}_history
        end
      )
      class_eval %Q(
        def #{attr_name}=(val)
          if @#{attr_name}_history.length == 0; @#{attr_name}_history.push(nil); end
          @#{attr_name}_history.push(val)
          @#{attr_name} = val
        end
      )
    end

  end
end
