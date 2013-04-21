S3_BUCKET = tsmall-blog
S3_PATH = s3://$(S3_BUCKET)
SITE_DIR = _site
HAKYLL = ./site

preview:
	$(HAKYLL) preview

upload: build
	s3cmd put --acl-public --no-encrypt --recursive $(SITE_DIR)/ $(S3_PATH)

build: $(SITE_DIR)
	$(HAKYLL) build
