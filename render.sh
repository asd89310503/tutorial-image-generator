#!/bin/bash
# 教學圖產生器 — 把 config + 截圖 渲染成一張高清 PNG
# 用法：
#   ./render.sh                      使用 config.js，輸出 output.png
#   ./render.sh mycfg.js out.png     指定 config 與輸出檔名
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

CONFIG_FILE="${1:-config.js}"
OUT="${2:-output.png}"
SCALE="${SCALE:-2}"                       # 解析度倍率（2 = 高清）
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

# template 固定讀 .active.config.js，這裡把指定的 config 複製過去
cp "$CONFIG_FILE" ".active.config.js"

# 從 config 讀畫布尺寸給 window-size
read W H < <(node -e "const c=require('./$CONFIG_FILE');process.stdout.write(c.canvas.w+' '+c.canvas.h)")

rm -f "$OUT"
"$CHROME" --headless=new --disable-gpu --hide-scrollbars \
  --force-device-scale-factor="$SCALE" \
  --window-size="${W},${H}" \
  --virtual-time-budget=3000 \
  --screenshot="$OUT" \
  "template.html" 2>/dev/null || true

if [ -f "$OUT" ]; then
  echo "✅ 已輸出：$OUT （$((W*SCALE))×$((H*SCALE)) px，config=$CONFIG_FILE）"
else
  echo "❌ 渲染失敗，沒有產生 $OUT"; exit 1
fi
