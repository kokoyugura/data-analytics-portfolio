# 03.顧客離反予測モデル（Churn Prediction Project）

## 📌 プロジェクト概要
本プロジェクトは、小売・ワイン販売などの顧客データを想定した「顧客離反予測モデル」です。  
顧客の購買履歴データから特徴量（RFM＋行動傾向）を作成し、  
ランダムフォレストによる離反確率の推定を行っています。

---

## 🎯 分析目的
- 過去の購買行動から **離反しそうな顧客を早期に検知**
- 顧客維持（CRM施策）に活用できるインサイトの抽出
- 機械学習ワークフロー（特徴量設計〜モデル評価）の実践

---

## 🧩 データ構成
| ファイル名 | 内容 |
|-------------|------|
| `data/transactions.csv` | 顧客別の購買履歴（1行＝1トランザクション） |
| `data/features.csv` | 顧客単位に集約した特徴量データ（RFM＋傾向指標） |
| `notebooks/01_feature_engineering.ipynb` | 特徴量生成スクリプト |
| `notebooks/02_modeling.ipynb` | 離反予測モデル構築 |
| `notebooks/03_prediction.ipynb` | 新規顧客データに対する離反確率予測 |
| `output/` | 可視化・モデルファイルなど |

---

## 🧠 分析フロー

### 1️⃣ トランザクションデータ生成
- 顧客単位で1〜10件程度の購買履歴をランダム生成  
- 購入金額は1,000〜20,000円の範囲で設定  

### 2️⃣ 特徴量作成（Feature Engineering）
顧客単位に以下の特徴を生成：

| 特徴量名 | 説明 |
|-----------|------|
| Recency | 最終購入日からの経過日数 |
| Frequency | 購買回数 |
| Monetary | 総購入金額 |
| AvgInterval | 平均購買間隔（日） |
| Last3MonthsPurchases | 直近3ヶ月の購買回数 |
| ChurnFlag | 離反フラグ（90日以上購入なし＝1） |

### 3️⃣ モデル構築
- **アルゴリズム**：RandomForestClassifier  
- **評価指標**：Accuracy, ROC-AUC  
- **学習データ分割**：train 80% / test 20%

### 4️⃣ 新規顧客の離反確率予測
顧客の特徴量を入力すると、離反確率を算出：

| Recency | Frequency | Monetary | AvgInterval | Last3MonthsPurchases | 離反確率 |
|----------|------------|-----------|--------------|----------------------|-----------|
| 150 | 2 | 12000 | 70 | 0 | 91.4% |
| 10 | 8 | 85000 | 30 | 3 | 3.8% |

---

## 📊 特徴量重要度（例）
![feature_importance](output/feature_importance.png)

| Feature | Importance |
|----------|-------------|
| Recency | 0.47 |
| Last3MonthsPurchases | 0.21 |
| AvgInterval | 0.16 |
| Frequency | 0.10 |
| Monetary | 0.06 |

---

## 🧰 使用技術
| 分類 | 内容 |
|------|------|
| 言語 | Python 3.10+ |
| 分析ライブラリ | pandas, numpy, scikit-learn, matplotlib, seaborn |
| 機械学習 | RandomForest, LogisticRegression |
| 可視化 | seaborn, matplotlib |
| 環境 | Jupyter Notebook / VSCode |

---


