_docker_ctl()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(docker-ctl | grep -v '^Available')

    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
}
complete -F _docker_ctl docker-ctl


