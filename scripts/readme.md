import pandas as pd
import numpy as np
import json
import requests
from io import StringIO
# Load the dataset
url = "https://data.cdc.gov/api/views/hksd-2xuw/rows.csv?accessType=DOWNLOAD"

# Use pandas to read the CSV directly from the URL
df = pd.read_csv(url)

# Now `df` contains your DataFrame loaded directly from the URL
print(df.head())


# Initial data overview
print("Initial shape of the dataset:", df.shape)

# Drop completely empty columns
df_cleaned = df.dropna(axis=1, how='all')
print("Shape after dropping completely empty columns:", df_cleaned.shape)

# Columns considered critical for this analysis
critical_columns = ['YearStart', 'YearEnd', 'LocationAbbr', 'StratificationCategory1', 'Stratification1', 'DataValue']

# Dropping rows with missing values in any of the critical columns
df_cleaned = df.dropna(subset=critical_columns)

#  Provide a simple statistical summary for numerical columns
print("Statistical summary of numerical columns:")
print(df_cleaned.describe())

# Optional: Save the cleaned dataset to a new CSV file
cleaned_file_path = r"/content/U.S._Chronic_Disease_Indicators.csv"
df_cleaned.to_csv(cleaned_file_path, index=False)
print(f"Cleaned dataset saved to: {cleaned_file_path}")
