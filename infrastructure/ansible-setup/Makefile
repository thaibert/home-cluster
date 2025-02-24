.PHONY: bootstrap-controlplane reset-nodes
bootstrap-controlplane:
	ansible-playbook bootstrap-cluster.playbook.yaml --inventory inventory.yaml --become-password-file=.password

destroy-cluster:
	ansible-playbook destroy-cluster.playbook.yaml --inventory inventory.yaml --become-pass-file=.password
