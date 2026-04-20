# SpendiX App

SpendiX is an AI-powered personal finance and budgeting app built with Flutter.  
It combines expense tracking, financial analysis, consumer persona insights, and AI-assisted savings planning into a single mobile experience.

> 「Spend」代表花費，「X」象徵無限可能。  
> SpendiX 的核心目標，是讓記帳不只是紀錄，而是進一步幫助使用者理解自己的消費行為、建立儲蓄習慣，並獲得更個人化的理財建議。  
> 專案主軸重點：智慧記帳、消費人格分析、 AI 儲蓄規劃。

---

## Project Overview

Traditional budgeting apps often focus only on recording income and expenses, but they do not help users deeply understand *why* they spend money the way they do.  
SpendiX aims to solve that by combining:

- manual expense tracking
- monthly financial analysis
- spending persona prediction
- AI chatbot-based savings suggestions
- savings progress analysis

在提案簡報中，SpendiX 被定位為一款結合 AI 的智慧記帳 App，目標是透過消費資料分析、消費人格辨識與儲蓄建議，協助使用者更有效管理財務。:contentReference[oaicite:2]{index=2}

---

## Current Implementation Status

This repository currently contains a **Flutter mobile app prototype / MVP** with the following pages and flows:

- Welcome page
- Transaction history page
- Add transaction modal
- Analysis dashboard
- Consumer persona analysis page
- Savings progress page
- AI savings planning chatbot
- Settings page for inserting demo data

主程式目前以 `WelcomePage` 為入口，進入後透過底部導覽列切換「紀錄 / 分析 / 記帳 / ChatBot / 設定」五個主要區塊。:contentReference[oaicite:3]{index=3}

---

## Features

### 1. Welcome Page
A clean onboarding-style landing page with SpendiX branding and a button that navigates to the main app.:contentReference[oaicite:4]{index=4}

### 2. Manual Transaction Recording
Users can add income or expense records through a bottom-sheet modal UI.  
The form currently supports:

- income / expense toggle
- category selection
- date selection
- amount input
- note input
- optional saving allocation when recording income

新增記帳時，若使用者在收入模式下勾選加入儲蓄計畫，系統會記錄 `isSaving` 與 `savingAmount`，並在金額超過收入時阻擋提交。

### 3. Transaction History
The history page displays monthly records and calculates:

- total expense
- total income
- remaining balance

It also supports swipe-to-delete interactions and shows transaction notes.  
目前刪除功能已實作，但編輯功能仍標示為待實作。

### 4. Monthly Financial Analysis
The analysis page provides a monthly dashboard including:

- expense summary
- income summary
- remaining balance
- expense category pie chart
- income category pie chart
- weekly spending trend chart

分析頁面也能進一步導向「消費人格分析」與「儲蓄進度分析」頁面。

### 5. Consumer Persona Analysis
Based on the selected month's expense data, the app aggregates spending by category and sends the result to an external API for persona prediction.  
The returned persona is then displayed with a corresponding visual style and explanation.

### 6. Savings Progress Analysis
The app calculates current saved amount from local records and sends it to an analysis API to evaluate savings progress against a target plan.  
The page presents:

- current progress ratio
- expected progress
- visual progress bars
- textual savings insights

目前頁面中的起訖日期與目標金額仍是固定值，屬於可再擴充的階段。

### 7. AI Savings Planning Chatbot
The chatbot page initializes by:

1. reading the current month's expense records
2. summarizing spending by category
3. predicting the user's spending persona
4. sending persona + expense data to an external chatbot API
5. displaying AI-generated savings advice

使用者之後也可以繼續在聊天介面中手動輸入訊息與 AI 互動。

### 8. Local Demo Data Generation
The settings page currently includes a utility button to generate fake income and expense records for testing charts and pages.:contentReference[oaicite:11]{index=11}

---

## Product Vision

According to the proposal deck, SpendiX is designed around three major AI directions:

- **智慧記帳**：降低記帳門檻，減少手動輸入負擔
- **消費人格分析**：協助使用者認識自己的消費模式
- **目標儲蓄 / AI 儲蓄規劃**：根據財務狀況與目標提供個人化建議

提案中也提到語音記帳、自動分類與更完整的 AI 理財建議流程；不過就目前這份 Flutter repo 來看，核心已完成的是手動記帳、資料分析、人格 API 串接、儲蓄進度分析與聊天建議，語音記帳與更完整的自動分類仍比較接近規劃方向。

---

## Tech Stack

### Frontend
- Flutter
- Dart
- Material UI with iOS-inspired visual styling

### Local Data Storage
- SQLite via `sqflite`

### Networking / API Integration
- `http`

### Data / Visualization
- `fl_chart`

### Utilities
- `intl`
- `path`

目前 `pubspec.yaml` 可確認此專案已使用 `intl`, `http`, `sqflite`, `path`, `fl_chart`, `cupertino_icons` 等套件。:contentReference[oaicite:14]{index=14}

---

## Data Model

The local transaction model includes:

- `id`
- `category`
- `isExpense`
- `amount`
- `note`
- `date`
- `isSaving`
- `savingAmount`

SQLite 資料表 `transactions` 目前就是圍繞這組欄位建立，作為本地記帳資料核心。

---

## App Structure

```text
lib/
├── api/
│   └── personality_predictor_debug.dart
├── database/
│   └── database_helper.dart
├── models/
│   └── transaction_model.dart
├── add_transaction_modal_with_icons.dart
├── analysis_page.dart
├── chatbot_page.dart
├── ios_success_dialog.dart
├── main.dart
├── personality_analysis_page_updated.dart
├── savings_progress_page.dart
├── settings_page.dart
├── transaction_page_history_update.dart
└── welcome_page.dart
