OUTPUT_DIR=output
TEMPLATE=template.html
MD_FILES=$(wildcard *.md)
HTML_FILES=$(MD_FILES:%.md=$(OUTPUT_DIR)/%.html)

.PHONY: all clean

all: $(HTML_FILES)

$(HTML_FILES): $(TEMPLATE) | $(OUTPUT_DIR)

$(OUTPUT_DIR):
	mkdir -p $@

$(OUTPUT_DIR)/%.html: %.md
	@echo "$< => $@"
	@content="$$(markdown $<)"; title="$$(echo $$content | grep -Po '(?<=<h1>).*(?=</h1>)')"; eval "echo \"$$(cat template.html)\"" >$@

watch:
	@+while inotifywait -re modify --exclude '.*\.swp' .; do make; done

clean:
	rm -rf $(OUTPUT_DIR)
