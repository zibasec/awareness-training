
# all non full.adoc files in modules
ADOC_FILES = $(shell find content/modules -type f -iname '*.adoc' ! -iname 'full.adoc')

# all the target names for per-page files in modules
PAGE_FILES = $(patsubst content/%.adoc, output/%.html, $(ADOC_FILES))

# all folders in content/modules (aka all module top-level dirs)
MODULE_DIRS = $(shell find content/modules -mindepth 1 -maxdepth 1 -type d)

# all image folders in content/modules
IMAGE_DIRS = $(shell find content/modules/*/ -mindepth 1 -maxdepth 1 -type d -name images)

##############
# output files
##############
# output folder manifest file
MANIFEST_FILES = $(patsubst content/%, output/%/imsmanifest.xml, $(MODULE_DIRS))

# output folder staticfiles
STATIC_FILES = $(patsubst content/%, output/%/.staticfiles, $(MODULE_DIRS))

# output folder questions file (javascript format)
QUESTION_FILES = $(patsubst content/%, output/%/questions.js, $(MODULE_DIRS))

# output folder questions file (html format)
QUESTIONHTML_FILES = $(patsubst content/%, output/%/questions.html, $(MODULE_DIRS))

# output folder index.html file (for offline viewing)
INDEX_FILES = $(patsubst content/%, output/%/index.html, $(MODULE_DIRS))

# output folder slides.html file (for offline viewing)
SLIDES_FILES = $(patsubst content/%, output/%/slides.html, $(MODULE_DIRS))

# output folder launchpage.html (for SCORM viewing)
LAUNCH_FILES = $(patsubst content/%, output/%/launchpage.html, $(MODULE_DIRS))

# output folder full.html file (for offline viewing)
FULL_FILES = $(patsubst content/%, output/%/full.html, $(MODULE_DIRS))

# output folder zip file (SCORM content package)
ZIP_FILES = $(patsubst content/%, output/%.zip, $(MODULE_DIRS))

# output folder image files (SCORM content package)
IMAGE_DEST = $(patsubst content/%/images, output/%/images, $(IMAGE_DIRS))

#########################
# asciidoctor common args
#########################
ASCIIDOC_COMMON_ARGS=-a skip-front-matter -a nofooter -a docinfo=shared -a docinfodir=templates/docinfo

#########################
# setup top-level targets
#########################
.PHONY: all clean server nuke output/shared content/index.adoc debug
.SECONDARY:

###
# Default target is to build all zipfiles which needs all the other file types built
all: $(MANIFEST_FILES) $(STATIC_FILES) $(QUESTION_FILES) $(QUESTIONHTML_FILES) $(INDEX_FILES) $(SLIDES_FILES) $(LAUNCH_FILES) $(FULL_FILES) $(ZIP_FILES) $(PAGE_FILES) $(IMAGE_DEST) output/shared output/index.html output/full.html output/full.pdf

debug:
	@/usr/bin/echo -e "ADOC:\n\t$(ADOC_FILES)\n\n"
	@/usr/bin/echo -e "PAGE:\n\t$(PAGE_FILES)\n\n"
	@/usr/bin/echo -e "manifest:\n\t$(MANIFEST_FILES)\n\n"
	@/usr/bin/echo -e "STATIC:\n\t$(STATIC_FILES)\n\n"
	@/usr/bin/echo -e "QUESTION:\n\t$(QUESTION_FILES)\n\n"
	@/usr/bin/echo -e "QUESTIONHTML:\n\t$(QUESTIONHTML_FILES)\n\n"
	@/usr/bin/echo -e "INDEX:\n\t$(INDEX_FILES)\n\n"
	@/usr/bin/echo -e "SLIDES:\n\t$(SLIDES_FILES)\n\n"
	@/usr/bin/echo -e "LAUNCH:\n\t$(LAUNCH_FILES)\n\n"
	@/usr/bin/echo -e "FULL:\n\t$(FULL_FILES)\n\n"
	@/usr/bin/echo -e "ZIP:\n\t$(ZIP_FILES)\n\n"
	@/usr/bin/echo -e "IMAGE:\n\t$(IMAGE_DIRS)\n\n"
	@/usr/bin/echo -e "IMAGE_DEST:\n\t$(IMAGE_DEST)\n\n"

# target for reveal-js style slides.html
output/%/slides.html: content/%/*.adoc Makefile output/node_modules templates/full.adoc.j2
	bin/makeslides $@

# target for full content (for offline viewing)
output/%/full.html: content/%/*.adoc Makefile templates/full.adoc.j2 bin/makefull bin/makelib.sh templates/docinfo/*
	bin/makefull $@

output/index.html: Makefile content/modules/*/*.adoc
	( /usr/bin/echo -e "== List of all modules\n\n"; for myindex in $$(find output/modules/*/ -mindepth 1 -maxdepth 1 -iname 'index.html'); do   echo ". link:$${myindex#*output/}[$$(echo $${myindex#*output/} | cut -d '/' -f 2)]"; done ) | asciidoctor $(ASCIIDOC_COMMON_ARGS) -b html5 -d article -o $@ -

output/full.html: Makefile content/modules/*/*.adoc
	( /usr/bin/echo -e "= Open Awareness Training\n\n:leveloffset: +1\n\n"; for myadoc in $$(find content/modules/*/ -mindepth 1 -maxdepth 1 -iname '*.adoc'); do   echo -e "include::$${myadoc}[]\n\n"; done ) | asciidoctor $(ASCIIDOC_COMMON_ARGS) -b html5 -d article -o $@ -

output/full.pdf: Makefile content/modules/*/*.adoc
	( /usr/bin/echo -e "= Open Awareness Training\n\n:leveloffset: +1\n\n"; for myadoc in $$(find content/modules/*/ -mindepth 1 -maxdepth 1 -iname '*.adoc'); do   echo -e ":imagesdir: $${myadoc%/*}\ninclude::$${myadoc}[]\n\n"; done ) | asciidoctor-pdf $(ASCIIDOC_COMMON_ARGS) -b pdf -d book -o $@ -

output/%.html: content/%.adoc Makefile
	@echo ======= per-page ========
	bin/makefull $@

output/style_guide.html: docs/style_guide.adoc
	asciidoctor $(ASCIIDOC_COMMON_ARGS) -b html5 -d article -o $@ -v $<

# target for javascript format of questions (for inclusion in SCORM content)
output/%/questions.js: content/%/*.adoc Makefile templates/questions.js.j2 static/shared/assessmenttemplate.html
	bin/makequestionsjs $@

# target for html format of questions (for offline viewing)
output/%/questions.html: content/%/*.adoc Makefile templates/questions.html.j2
	bin/makequestionshtml $@

# Part of the SCORM dynamic content
output/%/imsmanifest.xml: content/%/*.adoc
	bin/makemanifest $@

# an offline index file for each module
output/%/index.html: content/%/*.adoc templates/module-index.adoc.j2 Makefile bin/makeindex | output/%/full.html output/%/slides.html
	bin/makeindex $@

# launchpage is for SCORM playback
output/%/launchpage.html: content/%/*.adoc Makefile templates/launchpage.html.j2 | output/%/full.html output/%/slides.html static/shared/assessmenttemplate.html
	bin/makelaunchpage $@

# each module needs its images folder copied
output/%/images: content/%/images/*
	mkdir -p $@
	rsync -rav $(<D)/. $@/.

# each module needs copies of the static files
output/%/.staticfiles: content/%/*.adoc static/*
	mkdir -p $(@D)
	rsync -ra static/. $(@D)

# Make the SCORM zip file
output/modules/%.zip: output/modules/%/.staticfiles output/modules/%/imsmanifest.xml output/modules/%/questions.js  output/modules/%/index.html output/modules/%/full.html $(PAGE_FILES)
	@echo myzip is $@ $*
	cd output/modules/$* && zip -r ../$* *

# reveal.js needs the node_modules
output/node_modules:
	cd output && npm i

# shared content synced
output/shared:
	mkdir -p output/shared; rsync -qra --delete-after content/shared/. output/shared/.

# run this to have a local web server running at http://localhost:8000
server:
	@echo reach your site here: http://localhost:8000
	cd output/ && python3 -m http.server 8000

clean:
	rm -rf output/modules/* content/index.adoc output/index.html output/index-full.html output/node_modules output/full.pdf

nuke: clean
	rm -rf output/shared
