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
require 'time'

module Ronin
  module UI
    module IRC
      module Plugins
        class Time

          include Cinch::Plugin

          match 'time'
          match /time ([A-Z]+(?:-\d{1,2})?)/

          def execute(m,timezone=nil)
            time = ::Time.now

            if (timezone && (offset = ::Time.zone_offset(timezone)))
              time = time.utc + offset
            end

            m.reply("Time: #{time}")
          end

        end
      end
    end
  end
end
