import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np

df = pd.read_csv("medical_examination.csv")

ibm = (df["weight"] / ((df["height"] / 100) ** 2))
ibm = np.array(ibm)
print(ibm)

ibm = np.where(ibm > 25, 1, 0)

df['overweight'] = ibm.astype(int)

print(df['overweight'])

df["cholesterol"] = np.where((df["cholesterol"] == 1), 0, 1)
df["gluc"] = np.where((df["gluc"] == 1), 0, 1)

def draw_cat_plot():
    df_cat = pd.melt(df, id_vars=["cardio"],
                     value_vars=['active', 'alco', "cholesterol", 'gluc', 'overweight', 'smoke'])

    figure = sns.catplot(x="variable", kind="count", hue="value", data=df_cat, col="cardio")

    figure.set_axis_labels("variable", "total")

    fig = figure.fig

def draw_heat_map():
    df_heat = df[(df['ap_lo'] <= df['ap_hi']) & (df['height'] >= df['height'].quantile(0.025))

                 & (df['height'] <= df['height'].quantile(0.975))

                 & (df['weight'] >= df['weight'].quantile(0.025))

                 & (df['weight'] <= df['weight'].quantile(0.975))]

    corr = df_heat.corr()

    mask = np.triu(np.ones_like(corr, dtype=bool))

    fig, ax = plt.subplots(figsize=(10, 10))


    dfplot = sns.heatmap(corr, fmt=".1f", vmax=0.26, annot_kws={'size': 11}, cmap='PRGn', annot=True, mask=mask)

    plt.show()

draw_cat_plot()

draw_heat_map()