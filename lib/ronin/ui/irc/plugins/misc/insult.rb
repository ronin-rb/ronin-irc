# encoding: utf-8
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
        class Insult < Plugin

          INSULTS = [
            "ಠ_ಠ",
            "weak bro",
            "I think you could use a pair of these, http://www.youtube.com/watch?v=VL03qingR5w"
          ]

          match /insult (\S+)/

          def execute(m,nick)
            if m.channel
              if m.channel.has_user?(nick))
                if nick == m.user.nick
                  m.reply("don't be so hard on yourself")
                else
                  m.reply("#{nick}, #{INSULTS[rand(INSULTS.length)]}")
                end
              else
                m.reply("there is no #{nick} here")
              end
            end
          end

        end
      end
    end
  end
end
