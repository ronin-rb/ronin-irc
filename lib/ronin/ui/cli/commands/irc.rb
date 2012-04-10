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

require 'ronin/ui/irc/bot'
require 'ronin/ui/cli/command'

module Ronin
  module UI
    module CLI
      module Commands
        #
        # Starts the Ronin IRC bot
        # 
        # ## Usage
        #
        #     ronin irc [options]
        #
        # ## Options
        #
        #    -v, --[no-]verbose               Enable verbose output.
        #    -q, --[no-]quiet                 Disable verbose output.
        #        --[no-]silent                Silence all output.
        #        --[no-]color                 Enables color output.
        #    -H, --host [HOST]                Host to connect to.
        #    -p, --port [NUM]                 Port to connect to.
        #    -P, --password [PASSWORD]        Server password.
        #    -S, --[no-]ssl                   Specifies whether to use SSL.
        #    -u, --user [USER]                Username to login with.
        #                                     Default: "ronin"
        #    -n, --nick [NICK]                Nickname to login with.
        #                                     Default: "ronin-bot"
        #    -c, --channels [CHANNELS [...]]  Channel(s) to join.
        #
        class Irc < Command

          summary 'Starts the Ronin IRC bot'

          option :host, :type        => String,
                        :flag        => '-H',
                        :description => 'Host to connect to'

          option :port, :type        => Integer,
                        :flag        => '-p',
                        :description => 'Port to connect to'

          option :password, :type        => String,
                            :flag        => '-P',
                            :description => 'Server password'

          option :ssl, :type        => true,
                       :flag        => '-S',
                       :description => 'Specifies whether to use SSL'

          option :user, :type        => String,
                        :flag        => '-u',
                        :default     => UI::IRC::Bot::DEFAULT_USER,
                        :description => 'Username to login with'

          option :nick, :type        => String,
                        :flag        => '-n',
                        :default     => UI::IRC::Bot::DEFAULT_NICK,
                        :description => 'Nickname to login with'

          option :channels, :type        => Set[String],
                            :flag        => '-c',
                            :description => 'Channel(s) to join'

          option :invites, :type        => Set[String],
                           :flag        => '-i',
                           :description => 'Users to invite to the channel(s)'

          option :plugins, :type        => Set[String],
                           :description => 'Plugin groups to enable'

          def execute
            unless host?
              print_error "Must specify the --host option"
              exit -1
            end

            bot = UI::IRC::Bot.new(
              :host     => @host,
              :port     => @port,
              :password => @password,
              :ssl      => @ssl,
              :user     => @user,
              :nick     => @nick,
              :channels => @channels,
              :invites  => @invites,
              :plugins  => @plugins
            )

            bot.start
          end

        end
      end
    end
  end
end
