# Makefile for nexus-gitops deployment chart
.PHONY: generate-values test clean

# Generate values.yaml from deployment directory
generate-values:
	@echo "Generating values.yaml from deployment directory..."
	@cd charts/deployment && ./generate-values.sh
	@echo "✅ Values generated successfully!"

# Test the Helm chart
test:
	@echo "Testing Helm chart..."
	@cd charts/deployment && helm template .
	@echo "✅ Helm chart test completed!"

# Clean generated files
clean:
	@echo "Cleaning generated files..."
	@rm -f charts/deployment/values.yaml
	@echo "✅ Cleanup completed!"

# Default target
all: generate-values test
