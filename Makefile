.PHONY: python go lint clean

PROTOS := $(shell find estats -name '*.proto')
OUT ?= gen
PYTHON ?= python3

# Python: `grpcio-tools` kerak.
#
# `sed`: protoc paket ichidagi importni MUTLAQ yozadi va u
# ishlamaydi — har generatsiyadan keyin nisbiyga aylantiriladi.
python:
	@mkdir -p $(OUT)
	$(PYTHON) -m grpc_tools.protoc -I. \
		--python_out=$(OUT) --grpc_python_out=$(OUT) --pyi_out=$(OUT) \
		$(PROTOS)
	@find $(OUT) -name '*_pb2_grpc.py' -exec \
		sed -i'' -e 's/^from estats/from ..estats/' {} \; 2>/dev/null || true
	@find $(OUT) -type d -exec touch {}/__init__.py \;

go:
	@mkdir -p $(OUT)
	protoc -I. --go_out=$(OUT) --go-grpc_out=$(OUT) $(PROTOS)

lint:
	@$(PYTHON) -m grpc_tools.protoc -I. -o /dev/null $(PROTOS) && echo "shartnomalar joyida"

clean:
	rm -rf gen
