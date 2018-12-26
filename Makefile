PLAYBOOK_ARGS?="--diff"
PLAYBOOKDIR="ansible"

install:
	@sh ./scripts/init.sh

provision:
	cd $(PLAYBOOKDIR) && ansible-playbook mac.yml $(PLAYBOOK_ARGS)

.PHONY: all install provision