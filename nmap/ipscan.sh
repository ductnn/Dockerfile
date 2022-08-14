#!/bin/bash
optstring=":hH:"
nmaphosts='192.168.30.0/24'

while getopts ${optstring} arg; do
    case ${arg} in
        :)                                    # If expected argument omitted:
            echo "Error: -${OPTARG} requires an argument"
            exit
            ;;
        H)
            nmaphosts="${OPTARG}"
            ;;
        h)
            echo 'NAME'
            echo '    ipscan'
            echo ''
            echo 'SYNOPSIS'
            echo '    ipscan [OPTION]'
            echo ''
            echo 'DESCRIPTION'
            echo '    Scan a network for IP addresses that have hostnames'
            echo '    -H (hosts) - The hosts to scan - Defaults to 192.168.1.0/24, which scans 192.168.1.0 to 192.168.1.255'
            echo '    -h - Print this help'
            exit
            ;;
    esac
done

# first do a normal scan (no port scan)
echo 'Running normal scan...'
results=$(nmap -sn "${nmaphosts}")

# then for any hidden devices, do it again a different way to find them
echo 'Running deeper scan...'
results+=$(nmap -sn -Pn "${nmaphosts}")

# sort and remove duplicate results, and remove ones that don't have a hostname
echo "$results" | sort -fu | grep --color=never -E '[^\n]+\([0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}\)$'
