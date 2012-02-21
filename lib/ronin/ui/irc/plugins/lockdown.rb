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

require 'cinch'
require 'chars'

module Ronin
  module UI
    module IRC
      module Plugins
        class Lockdown

          include Cinch::Plugin

          match 'lockdown'
          match /lockdown (on|off)/

          def execute(m,mode='on')
            if m.channel.opped?(@bot.nick)
              case mode
              when 'on'
                password = Chars.alpha_numeric.random_string(10)

                m.channel.secret      = true
                m.channel.invite_only = true
                m.channel.key         = password

                m.reply "Channel #{m.channel} is now locked down!"
              when 'off'
                m.channel.secret      = false
                m.channel.invite_only = false
                m.channel.key         = nil

                m.reply "Channel #{m.channel} is no longer locked down."
              end
            end
          end

        end
      end
    end
  end
end
