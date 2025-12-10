-include .env

.PHONY: deploy_lisk_sepolia deploy_lisk_mainnet \
        deploy_manta_sepolia deploy_manta_caldera deploy_manta_mainnet \
        deploy_base_sepolia deploy_base_mainnet

# ==============================
# LISK DEPLOYMENTS
# ==============================

deploy_lisk_sepolia:
	@if [ -z "$(SCRIPT)" ]; then \
		echo "Error: SCRIPT is not set. Usage: make deploy SCRIPT=path/to/file.s.sol:ContractName"; \
		exit 1; \
	fi
	@forge script $(SCRIPT) \
		--rpc-url $(LISK_SEPOLIA_RPC) \
		--private-key $(PRIVATE_KEY) \
		--broadcast \
		--verify \
		--verifier $(LISK_VERIFIER) \
		--verifier-url $(LISK_VERIFIER_SEPOLIA_URL)

deploy_lisk_mainnet:
	@if [ -z "$(SCRIPT)" ]; then \
		echo "Error: SCRIPT is not set. Usage: make deploy SCRIPT=path/to/file.s.sol:ContractName"; \
		exit 1; \
	fi
	@forge script $(SCRIPT) \
		--rpc-url $(LISK_MAINNET_RPC) \
		--private-key $(PRIVATE_KEY) \
		--broadcast \
		--verify \
		--verifier $(LISK_VERIFIER) \
		--verifier-url $(LISK_VERIFIER_MAINNET_URL)


# ==============================
# MANTA DEPLOYMENTS
# ==============================

deploy_manta_sepolia:
	@if [ -z "$(SCRIPT)" ]; then \
		echo "Error: SCRIPT is not set. Usage: make deploy SCRIPT=path/to/file.s.sol:ContractName"; \
		exit 1; \
	fi
	@forge script $(SCRIPT) \
		--rpc-url $(MANTA_SEPOLIA_RPC) \
		--private-key $(PRIVATE_KEY) \
		--broadcast \
		--verify \
		--verifier $(MANTA_VERIFIER) \
		--verifier-url $(MANTA_VERIFIER_SEPOLIA_URL)

deploy_manta_caldera:
	@if [ -z "$(SCRIPT)" ]; then \
		echo "Error: SCRIPT is not set. Usage: make deploy SCRIPT=path/to/file.s.sol:ContractName"; \
		exit 1; \
	fi
	@forge script $(SCRIPT) \
		--rpc-url $(MANTA_CALDERA_RPC) \
		--private-key $(PRIVATE_KEY) \
		--broadcast \
		--verify \
		--verifier $(MANTA_VERIFIER) \
		--verifier-url $(MANTA_VERIFIER_CALDERA_URL)

deploy_manta_mainnet:
	@if [ -z "$(SCRIPT)" ]; then \
		echo "Error: SCRIPT is not set. Usage: make deploy SCRIPT=path/to/file.s.sol:ContractName"; \
		exit 1; \
	fi
	@forge script $(SCRIPT) \
		--rpc-url $(MANTA_MAINNET_RPC) \
		--private-key $(PRIVATE_KEY) \
		--broadcast \
		--verify \
		--verifier $(MANTA_VERIFIER) \
		--verifier-url $(MANTA_VERIFIER_MAINNET_URL)


# ==============================
# BASE DEPLOYMENTS
# ==============================

deploy_base_sepolia:
	@if [ -z "$(SCRIPT)" ]; then \
		echo "Error: SCRIPT is not set. Usage: make deploy SCRIPT=path/to/file.s.sol:ContractName"; \
		exit 1; \
	fi
	@forge script $(SCRIPT) \
		--rpc-url $(BASE_SEPOLIA_RPC) \
		--private-key $(PRIVATE_KEY) \
		--broadcast \
		--verify \
		--verifier $(BASE_VERIFIER) \
		--verifier-url $(BASE_VERIFIER_SEPOLIA_URL) \
		--etherscan-api-key $(BASE_ETHERSCAN_API_KEY)

deploy_base_mainnet:
	@if [ -z "$(SCRIPT)" ]; then \
		echo "Error: SCRIPT is not set. Usage: make deploy SCRIPT=path/to/file.s.sol:ContractName"; \
		exit 1; \
	fi
	@forge script $(SCRIPT) \
		--rpc-url $(BASE_MAINNET_RPC) \
		--private-key $(PRIVATE_KEY) \
		--broadcast \
		--verify \
		--verifier $(BASE_VERIFIER) \
		--verifier-url $(BASE_VERIFIER_MAINNET_URL)
