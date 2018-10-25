ALL_VFILES := $(shell find -L 'src' 'vendor' -name "*.v")
ALL_TEST_VFILES := $(shell find -L 'src' 'vendor' -name "*Tests.v")
TEST_VFILES := $(shell find -L 'src' -name "*Tests.v")
VFILES := $(filter-out $(ALL_TEST_VFILES),$(ALL_VFILES))

COQ_ARGS := $(shell cat '_CoqProject')

default: $(VFILES:.v=.vo)

test: $(TEST_VFILES:.v=.vo) $(VFILES:.v=vo)

.coqdeps.d: $(ALL_VFILES) _CoqProject
	coqdep -f _CoqProject $(ALL_VFILES) > "$@"

-include .coqdeps.d

%.vo: %.v .coqdeps.d
	coqc $(COQ_ARGS) $< -o $@

clean:
	rm -f $(ALL_VFILES:.v=.vo) $(ALL_VFILES:.v=.glob) .coqdeps.d
	find . -name ".*.aux" -exec rm {} \;

.PHONY: default test clean
