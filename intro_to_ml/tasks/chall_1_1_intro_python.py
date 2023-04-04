def grade(score):
    '''
    Расчет оценки.
    score: int [0, 100]
    return: string
    '''

    if score < 60:
        return 'неудовлетворительно'
    elif score < 75:
        return 'удовлетворительно'
    elif score < 91:
        return 'хорошо'
    elif score < 101:
        return 'отлично'

def solve(a, b):
    '''
    Решение уравнения ax = b
    a: int
    b: int
    return: x = float
    '''

    if a == 0 and b == 0:
        return 'Any'
    elif a == 0:
        return 'Error'
    else:
        x = b / a
        return x

def main():
    print(grade(101))
    print(solve(0, 1))

if __name__ == '__main__':
    main()