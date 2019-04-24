module RuboCop
  module Cop
    module GitlabSecurity
      # Checks for disabling the deep munge security control.
      #
      # Disabling this security setting can leave the application open to unsafe
      # query generation
      #
      # @example
      #
      #   # bad
      #   config.action_dispatch.perform_deep_munge = false
      #
      # See CVE-2012-2660, CVE-2012-2694, and CVE-2013-0155.
      class DeepMunge < RuboCop::Cop::Cop
        MSG = 'Never disable the deep munge security option.'.freeze

        def_node_matcher :disable_deep_munge?, <<-PATTERN
          (send (send (send nil? :config) :action_dispatch) :perform_deep_munge= (false))
        PATTERN

        def on_send(node)
          return unless disable_deep_munge?(node)

          add_offense(node, location: :selector)
        end
      end
    end
  end
end
