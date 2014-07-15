![Ayazağa](./.assets/images/logo-small.png)

**THIS PROJECT IS UNDER HARDLY DEVELOPMENT**
***

Inspired from [lykoss/lykos][1], a Werewolf party game based on IRC Protocol

[1]: http://github.com/lykoss/lykos

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
grunt start
```

You can change connection file:

```bash
grunt start --config=config/another-config.yml
```

## Name

[Ayazağa][1] is a village in Istanbul, Turkey which is famous for wolves and
killer software projects.

## License
MIT

[1]: http://tr.wikipedia.org/wiki/Ayaza%C4%9Fa,_Sar%C4%B1yer
