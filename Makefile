OUTPUT_DIR=output
MD_FILES=$(wildcard *.md)
HTML_FILES=$(MD_FILES:%.md=$(OUTPUT_DIR)/%.html)

.PHONY: all clean

all: $(OUTPUT_DIR) $(HTML_FILES)

$(OUTPUT_DIR):
	mkdir -p $@

$(OUTPUT_DIR)/%.html: %.md
	@echo "$< => $@"
	@markdown $< | python -c 'import re, sys; content = sys.stdin.read(); sys.stdout.write(open("template.html").read().format(title=re.search(r"<h1>(?P<title>.*)</h1>", content).group("title"), content=content))' >$@

clean:
	rm -rf $(OUTPUT_DIR)
