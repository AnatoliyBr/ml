import pandas as pd


def main():
    df = pd.read_csv('https://courses.openedu.ru/asset-v1:ITMOUniversity+DATANFST2035+cifru_2035+type@asset+block@pulsar_stars_new.csv')
    
    df = df[((df.TG == 0) & ((df.MIP >= 81.5234375) & (df.MIP <= 82.9453125))) | ((df.TG == 1) & ((df.MIP >= 70.7421875) & (df.MIP <= 77.4921875)))]
    print(df.shape, round(df.MIP.mean(), 3))

if __name__ == "__main__":
    main()