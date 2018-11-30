_ansible()
{
    docker run --rm -it -w /app -v $(PWD):/app ansible:latest $1 ${@:2}
}

ansible()
{
    _ansible ansible ${@:2}
}

ansible-playbook()
{
    _ansible ansible-playbook ${@:2}
}

ansible-vault()
{
    _ansible ansible-vault ${@:2}
}
