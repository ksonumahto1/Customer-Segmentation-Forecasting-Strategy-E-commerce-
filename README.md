# Customer Segmentation & Forecasting Strategy (E-commerce)

## Overview
Full-stack analytics project for a large e-commerce retailer. Built **Tableau** dashboards linking customer segments to operational KPIs; segmented **1M+ users** with **Python (K-Means on RFM/engagement)**; developed **SKU×region demand forecasts** with **XGBoost (R² ≈ 0.83)**. Insights projected **~¥30M/month revenue lift** (targeted campaigns) and **~¥6M/year savings** (better stocking, fewer stockouts).

## Key Features
- **Customer Segmentation:** Standardized RFM + engagement features → Elbow method → K-Means (k=4) → segment profiling (Dormant, Occasional, High-Value, VIP).
- **Demand Forecasting:** XGBoost on daily SKU×region aggregates; feature importance highlighted **price/discount** > lead time.
- **Dashboards:** Tableau views for customer mix, delivery delays, and SKU performance by region; designed for marketing & ops decision-making.
- **SQL Data Model:** Clean joins across `orders`, `delivery`, `inventory`, `network`, `users`, `clicks` with daily aggregates and availability/lead-time metrics.

## Tech Stack
Python (pandas, scikit-learn, xgboost), SQL (MySQL/SQLite), Tableau, Jupyter, Advanced Excel.

## Repository Structure 
data/
  raw/            # users.csv, orders.csv, clicks.csv, delivery.csv, inventory.csv, network.csv
  interim/        # cleaned & joined tables
  processed/      # modeling-ready datasets
notebooks/
  01_data_cleaning.ipynb
  02_rfm_features.ipynb
  03_kmeans_segmentation.ipynb
  04_xgb_demand_forecasting.ipynb
  05_tableau_prep.ipynb
sql/
  jd_final_table.sql
dashboards/
  marketing_ops.twbx
src/
  features.py  segment.py  train_xgb.py  utils.py
docs/
  screenshots/



pip install -r requirements.txt
# place CSVs in data/raw/
jupyter lab

## Data & Schema (core)
- **users**(user_id, age, gender, created_at, …)
- **orders**(order_id, user_id, sku_id, quantity, prices/discounts, order_time, order_date, dc_ori)
- **clicks**(user_id, sku_id, ts, platform)
- **delivery**(order_id, arr_time, …)
- **inventory**(date, dc_id, sku_id, available_flag)
- **network**(dc_id, region_id)

## Methodology (short)
1) Cleaning & features (RFM, engagement, pricing/discounts, lag/lead-time).  
2) Segmentation: scale → elbow → K-Means (k=4) → cluster profiling → link to KPIs.  
3) Forecasting: XGBoost on daily SKU x region aggregates (R²≈0.83) → stocking rules.  
4) Dashboards: Tableau for customer mix, delays, SKU performance by region.

## Results & Impact
- Segment-led campaigns → **~¥30M/month projected revenue lift**.  
- Forecast-driven stocking → **~¥6M/year savings**, fewer stockouts, smoother fulfillment.  
- Self-serve dashboards → faster decisions for marketing & supply chain.

## Author
Rohan S. Borse · [LinkedIn](https://linkedin.com/in/rohanborse) · rohan.borse@case.edu
