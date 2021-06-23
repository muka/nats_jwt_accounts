# NATS.io JWT example

NATS.io example setup to use JWT and NAS for authentication/authorization

## Requirements

Tested on linux, ensure you have a recent version of 

- docker
- docker-compose
- make

## Setup

1. Run `make setup` to initialize the accounts, see `setup.sh` for details
2. Run `make box` and insert the command `nsc list accounts`. 
3. Copy the `Public key` for SYS account from the output to `config/nats-server.conf` in the `system_account` field.
4. Reload NATS to pickup the configuration `docker-compose restart nats`
5. Update the keys/JWT parameters with `make push`

## Testing

Using the `user1` credential, the client should connect and subscribe to `user.user1.>` but not others. Also support protocols such as websocket, nats, mqtt. The limit of concurrent connections is 25.

## References

- https://docs.nats.io/nats-server/configuration/sys_accounts/sys_accounts
- https://docs.nats.io/nats-tools/nas/notifications
- https://docs.nats.io/nats-tools/nsc
- https://docs.nats.io/nats-server/configuration/securing_nats/jwt/resolver
- 