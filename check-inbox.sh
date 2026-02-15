#!/bin/bash
# InvoiceZero inbox checker

API_KEY="am_e3014e5a7256bc6185873328772518435ba34f5d28e6a1843d967dca9387947a"
INBOX="invoicezero@agentmail.to"

echo "=== InvoiceZero Inbox Check ==="
echo "Time: $(date -u '+%Y-%m-%d %H:%M:%S UTC')"
echo ""

# Get messages
RESPONSE=$(curl -s "https://api.agentmail.to/inboxes/${INBOX}/messages" \
  -H "Authorization: Bearer ${API_KEY}" \
  -H "Accept: application/json")

# Check for errors
if echo "$RESPONSE" | grep -q "\"name\":\".*Error\""; then
  echo "❌ API Error:"
  echo "$RESPONSE"
  exit 1
fi

# Count messages
COUNT=$(echo "$RESPONSE" | grep -o '"count":[0-9]*' | cut -d: -f2)
echo "📬 Total messages: ${COUNT}"

# Show unread messages
UNREAD=$(echo "$RESPONSE" | grep -o '"labels":\[.*"unread".*\]' | wc -l)
echo "🔔 Unread: ${UNREAD}"

if [ "$UNREAD" -gt 0 ]; then
  echo ""
  echo "=== Recent Messages ==="
  echo "$RESPONSE" | python3 -c "
import sys, json
data = json.load(sys.stdin)
for msg in data.get('messages', []):
    if 'unread' in msg.get('labels', []):
        print(f\"📧 From: {msg['from']}\")
        print(f\"   Subject: {msg['subject']}\")
        print(f\"   Time: {msg['timestamp']}\")
        print(f\"   Preview: {msg['preview'][:100]}\")
        print()
" 2>/dev/null || echo "$RESPONSE"
fi

echo ""
echo "✅ Inbox check complete"
