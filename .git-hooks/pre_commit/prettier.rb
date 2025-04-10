module Overcommit
  module Hook
    module PreCommit
      class Prettier < Base
        BOLD_RED_COLOR = '1;31'.freeze
        PRETTIER_WARNING = '[warn] Code style issues found in the above file(s). Forgot to run Prettier?'.freeze

        def run
          # Overcommit does not have a default hook for Prettier. To get around this issue, this custom pre-hook needs to be defined
          # in order to be able to set the specific rules for files we want to run prettier against.
          # References:
          # https://github.com/sds/overcommit/blob/master/config/default.yml
          # https://github.com/sds/overcommit/issues/614#issuecomment-1058583008
          # In the event over-commits decides to add "Prettier" as a default hook we might want to explore that instead.
          
          result = execute(command, args: applicable_files)
          output = result.stderr.chomp
          has_warning = output.split("\n").any?(PRETTIER_WARNING)

          return :fail, warning_message(output) if has_warning

          :pass
        end

        private

        def warning_message(message)
          "\e[#{BOLD_RED_COLOR}m#{message}\e[0m"
        end
      end
    end
  end
end
