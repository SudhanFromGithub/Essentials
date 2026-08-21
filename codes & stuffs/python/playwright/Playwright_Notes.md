
## How to import playwright

	from playwright.sync_api import sync_playwright

## With sync_playwright imported how to use it in code

	with sync_playwright() as p:
			browser = p.chromium.launch(headless=True/False)
			# Headless = True to open chromium invisiblely
			# Headless = False to open chromium visiblely
			page = browser.new_page()

## Page.goto()

	page.goto("# Url of the website)


Tags : [[playwright]], [[python]] 