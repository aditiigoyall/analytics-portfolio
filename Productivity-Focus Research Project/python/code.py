# importing libraries
import numpy as np
import pandas as pd

# importing data
df = pd.read_csv("cleaned_research_audio_data.csv")
df.head()

# Display column names, data types, and non-null counts
df.info()

# Droping duplicate / unnecessary duration column
df = df.drop(columns=['duration_use_hours'])  
df.head()

# Applying mapping to create a numeric noise cancellation column
nc_map = {
    'No': 0,
    'Yes': 1,
    'Sometimes': 2
}
df['noise_cancellation_ord'] = df['noise_cancellation'].map(nc_map)
df.head()
# map()- When converting categories to numbers
# replace()- When fixing text or typos

# creating binary environment columns
df['env_quiet'] = df['listening_environment'].str.contains('Quiet', case=False, na=False).astype(int)
df['env_busy'] = df['listening_environment'].str.contains('Busy', case=False, na=False).astype(int)
df['env_noisy'] = df['listening_environment'].str.contains('Noisy', case=False, na=False).astype(int)
df['env_workspace'] = df['listening_environment'].str.contains('Workspace', case=False, na=False).astype(int)
df['env_recreational'] = df['listening_environment'].str.contains('Recreational', case=False, na=False).astype(int)

# case = False - not case sensitive
# na = False - if value missing, treat it as false, no code crash
# id string contains then int value  

df = df.drop(columns=['listening_environment'])
df.columns

# Calculating APS score as the mean of all APS-related items
df['APS_score'] = df[
    [
        'aps_task_completion_on_time',
        'aps_assignment_management',
        'aps_productivity_in_noise',
        'aps_goal_achievement',
        'aps_headphones_productivity',
        'aps_distraction_task_delay_rev'
    ]
].mean(axis=1)

# Calculating ACS score as the mean of all ACS-related items
df['ACS_score'] = df[
    [
        'acs_focus_ability',
        'acs_attention_shifting',
        'acs_refocus_after_distraction',
        'acs_ignore_distractions',
        'acs_single_task_concentration',
        'acs_concentration_disrupted_rev',
        'acs_noise_concentration_difficulty_rev',
        'acs_sustained_attention_difficulty_rev',
        'acs_daydreaming_rev',
        'acs_headphones_focus_loss_rev'
    ]
].mean(axis=1)

# Round scores to 2 decimal places
df['APS_score'] = df['APS_score'].round(2)
df['ACS_score'] = df['ACS_score'].round(2)

# Summary statistics of final scores
df[['APS_score','ACS_score']].describe()

# Exporting final processed dataset to CSV
df.to_csv("final_audio_analysis_ready.csv", index=False)

# Installing required libraries for SQL Server connection
!python -m pip install pyodbc sqlalchemy

# Importing SQL-related libraries
import pyodbc
import sqlalchemy
print("pyodbc OK")
print("sqlalchemy OK")

# Creating SQLAlchemy engine to connect to SQL Server
from sqlalchemy import create_engine
server = r"DESKTOP-XXXX\SQLEXPRESS"   
database = 'master'
engine = create_engine(
    f"mssql+pyodbc://@{server}/{database}?driver=ODBC+Driver+17+for+SQL+Server"
)
print("Connected to SQL Server!")

# Connecting to the research database
from sqlalchemy import create_engine
import pandas as pd
server = r"DESKTOP-XXXX\SQLEXPRESS"
database = "AudioResearchDB"
engine = create_engine(
    f"mssql+pyodbc://@{server}/{database}?driver=ODBC+Driver+17+for+SQL+Server"
)

# Loading final processed dataset
data = pd.read_csv("final_audio_analysis_ready.csv")

# Uploading dataset to SQL Server table
data.to_sql(
    name="audio_study_data",
    con=engine,
    if_exists="replace",  
    index=False
)

# Previewing first 10 rows from SQL table
pd.read_sql("SELECT TOP 10 * FROM audio_study_data", engine)

# Checking total number of rows uploaded
pd.read_sql("SELECT COUNT(*) AS total_rows FROM audio_study_data", engine)
