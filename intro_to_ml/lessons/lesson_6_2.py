import numpy as np
import pandas as pd
import matplotlib.pyplot as plt 

def gen_dict(Name, Age):
    '''
    Генерирует словарь.
    Name: list
    Age: list
    '''
    return dict(zip(Name, Age))

def plot_df(df):
    #plt.plot('weight', 'hp', data=df, ls='-.', lw='1', c='red', marker='o', label='Ломанная линия со звездочками')
    plt.plot('hp', 'accel', data=df)
    #plt.xticks([1500, 3000, 4500], ['легковесный', 'средневесный', 'тяжеловесный'])
    #plt.title('Зависимость мощности автомобиля от массы')
    plt.title('Зависимость ускорения автомобиля от мощности')
    plt.xlabel('Ускорение (м/c^2)')
    plt.ylabel('Мощность (л/c)')
    plt.legend(loc='lower right')
    #plt.ylim(100, 200)
    plt.grid(ls='-')
    plt.show()

def main():
    #print(gen_dict(['Kate', 'Lena', 'Dima'],[23, 56, 33]))
    df = pd.read_csv('https://courses.openedu.ru/assets/courseware/v1/b6cb4ea6a069a5a588596dd9e12de293/asset-v1:ITMOUniversity+BIGDATAINTROML+fall_2022_ITMO+type@asset+block/auto-mpg-quiz.csv', index_col='name')
    print(df.head, df.columns)
    df = df.drop(columns=['mpg', 'displ', 'yr', 'origin'])
    print(df.head, df.columns)

    print(df.sort_values('hp').head)
    plot_df(df.sort_values('hp'))
    df.hist('hp', bins=20)
    plt.show()
    df_1 = df.groupby('cyl', as_index=False).count()
    print(df_1.index)
    plt.pie(df_1.hp.values, labels=df_1.cyl.values)
    plt.show()

    cyl = df[df.cyl == 4]
    print(cyl.head, cyl.columns)
    cyl_hp = df[(df.cyl == 4) & (df.hp > 80)]
    print(cyl_hp.head, cyl_hp.columns)

    df = df[((df.cyl == 4) & (df.hp > 80)) | ((df.cyl == 8) & (df.hp > 90))].sort_values('hp')
    print(round(df.weight.mean(), 3))

    #plot df
    plot_df(df)

    #plot function
    x = np.linspace(-5, 5, 100)
    y_1 = 0.5 * x + 1
    y_2 = np.sin(x)
    plt.plot(x, y_1, c='red', label='$y_1=0.5x+1$')
    plt.plot(x, y_2, c='blue', label='$y_2=\sin(x)$')
    plt.xlabel('$X$')
    plt.ylabel('$Y$')
    plt.legend(loc='upper left')
    plt.grid(c='#BFEFEF', ls='-', lw=0.5)
    plt.show()

    #scatter - точечная диаграмма - надо 2 массива
    x = df.weight
    y = df.hp
    colors = df.accel
    area = df.cyl ** 2

    plt.scatter(x, y, s=area, c=colors, cmap='winter')
    plt.show()


if __name__ == "__main__":
    main()