OUTPUT_DIR=output
MD_FILES=$(wildcard *.md)
HTML_FILES=$(MD_FILES:%.md=$(OUTPUT_DIR)/%.html)

.PHONY: all clean

all: $(OUTPUT_DIR) $(HTML_FILES)

$(OUTPUT_DIR):
	mkdir -p $@

$(OUTPUT_DIR)/%.html: %.md
	@echo "$< => $@"
	@content="$$(markdown $<)"; title="$$(echo $$content | grep -Po '(?<=<h1>).*(?=</h1>)')"; eval "echo \"$$(cat template.html)\"" >$@

clean:
	rm -rf $(OUTPUT_DIR)
