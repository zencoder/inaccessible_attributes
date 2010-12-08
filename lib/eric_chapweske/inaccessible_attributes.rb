module EricChapweske
  module InaccessibleAttributes

    def self.extended(base)
      base.disable_mass_assignment
    end

    # If true, requires each attribute to be specified during mass assignment and effectively disables attr_protected.
    def disable_mass_assignment(disable = true)
      disable ? enable_attr_inaccessible : disable_attr_inaccessible
    end

    private
      # Create an empty collection of accessible_attributes
      def enable_attr_inaccessible
        attr_accessible nil
      end

      def disable_attr_inaccessible
        if accessible_attributes.to_a.blank? ||
           (accessible_attributes.size == 1 && accessible_attributes[0].blank?)
          inheritable_attributes.delete(:attr_accessible)
        else
          raise "attr_accessible already defined for #{ accessible_attributes.to_a.to_sentence }. Can't disable"
        end
      end

  end
end
