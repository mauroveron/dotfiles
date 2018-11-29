npm()
{
    docker run --rm -it -w /app -v $(PWD):/app node:latest npm $@
}

yarn()
{
    docker run --rm -it -w /app -v $(PWD):/app node:latest yarn $@
}

node()
{
    docker run --rm -it -w /app -v $(PWD):/app node:latest node $@
}

npx()
{
    docker run --rm -it -w /app -v $(PWD):/app node:latest npx $@
}

create-react-app()
{
    docker run --rm -it -w /app -v $(PWD):/app node:latest create-react-app $@
}

webpack()
{
    docker run --rm -it -w /app -v $(PWD):/app node:latest webpack $@
}