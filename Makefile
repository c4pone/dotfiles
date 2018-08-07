default: add-repositories install-packages install-binaries set-shell link-config setup-python 

install-packages:
	sh ./scripts/install-packages.sh

install-binaries:
	sh ./scripts/install-fzf.sh
	sh ./scripts/install-docker.sh

setup-python:
	sh ./scripts/install-python.sh

add-repositories:
	sh ./scripts/add-repositories.sh

link-config:
	stow -d configs -t ~ -S `ls -d configs/* | xargs -n 1 basename`

unlink-config:
	stow -d configs -t ~ -D `ls -d configs/* | xargs -n 1 basename`

set-shell:
	chsh -s `which zsh`

set-dns:
	sudo cp resolver.conf /etc/resolverconf/resolv.conf.d/base
	sudo resolvconf -u
