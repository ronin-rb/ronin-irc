#
# Copyright (c) 2012 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This file is part of Ronin UI IRC.
#
# Ronin Ui Irc is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Ronin Ui Irc is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Ronin Ui Irc.  If not, see <http://www.gnu.org/licenses/>.
#

require 'ronin/ui/irc/plugin'

module Ronin
  module UI
    module IRC
      module Plugins
        class Help < Plugin

          match 'help'
          match /help (\S+)/

          usage "[COMMAND]"
          summary "Displays help information on plugin(s)"

          def execute(m,command=nil)
            if command
            else
              bot.config.plugins.plugins.each do |plugin|
                m.user.msg("!#{plugin.command_name}\t#{plugin.usage}\t#{plugin.summary}")
              end
            end
          end

        end
      end
    end
  end
end
