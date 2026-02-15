#!/bin/bash
# Add Schema.org structured data for better SEO

SCHEMA='<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "WebApplication",
  "name": "InvoiceZero",
  "url": "https://vincekwarula-bot.github.io/invoicezero/",
  "description": "Free invoice generator with zero friction. No signup, no backend, complete privacy.",
  "applicationCategory": "BusinessApplication",
  "offers": {
    "@type": "Offer",
    "price": "0",
    "priceCurrency": "USD"
  },
  "operatingSystem": "Any",
  "browserRequirements": "Requires JavaScript"
}
</script>'

# Add schema to index.html before closing head tag
if ! grep -q "schema.org" /root/.openclaw/workspace/invoicezero/index.html; then
    sed -i "s|<script defer data-domain|$SCHEMA\n<script defer data-domain|" /root/.openclaw/workspace/invoicezero/index.html
    echo "✅ Added Schema.org structured data to index.html"
else
    echo "⚠️ Schema already exists, skipping"
fi

echo "✅ SEO enhancement complete"
