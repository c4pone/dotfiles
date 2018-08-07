default: install-packages install-binaries set-shell link-config setup-languages 

install-packages:
	sh ./scripts/install-packages.sh
	sh ./scripts/install-snap-packages.sh

install-binaries:
	sh ./scripts/install-fzf.sh

setup-languages:
	sh ./scripts/setup-python.sh
	sh ./scripts/setup-java.sh

link-config:
	stow -d configs -t ~ -S `ls -d configs/* | xargs -n 1 basename`

unlink-config:
	stow -d configs -t ~ -D `ls -d configs/* | xargs -n 1 basename`

set-shell:
	chsh -s `which zsh`

set-dns:
	sudo cp resolver.conf /etc/resolverconf/resolv.conf.d/base
	sudo resolvconf -u
