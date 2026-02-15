#!/bin/bash
# Find blogs that write about invoice tools for outreach

echo "=== Blogger Research for InvoiceZero Outreach ==="
echo ""

# Common blog patterns to search for
KEYWORDS=(
    "best free invoice generator"
    "invoice tools for freelancers"
    "free invoice software"
    "invoice generator review"
)

echo "Target keywords:"
for keyword in "${KEYWORDS[@]}"; do
    echo "  - $keyword"
done

echo ""
echo "Research strategy:"
echo "1. Use web_fetch to find blogs ranking for these terms"
echo "2. Extract contact emails from those blogs"
echo "3. Build outreach list in OUTREACH.md"
echo ""

# We'll manually populate this with real blog URLs
cat >> /root/.openclaw/workspace/invoicezero/OUTREACH.md << 'BLOGGERS'

## Blogger Targets (To Research)

### High-Priority Targets
- [ ] FreshBooks blog (contact via form)
- [ ] QuickBooks blog (contact via form)
- [ ] Entrepreneur.com (pitch via contact form)
- [ ] Forbes small business section
- [ ] Inc.com freelancing section
- [ ] The Freelancer's Union blog
- [ ] Hubspot blog
- [ ] Small Business Trends
- [ ] Business.com

### Medium-Priority (Smaller Blogs)
- Research via Google: "best invoice generator [current year]"
- Look for independent bloggers with contact emails
- Target blogs with 10k-100k monthly visitors

### Search Terms for Manual Research
1. "best free invoice generator 2026"
2. "invoice tools for freelancers review"
3. "free invoice software comparison"
4. "how to invoice clients"
5. "invoice generator no signup"

BLOGGERS

echo "✅ Updated OUTREACH.md with target list"
