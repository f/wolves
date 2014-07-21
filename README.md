![Wolves](./assets/images/logo-small.png)

IRC based online Wolves (a [Mafia][2] theme) game

![Progress](http://progressed.io/bar/10)

***
**THIS PROJECT IS UNDER HEAVY DEVELOPMENT**
***

## Installation

Simply install using NPM.

```bash
npm install -g wolves
```

### Ubuntu

```bash
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs
npm install -g wolves
```

### Mac OS X

```bash
brew install node
npm install -g wolves
```

### Windows

I really don't know.

## Configuration

You should create the IRC settings file at `config/irc.yml`

```yaml
channel: "#wolfgamechannel"
auth:
  username: yourusername
  password: password

connection:
  host: irc.freenode.net
  port: 6667

owners: [user1, user2]
admins: [user1, user2]
```

## Run

Then, you can connect to server and start the game:

```bash
wolves start
```

You can change connection file:

```bash
wolves start --config=config/another-config.yml
```

## The Game

Inspired from [lykoss/lykos][1], a Wolves party game based on IRC Protocol,

From Wikipedia:
> **Mafia** (Russian: Ма́фия, also known as **Wolves**) is a party game created
> in the USSR by Dimitry Davidoff in 1986,[3] modelling a conflict between
> an informed minority (the mafia) and an uninformed majority (the innocents).
> At the start of the game each player is secretly assigned a role affiliated
> with one of these teams. The game has two alternating phases: "night",
> during which the mafia may covertly "murder" an innocent, and "day", in
> which surviving players debate the identities of the mafiosi and vote to
> eliminate a suspect. Play continues until all of the mafia has been
> eliminated, or until the mafia outnumbers the innocents.

## License
MIT: [http://f.mit-license.org](http://f.mit-license.org)

<!--
![Wolves](./.assets/images/Wolves.jpg)
*Found this image from Google Search*
-->

[1]: http://github.com/lykoss/lykos
[2]: http://en.wikipedia.org/wiki/Mafia_(party_game)
