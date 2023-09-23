import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
from pandas.plotting import register_matplotlib_converters
import datetime 
import numpy as np
import calendar
register_matplotlib_converters()

df = pd.read_csv("fcc-forum-pageviews.csv")

df = df.set_index("date")
df = df[(df["value"] <= df["value"].quantile(.975)) & (df["value"]  >= df["value"].quantile(.025))]

df.index = pd.to_datetime(df.index)

def draw_line_plot():
    

    fig, ax = plt.subplots()
   
    plt.plot(df.index,df["value"])
    plt.ylabel("Page Views")
    plt.xlabel("Date")
    plt.title("Daily freeCodeCamp Forum Page Views 5/2016-12/2019")


    fig.savefig('line_plot.png')
    return fig

def draw_bar_plot():
    df_bar = df.copy()
    df_bar['year'] = df_bar.index.year
    df_bar['month'] = df_bar.index.month

    caterog = df_bar.groupby([df.index.year, df.index.month],)["value"].agg(np.mean).rename_axis(["year","month"])
  
    caterog = caterog.reset_index()

    df_pivot = pd.pivot_table(
    caterog,
    values="value",
    index="year",
    columns= "month")
    ax = df_pivot.plot(kind="bar")
    fig = ax.get_figure()
    fig.set_size_inches(3,4)
    ax.set_xlabel("Years")
    ax.set_ylabel("Average Page Views")
    plt.legend( ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December",])

    plt.show()
    fig.savefig('bar_plot.png')
    return fig
def draw_box_plot():
    df_box = df.copy()
    df_box.reset_index(inplace=True)
    df_box['year'] = [d.year for d in df_box.date]
    df_box['month'] = [d.strftime('%b') for d in df_box.date]
    print(df_box)

    fig,axs = plt.subplots(1,2)
    fig.set_size_inches(3,3)
    sns.boxplot (x = df_box["year"], y = df_box["value"], ax = axis[0]).set(xlabel="Year", ylabel="Page Views")
    sns.boxplot(x=df_box["month"], y=df_box["value"],
              order=['Jan', 'Feb', "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
              ax = axis[1]).set(xlabel="Month", ylabel= "Page Views")
    axis[0].set_title('Year-wise Box Plot (Trend)')
    axs[1].set_title('Month-wise Box Plot (Seasonality)')
    plt.show()
    fig.savefig('box_plot.png')
    return fig
