LDFLAGS += $(shell pkg-config --libs glib-2.0) -pthread -lm -lunicorn

TESTS = test1

all: $(TESTS)

clean:
	rm -f $(TESTS)

%: %.c
	$(CC) $(CFLAGS) -g $^ $(LDFLAGS) -o $@

.PHONY: all clean
