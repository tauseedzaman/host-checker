#! /bin/bash

# store the file path in file named variable
file=$1
if [ ! -f $file ]; then
    # file not found error with coloring
    echo -e "\e[1;31m[ERROR] file $file not found!\n"
    echo -e "\e[1;0m"
    exit
fi

# loop thro all ips
for ip in $(cat $file); do

    # send ICMP packet
    request=$(ping -c 1 $ip)

    # check the result
    if [[ $request =~ "packets transmitted" ]]; then
        echo -e "\e[1;35m $ip \e[1;39m is alive"
    else
        echo -e "\e[1;31m $ip is failed to respond"

    fi
done
echo -e "\e[1;0m"
