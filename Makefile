.PHONY: init

init:
	docker run -it --rm -v $(shell pwd):/src -v ~/.ssh:/root/.ssh -w /src --env-file $(shell pwd)/.env hashicorp/terraform:1.2.4 init

.PHONY: validate

validate:
	docker run -it --rm -v $(shell pwd):/src -v ~/.ssh:/root/.ssh -w /src  --env-file $(shell pwd)/.env hashicorp/terraform:1.2.4 validate

.PHONY: plan

plan:
	docker run -it --rm -v $(shell pwd):/src -v ~/.ssh:/root/.ssh -w /src  --env-file $(shell pwd)/.env hashicorp/terraform:1.2.4 plan

.PHONY: apply

apply:
	docker run -it --rm -v $(shell pwd):/src -v ~/.ssh:/root/.ssh -w /src  --env-file $(shell pwd)/.env hashicorp/terraform:1.2.4 apply

.PHONY: destroy

destroy:
	docker run -it --rm -v $(shell pwd):/src -v ~/.ssh:/root/.ssh -w /src  --env-file $(shell pwd)/.env hashicorp/terraform:1.2.4 destroy

.PHONY: cli

cli:
	docker run -it --rm -v $(shell pwd):/src -v ~/.ssh:/root/.ssh -w /src  --env-file $(shell pwd)/.env --entrypoint /bin/sh hashicorp/terraform:1.2.4