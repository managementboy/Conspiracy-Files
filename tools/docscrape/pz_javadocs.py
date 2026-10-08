"""Crawl the official Project Zomboid Javadocs into Markdown for graphify.
Run: ~/.venvs/scrapling/bin/python tools/docscrape/pz_javadocs.py
Resumable (crawldir); polite (robots obeyed, delay between requests)."""
from scrapling.spiders import CrawlRule, LinkExtractor
from scrapling.spiders.templates import SiteToMarkdownSpider


class PZJavadocs(SiteToMarkdownSpider):
    name = "pz_javadocs"
    start_urls = ["https://projectzomboid.com/modding/"]
    allowed_domains = ["projectzomboid.com"]
    output_dir = "docs/reference/pz-modding/javadocs"
    concurrent_requests = 4
    download_delay = 0.5
    robots_txt_obey = True

    def rules(self):
        return [CrawlRule(LinkExtractor(
            allow=r"projectzomboid\.com/modding/.*\.html",
            deny=r"index-files|search\.html|help-doc|deprecated-list|allclasses|constant-values|serialized-form|#"))]


if __name__ == "__main__":
    r = PZJavadocs(crawldir="/tmp/pz_javadocs_crawl").start()
    print("pages:", len(r.items))
