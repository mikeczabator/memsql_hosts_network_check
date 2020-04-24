# memsql_hosts_network_check
check latency and ping for the hosts in memsql-admin list-nodes

requires ping and traceroute!

```
[ec2-user@ip-172-31-4-157 ~]$ ./count_hops.sh 
ping found.
traceroute found.
172.31.4.157:
	 hops from this server to 172.31.4.157: 1
	 ping min: 0.009
	 ping avg: 0.016
	 ping max: 0.022
	ping mdev: 0.006
172.31.15.196:
	 hops from this server to 172.31.15.196: 1
	 ping min: 0.124
	 ping avg: 0.128
	 ping max: 0.137
	ping mdev: 0.013
172.31.15.243:
	 hops from this server to 172.31.15.243: 1
	 ping min: 0.128
	 ping avg: 0.139
	 ping max: 0.151
	ping mdev: 0.010
172.31.4.223:
	 hops from this server to 172.31.4.223: 1
	 ping min: 0.076
	 ping avg: 0.083
	 ping max: 0.091
	ping mdev: 0.012
  ```
