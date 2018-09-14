class Jets::Stack
  class Main
    module Dsl
      extend ActiveSupport::Concern
      autoload :Sns, 'jets/stack/main/extensions/sns'
      autoload :Cloudwatch, 'jets/stack/main/extensions/cloudwatch'

      class_methods do
        include Sns
        include Cloudwatch

        def ref(value)
          "!Ref #{value.to_s.camelize}"
        end

        def logical_id(value)
          value.to_s.camelize
        end

        def depends_on(*stacks)
          if stacks == []
            @depends_on
          else
            @depends_on ||= []
            @depends_on += stacks
          end
        end
      end
    end
  end
end
