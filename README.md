# Picsur Zeabur Template

這是一個用於在 Zeabur 上一鍵部署 Picsur 圖片分享服務的模板。

## 🚀 快速開始

### 方法 1: 使用 Zeabur CLI 部署

```bash
# 部署模板到 Zeabur
npx zeabur@latest template deploy -f picsur-template.yaml
```

部署過程中會提示你：
1. 選擇專案（或建立新專案）
2. 選擇部署區域（建議選擇香港或東京）
3. 輸入域名（例如：`mypicsur`，完整域名會是 `mypicsur.zeabur.app`）
4. 設定管理員密碼

### 方法 2: 發布為公開模板

如果你想將這個模板分享給其他人使用：

```bash
# 發布模板到 Zeabur Marketplace
npx zeabur@latest template create -f picsur-template.yaml
```

## 📋 模板內容

這個模板包含：

### 服務
- **PostgreSQL 17** - 資料庫服務
  - 自動配置資料庫名稱、使用者和密碼
  - 持久化儲存在 `/var/lib/postgresql/data`

- **Picsur** - 圖片分享服務
  - 基於官方 Docker 映像檔 `ghcr.io/caramelfur/picsur:latest`
  - 自動連接到 PostgreSQL
  - 支援自訂域名
  - 預設最大檔案大小：128MB

### 變數
- `PICSUR_DOMAIN` - 你的 Picsur 域名
- `ADMIN_PASSWORD` - 管理員帳號密碼（使用者名稱固定為 `admin`）

## 🎯 部署後步驟

1. **訪問你的 Picsur 實例**
   - 前往你設定的域名（例如：`https://mypicsur.zeabur.app`）

2. **登入管理員帳號**
   - 使用者名稱：`admin`
   - 密碼：你在部署時設定的密碼

3. **配置設定**
   - 前往 `Settings` → `Roles` → `Guest` → `Edit`
   - 啟用 `Register` 權限以允許使用者註冊
   - 在 `Settings` → `General` 中配置其他選項

## ⚙️ 進階配置

### 修改最大檔案大小

編輯 `picsur-template.yaml`，找到 `PICSUR_MAX_FILE_SIZE` 環境變數：

```yaml
PICSUR_MAX_FILE_SIZE:
  default: "128000000"  # 128MB，單位是 bytes
```

### 保留原始圖片

部署後在 Picsur 設定中啟用 `Keep original` 選項。

### 自訂環境變數

你可以在模板中的 `env` 區塊新增更多環境變數：

```yaml
env:
  PICSUR_VERBOSE:
    default: "false"
  PICSUR_JWT_EXPIRY:
    default: "7d"
```

完整的環境變數列表請參考 [Picsur 官方文件](https://github.com/CaramelFur/Picsur)。

## 📚 功能特色

- ✅ 支援多種圖片格式（QOI、JPG、PNG、WEBP、TIFF、HEIF、BMP、GIF、JPG-XL、JPG-2000）
- ✅ 圖片編輯功能（調整大小、旋轉、翻轉、濾鏡）
- ✅ 使用者帳號系統與權限管理
- ✅ 圖片可設定過期時間
- ✅ ShareX 整合
- ✅ 自動清除 EXIF 資訊
- ✅ CORS 安全限制

## 🛠️ 測試模板

在發布前，你可以先測試模板是否正常運作：

```bash
# 部署測試
npx zeabur@latest template deploy -f picsur-template.yaml
```

確認一切正常後再發布：

```bash
# 發布到 Marketplace
npx zeabur@latest template create -f picsur-template.yaml
```

## 📖 相關資源

- [Picsur GitHub](https://github.com/CaramelFur/Picsur)
- [Picsur Demo](https://picsur.org/)
- [Zeabur 模板文件](https://zeabur.com/docs/template/template-in-code)
- [Zeabur CLI 文件](https://zeabur.com/docs/deploy/cli)

## 🤝 貢獻

如果你想改進這個模板：

1. Fork 這個專案
2. 修改 `picsur-template.yaml`
3. 測試你的修改
4. 提交 Pull Request

## 📄 授權

這個模板基於 Picsur 專案，遵循 AGPL-3.0 授權。

## ❓ 常見問題

### Q: 如何修改管理員密碼？
A: 登入後前往設定頁面修改。

### Q: 如何允許使用者註冊？
A: 前往 `Settings` → `Roles` → `Guest` → `Edit`，啟用 `Register` 權限。

### Q: 圖片會被壓縮嗎？
A: Picsur 預設使用 QOI 格式儲存，這是一種無損壓縮格式。

### Q: 如何整合 ShareX？
A: Picsur 內建 ShareX 端點支援，登入後在設定中可以找到整合說明。

### Q: 可以保留原始圖片嗎？
A: 可以，在設定中啟用 `Keep original` 選項即可。

---

如有任何問題，歡迎開 Issue 討論！
