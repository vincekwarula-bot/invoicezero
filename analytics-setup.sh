#!/bin/bash
# Add privacy-friendly analytics to InvoiceZero

echo "Adding Plausible Analytics (privacy-friendly, no cookies)..."

# Add analytics script to index.html
sed -i 's|</head>|<script defer data-domain="vincekwarula-bot.github.io" src="https://plausible.io/js/script.js"></script>\n</head>|' /root/.openclaw/workspace/invoicezero/index.html

# Add to all blog pages
for file in /root/.openclaw/workspace/invoicezero/blog/*.html; do
    if [ -f "$file" ]; then
        sed -i 's|</head>|<script defer data-domain="vincekwarula-bot.github.io" src="https://plausible.io/js/script.js"></script>\n</head>|' "$file"
        echo "✅ Added analytics to $(basename $file)"
    fi
done

echo "✅ Analytics setup complete!"
echo "Note: Plausible's community edition is free and privacy-friendly (GDPR compliant)"
