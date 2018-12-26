PLAYBOOK_ARGS?="--diff"

install:
	@sh ./scripts/init.sh

install-galaxy:
	ansible-galaxy install -r requirements.yml

provision: install-galaxy
	ansible-playbook mac.yml $(PLAYBOOK_ARGS)

lint:
	ansible-lint mac.yml

syntax:
	ansible-playbook mac.yml --syntax-check

.PHONY: all install provision lint syntax