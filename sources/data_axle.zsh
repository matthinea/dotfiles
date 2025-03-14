alias elastic='cd ~/dotfiles && docker compose up -d && cd -'
alias peter='axl'

export CHEF_USER=matth

alias starrocksprod='kubectl -n starrocks-namespace exec -it starrocks-cluster-fe-0 -- \
  mysql -P 9030 -h 127.0.0.1 -D data_axle_star_rocks_production -u root --prompt="StarRocks [PROD] > "'

