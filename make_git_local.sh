curl -X POST -v -u peterglen:kkk -H "Content-Type: application/json" \
   192.168.2.103/repositories/teamsinspace/new-repository4 \
   -d '{"scm": "git", "is_private": "true", "fork_policy": "no_public_forks" }'

