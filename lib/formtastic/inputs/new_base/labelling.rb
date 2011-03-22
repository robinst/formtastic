module Formtastic
  module Inputs
    module NewBase
      module Labelling
        
        include Formtastic::LocalizedString
        
        def label_text
          ((localized_label || humanized_method_name) << requirement_text).html_safe
        end

        def requirement_text_or_proc
          required? ? builder.required_string : builder.optional_string
        end
        
        def requirement_text
          if requirement_text_or_proc.respond_to?(:call)
            requirement_text_or_proc.call
          else
            requirement_text_or_proc
          end
        end

        def label_from_options
          options[:label]
        end

        def localized_label
          localized_string(method, label_from_options, :label)
        end
        
        def render_label?
          return false if options[:label] == false
          true
        end
        
      end
    end
  end
end