PLAYBOOK_ARGS?="--diff"

install:
	@sh ./scripts/init.sh

install-galaxy:
	ansible-galaxy install -r requirements.yml

provision: install-galaxy
	ansible-playbook mac.yml $(PLAYBOOK_ARGS)

.PHONY: all install provision