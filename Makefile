ALL_VFILES := $(shell find -L 'src' -name "*.v") $(shell find -L 'vendor' -name "*.v")
TEST_VFILES := $(shell find -L 'src' -name "*Tests.v")

VFILES := $(filter-out $(TEST_VFILES),$(ALL_VFILES))

COQ_ARGS := $(shell grep -E '(-R|-Q|-I)' '_CoqProject')

default: $(VFILES:.v=.vo)

test: $(TEST_VFILES:.v=.vo)

.coqdeps.d: $(ALL_VFILES) _CoqProject
	coqdep -f _CoqProject $(ALL_VFILES) > "$@"

-include .coqdeps.d

%.vo: %.v .coqdeps.d
	coqc $(COQ_ARGS) $< -o $@

clean:
	rm -f $(ALL_VFILES:.v=.vo) .coqdeps.d

debug:
	@echo "all vfiles" $(ALL_VFILES)
	@echo "vfiles" $(VFILES)
