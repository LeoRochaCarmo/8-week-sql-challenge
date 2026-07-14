#%%

import pandas as pd
import sqlalchemy
import os

#%%

engine = sqlalchemy.create_engine('sqlite:///data/database.db')

files = [i for i in os.listdir('./data') if i.endswith('.csv')]

for file in files:
    file_path = os.path.join('./data', file)
    table_name = file.removesuffix('.csv')
    df = pd.read_csv(file_path, sep=';')
    df.to_sql(table_name, engine, if_exists='replace', index=False)

# %%
