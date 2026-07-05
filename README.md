# 教學圖產生器（Tutorial Image Generator）

把「手機截圖 + 步驟文字 + 圈選指示」變成一張品牌一致的教學圖：
淺藍漸層背景 ＋ 模糊藍球 ＋ 白色膠囊主標題 ＋ 手機等高並排 ＋ 藍框圈選標註。
輸出 2 倍解析度 PNG，可直接放文章／IG。

## 檔案結構

```
tutorial-image-generator/
├─ template.html      固定模板（config 驅動，勿頻繁改）
├─ config.js          每張圖的設定：標題 + 截圖 + 標註座標
├─ render.sh          用 Chrome headless 渲染成 PNG
├─ assets/            放手機截圖（建議英文檔名 s1.png…）
└─ output.png         產出
```

## 用法

1. 把截圖放進 `assets/`（英文檔名，原圖別壓縮）
2. 編輯 `config.js`：標題、每張圖路徑、每個藍框的位置
3. 跑：
   ```bash
   ./render.sh                    # 用 config.js → output.png
   ./render.sh mycfg.js out.png   # 指定 config 與輸出檔
   SCALE=3 ./render.sh            # 更高解析度（預設 2）
   ```

## config.js 座標怎麼填

每個 `mark`（藍框）的四個值都是**相對「那支手機截圖」的百分比**：

| 欄位 | 意思 |
|------|------|
| `left`   | 框左緣，離手機左邊幾 %|
| `top`    | 框上緣，離手機頂端幾 %|
| `width`  | 框寬佔手機寬幾 %|
| `height` | 框高佔手機高幾 %|

**對位訣竅**：第一版憑目視填，渲染後看圖再微調——框偏上就加大 `top`，偏左就加大 `left`。通常調 1～2 次就準。

## 換尺寸

`config.js` 的 `canvas: { w, h }` 決定畫布。預設 `2000×1050`（橫式）。
改成直式（如 `1080×1350`）時，手機列會自動縮小並排；標題太長也會自動縮字。

## 相依

- macOS + Google Chrome（用 `--headless` 截圖）
- Node（`render.sh` 用它讀 config 尺寸）
