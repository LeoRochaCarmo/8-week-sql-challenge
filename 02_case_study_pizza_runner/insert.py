#%%

import pandas as pd
import sqlalchemy

import os

#%%

engine = sqlalchemy.create_engine('sqlite:///data/database.db')

#%%

files = [i for i in os.listdir('./data')]

for file in files:
    table_name = file.removesuffix('.csv')
    df = pd.read_csv(f'./data/{file}', sep=';')
    df.to_sql(table_name, engine, index=False, if_exists='replace')
    