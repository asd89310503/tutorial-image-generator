// ── 教學圖設定檔 ──────────────────────────────────
// 改這份檔就能換一張新圖。座標都是「相對該手機截圖」的百分比。
// left/top = 左上角位置，width/height = 框的寬高（%）。
var CONFIG = {
  title: "設定建立文件後內容存取位置",   // 頂部膠囊主標題
  // titleSize: 118,                     // （選填）標題字級，太長會自動縮小
  canvas: { w: 2000, h: 1050 },          // 畫布尺寸（橫式）
  phones: [
    {
      img: "assets/s1.png",              // 12:42 動作列表
      marks: [
        { left: 5, width: 89, top: 62,   height: 8 },   // 建立並打開頁面
        { left: 5, width: 89, top: 78.5, height: 8 }    // 建立文件但不開啟
      ]
    },
    {
      img: "assets/s2.png",              // 12:49 標題
      marks: [
        { left: 6, width: 17, top: 18, height: 6.4 }    // 標題
      ]
    },
    {
      img: "assets/s3.png",              // 12:50 文字
      marks: [
        { left: 6,  width: 26, top: 18, height: 6.4 },  // 文字
        { left: 29, width: 37, top: 52, height: 7 }     // 每次都詢問
      ]
    }
  ]
};
if (typeof module !== "undefined") module.exports = CONFIG;
