PORT ?= 8000
OMP ?= omp
OMP_PROFILE ?= corvinus-training
OMP_PROVIDER ?= openrouter

.PHONY: slides omp-login omp

slides:
	@echo "Slides: http://localhost:$(PORT)/index.html"
	python3 -m http.server $(PORT)

omp-login:
	$(OMP) --profile $(OMP_PROFILE) login $(OMP_PROVIDER)

omp:
	@cd demo && if [ -n "$$TRAINING_OPENROUTER_API_KEY" ]; then \
		OPENROUTER_API_KEY="$$TRAINING_OPENROUTER_API_KEY" $(OMP) --profile $(OMP_PROFILE) --provider $(OMP_PROVIDER) --config ../omp-training.yml --no-skills --no-extensions --no-rules; \
	else \
		env -u OPENROUTER_API_KEY $(OMP) --profile $(OMP_PROFILE) --provider $(OMP_PROVIDER) --config ../omp-training.yml --no-skills --no-extensions --no-rules; \
	fi
