#!/bin/bash

function check_for_traceroute()
{
        if ! type traceroute &> /dev/null; then
                echo traceroute is not found.  please make sure it is installed and in the system path.
                echo on redhat, run 'sudo yum install traceroute -y'
                exit
        else
                printf "traceroute found.\n"
        fi
}

function check_for_ping()
{
        if ! type ping &> /dev/null; then
                echo ping is not found.  please make sure it is installed and in the system path.
                # echo on redhat, run 'sudo yum install traceroute -y'
                exit
        else
                printf "ping found.\n"
        fi
}

function check_hops()
{
        IP=$1
        for HOP_COUNT in $(traceroute $IP | head -n +1 | wc -l)
        do
                printf "\t hops from this server ($HOSTNAME) to $IP: $HOP_COUNT\n"
        done

}

function check_ping()
{
        IP=$1
        read ping_min ping_avg ping_max ping_mdev<<<$(ping -c 5 $IP 2>&1 | awk -F'[ /]' 'END{print $7,$8,$9,$10}')
        printf "\t ping min: $ping_min\n\t ping avg: $ping_avg\n\t ping max: $ping_max\n\tping mdev: $ping_mdev\n"
}

function get_local_hostname()
{
        echo `hostname`
}


HOSTNAME=$(get_local_hostname)
check_for_ping
check_for_traceroute


for IP in $(memsql-admin list-nodes | tail -n +5 | head -n -1 | awk -F "|" '{print $4}' | uniq)
do
        echo $IP:
        check_hops $IP
        check_ping $IP
done
