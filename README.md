docker-ctl
----------

Like Docker, but have a terrible memory, or a little bit lazy? Then you may need **docker-ctl**

To see all commands just run docker-ctl with no arguments:

    # docker-ctl
    Available commands:
      cleanup
      help
      remove-all
      remove-all-images
      remove-stopped
      show-ports
      show-running
      show-stopped
      stop-running

To see more details use the help option:

    # docker-ctl help

    cleanup
      Removes stopped containers and dangling images

    help <command> <showsource>
      Shows help information for a command

    remove-all
      Removes all containers

    remove-all-images
      Removes all images

    remove-stopped
      Removes all stopped containers

    show-ports
      Show port mappings for running containers

    show-running
      Shows all running containers

    show-stopped
      Shows all stopped containers

    stop-running
      Stops all running containers

To see full help details for a command use **docker-ctl help [command]** e.g.:

    # docker-ctl help remove-all
    remove-all
      Removes all containers

    cmd-remove-all ()
    {
        declare desc="Removes all containers";
        local containers=$(docker ps -a -q);
        for container in ${containers[@]};
        do
            local state=$(docker inspect --format "{{.State.Running}}" $container);
            echo "Removing container: $container";
            if [[ "$state" == "true" ]]; then
                stop-container $container;
            fi;
            remove-container $container;
        done
    }

## Install

    $ sudo curl https://raw.githubusercontent.com/z0mbix/docker-ctl/master/docker-ctl -o /usr/local/bin/docker-ctl && sudo chmod 755 /usr/local/bin/docker-ctl
