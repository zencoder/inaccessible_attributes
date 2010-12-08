module EricChapweske
  module MassAssignmentWithExceptionOnUnsafeAttributes

    def self.included(base)
      base.class_eval do
        alias_method_chain :remove_attributes_protected_from_mass_assignment, :exception_on_unsafe_attributes
      end
    end

    # Raises an exception when mass assigning to unsafe attributes
    def remove_attributes_protected_from_mass_assignment_with_exception_on_unsafe_attributes(attributes)
      safe_attributes = remove_attributes_protected_from_mass_assignment_without_exception_on_unsafe_attributes(attributes)
      if attributes != safe_attributes
        raise RuntimeError, "Cannot mass assign the following attributes: #{(attributes.keys - safe_attributes.keys).to_sentence}"
      end
      safe_attributes
    end

  end
end
