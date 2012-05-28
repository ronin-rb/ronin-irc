# Ronin IRC

* [Source](https://github.com/ronin-ruby/ronin-ui-irc)
* [Issues](https://github.com/ronin-ruby/ronin-ui-irc/issues)
* [Documentation](http://rubydoc.info/gems/ronin-ui-irc/frames)
* [Mailing List](http://groups.google.com/group/ronin-ruby)
* [irc.freenode.net #ronin](http://webchat.freenode.net/?channels=ronin&uio=Mj10cnVldd)

## Description

Ronin IRC is an IRC bot for Ronin.

## Features

## Synopsis

    $ ronin irc --host irc.freenode.net --port 7000 --ssl --channels \#OpSketchy

## Plugins

## formatting

Formatting commands:

* `![b64|base64] [encode|decode] STRING` - Base64 encodes/decodes a String.
* `!md5 STRING` - Calculates the MD5 checksum of the String.
* `![sha1|sha128] STRING` - Calculates the SHA128 checksum of the String.
* `![sha2|sha256] STRING` - Calculates the SHA256 checksum of the String.
* `!sha512 STRING` - Calculates the SHA512 checksum of the String.

### network

Networking commands:

* `![dns|dns_lookup] HOST` - Resolves the hostname.
* `![dns_all|dns_lookup_all] HOST` - Resolves all addresses of the hostname.
* `![dns_reverse|dns_reverse_lookup] IP` - Reverse-looks up the hostname for
  the IP address.
* `![dns_reverse_all|dns_reverse_lookup_all] IP` - Reverse-looks up every
  hostname for the IP address.

### misc

Miscellaneous commands:

* `!insult NICK` - Insults a user in the channel.
* `!time [TIMEZONE]` - Displays the current time, in the optional timezone.

### opsec

Operational Security commands:

* `!lockdown [on|off]` - Locks down the channel.
* `!burn` - Kick/Bans everyone from the channel.

## Requirements

* [cinch](https://github.com/cinchrb/cinch#readme) ~> 1.1
* [cinch-commands](https://github.com/postmodern/cinch-commands#readme) ~> 0.1
* [ronin-support](https://github.com/ronin-ruby/ronin-support#readme) ~> 0.4
* [ronin](https://github.com/ronin-ruby/ronin#readme) ~> 1.4

## Install

    $ gem install ronin-irc

## License

Copyright (c) 2012 Hal Brodigan (postmodern.mod3 at gmail.com)

This file is part of Ronin IRC.

Ronin Ui Irc is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Ronin Ui Irc is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Ronin Ui Irc.  If not, see <http://www.gnu.org/licenses/>.
