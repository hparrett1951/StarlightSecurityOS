# Simple helpers
.PHONY: iso clean

iso:
	lb clean
	bash auto/config
	lb build

clean:
	lb clean
