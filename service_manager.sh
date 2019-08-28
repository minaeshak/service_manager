#!/bin/bash
echo "##################### Service Manager ####################"
PS3="Please enter your choice:"
select opt in "List all running services" "List all failed services" "Configure service" "Quit"

do
        #PS3="Please enter your choice:"
        case $opt in
                "List all running services")
                        x=$(systemctl list-units --type service | grep running | wc -l)
                        echo "---------- Running Services -------------"
                        echo "No. of running services = " $x
                        systemctl list-units --type service | grep running
        ;;
                "List all failed services")
                        x=$(systemctl list-units --type service | grep failed | wc -l)
                        echo "---------- Failed Services -------------"
                        echo "No. of running services = " $x
                        systemctl list-units --type service | grep failed

        ;;
                "Configure service")
                        echo -n "Enter service name: "
                        read name
                        PS3="Please Enter your action:"
                        select opt2 in "Show status" "Start Service" "Stop Service" "Restart Service" "Quit"

                        do

                                case $opt2 in
                                        "Show status")
                                                systemctl status $name
                                        ;;
                                        "Start Service")
                                                systemctl start $name
                                        ;;
                                        "Stop Service")
                                                systemctl stop $name
                                        ;;
                                        "Restart Service")
                                                systemctl restart $name
                                        ;;

                                        "Quit")
                                                break
                                        ;;
                                esac
                        done
                        PS3="Please enter your choice:"

        ;;
                "Quit")
                        exit
        ;;
        esac
done
