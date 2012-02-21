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

require 'ronin/ui/irc/plugins'
require 'ronin/ui/output'

require 'cinch'
require 'set'

module Ronin
  module UI
    module IRC
      #
      # A [Cinch](https://github.com/cinchrb/cinch#readme) IRC Bot for Ronin.
      #
      class Bot < Cinch::Bot

        # Default user-name to use
        DEFAULT_USER = 'ronin'

        # Default nick-name to use
        DEFAULT_NICK = 'ronin-bot'

        # Real name to use
        DEFAULT_REAL_NAME = 'Ronin Bot'

        #
        # Creates a new Ronin IRC Bot instance.
        #
        # @param [Hash] options
        #   Options for the IRC bot.
        #
        # @option options [String] :host
        #   The server to connect to.
        #
        # @option options [Integer] :port
        #   The port to connect to.
        #
        # @option options [String] :password
        #   The server password.
        #
        # @option options [Hash, Boolean] :ssl
        #   Specifies whether to use SSL.
        #
        # @option options [String] :user (DEFAULT_USER)
        #   The username to login with.
        #
        # @option options [String] :nick (DEFAULT_NICK)
        #   The nickname to login with.
        #
        # @option options [String] :real_name (DEFAULT_REAL_NAME)
        #   The real-name to use.
        #
        # @option options [Array<String>] :channels
        #   The channel(s) to join.
        #
        # @option options [Array<String>] :invites
        #   Users to be invited to the channels.
        #
        def initialize(options={})
          super()

          configure do |c|
            c.server     = options[:host]
            c.port       = options[:port]
            c.password   = options[:password]
            c.ssl.use    = !options[:ssl].nil?
            c.user       = options.fetch(:user,DEFAULT_USER)
            c.nick       = options.fetch(:nick,DEFAULT_NICK)
            c.realname   = options.fetch(:real_name,DEFAULT_REAL_NAME)
            c.channels   = Set[*options[:channels]]
            c.invites    = Set[*options[:invites]]
            c.verbose    = UI::Output.verbose?

            c.plugins.plugins = Plugins.constants.map do |name|
              Plugins.const_get(name)
            end
          end

          # when the bot joins the target channel, invite the users
          on :join do |m|
            if m.user.nick == bot.nick
              if bot.config.channels.include?(m.channel.name)
                bot.config.invites.each do |nick|
                  m.channel.invite(nick)
                end
              end
            end
          end
        end

      end
    end
  end
end
