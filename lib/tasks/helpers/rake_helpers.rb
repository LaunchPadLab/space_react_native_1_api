module Tasks
  module Helpers
    class RakeHelpers
      class << self
        def print_success(message)
          puts "\e[32m #{message} \e[0m"
        end

        def print_error(message)
          puts "\e[31m #{message} \e[0m"
        end

        def print_stacktrace(err)
          puts err.backtrace.slice(0, 10)&.join("\n")
        end

        def print_error_and_stacktrack(err)
          print_error(err.to_s)
          print_stacktrace(err)
        end

        def rescue_standard_error
          yield
        rescue StandardError => e
          print_error_and_stacktrack(e)
        end
      end

      def print_success(message)
        self.class.print_success(message)
      end

      def print_error(message)
        self.class.print_error(message)
      end
    end
  end
end
