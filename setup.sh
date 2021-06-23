

# create operator: operator1
nsc add operator operator1
nsc edit operator --service-url nats://nats:4222

# # list created keys
# nsc list keys
# # view details
# nsc describe operator
# nsc describe account
# nsc describe user


# setup a system account 
# https://docs.nats.io/nats-server/configuration/sys_accounts/sys_accounts
# add SYS account for a system user
nsc add account -n SYS
nsc add user -a SYS -n system_user

# subscibe to all subjects
# nats sub --creds /nsc/nkeys/creds/operator1/SYS/system_user.creds --server nats://nats:4222  ">" &

# create account: users
nsc add account users
# set account defaults
# maximum concurrent connections
nsc edit account -n users --conns 25

# add user: user1
nsc add user -a users user1
## user permissions
# set permission for user account
# allowed types of connection
nsc edit user -a users -n user1 --conn-type WEBSOCKET,MQTT,STANDARD
# TODO allowed sub patterns
nsc edit user -a users -n user1 --allow-sub "user.user1.>"


# sync keys to the account server
# nsc push --all --account-jwt-server-url http://nas:9090/jwt/v1
