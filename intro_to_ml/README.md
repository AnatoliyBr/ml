## 2. Введение в МО (Python)

## Содержание
* [Введение в машинное обучение](#введение-в-машинное-обучение)
* [Регрессия](#регрессия)
* Задача классификации
    * [k-NN](#классификатор-k-nn)
    * [Наивный байесовский классификатор](#наивный-байесовский-классификатор)
    * [Логистическая регрессия](#логистическая-регрессия)
      * [F-мера и ROC-анализ](#f-мера-и-roc-анализ)
* Кластеризация

## Введение в машинное обучение

### Определения
* Машинное обучение (МО) - статистическое обучение
* Предикторы (признаки) - входные данные (независимые переменные)
* Отклики - выходные данные (зависимые переменные)
* Тренировочный набор данных - для обучения модели
* Тестовый набор данных - для проверки эффективности ("правильности") модели

### Диаграмма терминов
* Наука о данных (Data Science)
* Интеллектуальный анализ данных (Data Mining)
* Стандартное программирование (Classical Programming)

<p align="center">
  <img src="/intro_to_ml/images/terms.png" width="800">
</p>

### МО, как часть ИИ
<p align="center">
  <img src="/intro_to_ml/images/ml_in_ai.png" width="800">
</p>

### Карта мира МО
<p align="center">
  <img src="/intro_to_ml/images/ml_world_map.png" width="800">
</p>

### Классическое обучение
<p align="center">
  <img src="/intro_to_ml/images/classical_ml.png" width="800">
</p>

### Задачи классического МО
* Обучение с учителем:
    1. **Задача регрессии** - задача предсказания числа по некоторым входным данным
    2. **Задача классификации** - задача отнесения объекта к одному из заранее известных классов
* Обучение без учителя:
    1. **Задача кластеризации** - задача распределения объектов по заранее неизвестным, непересекающимся множествам (кластерам)
    2. **Задача поиска ассоциативных правил** (поиск ассоциаций) - задача выявления закономерностей между связанными элементами (событиями или объектами)
    3. **Задача уменьшения размерности** - это задача нахождения преобразования данных, состоящего в уменьшении числа используемых переменных (возможно новых)

### Обучение с подкреплением
* За каждое действие получает баллы
* Алгоритм Q-learning

### Ансамблевые методы
* Одни из самых точных
* Идея: объединение различных методов
* Разновидности:
    * **Стекинг** - обучает несколько различных алгоритмов и передает их на вход последнему, который принимает финальное решение
    * **Беггинг** - предполагает обучение одного и того же алгоритма много раз на случайных выборках из исходных данных, а в конце усреднение ответов
    * **Бустинг** - предлагает обучать алгоритмы последовательно, причем при каждом следующем обучении новый алгоритм уделяет особое внимание ошибкам предыдущего

### Нейросети и глубокое обучение
* Нейросеть - набор нейронов и связей
* Нейрон - функция с множеством входов и одним единственным выходом
* Связь - канал, через который нейроны передают друг другу числовые значения
    * У каждого канала есть свой вес (пропускная способность, прочность связи)
    * Нейроны связывают по слоям (в реальности это представлено матрицами и вычисляется средставми линйеной алгебры)

## Регрессия

### Модель простейшей линейной регрессии
$$ Y = \theta_0 + \theta_1 X_1 + \epsilon $$

* $\theta_0$ , $\theta_1$ - числовые коэффициенты
* $X1$ - неслучайный параметр, значения задаются или наблюдаются (то есть известны)
* $\epsilon$ - случайная ошибка

### Линия регрессии - функция
$$ f(X_1) = \theta_0 + \theta_1 X_1 $$

### Уравнение регрессии - уравнение
$$ Y = \theta_0 + \theta_1 X_1 $$

### МНК
Метод наименьших квадратов (МНК) - метод поиска коэффициентов регрессии, позволяющий найти такие оценки параметров $\theta_0$ и $\theta_1$, что сумма квадратов ошибок $\epsilon$ в наблюдаемых n экспериментах минимальна.

### Предположения о распределении случайных ошибок
1. Случайные ошибки независимы и одинаково распределены.
2. Ошибки не носят систематического характера (их мат. ожидание равно нулю).
3. Дисперсии ошибок одинаковы.
4. Ошибки подчиняются нормальному распределению с нулевым мат. ожиданием ($\epsilon_i ~ N_{0, \sigma^2}$).

Первые три условия - условия Гаусса-Маркова.

### Доверительный интервал
Доверительный интервал строится на основе **стандартных ошибок (SE)**. На практике часто рассматривают значения $\epsilon = 0.1$, $\epsilon = 0.05$ или $\epsilon = 0.01$.

Доверительный интервал уровня доверия $(1- \epsilon)$ для параметра $\theta_i$ – это интервал:

$$ (\theta_{est_i} - t_{1-\epsilon/2} SE(\theta_{est_i}), \theta_{est_i} + t_{1-\epsilon/2} SE(\theta_{est_i})) $$

* $t_{1-\epsilon/2}$ - квантиль распределения Стьюдента с (n - 2) степенями свободы

### Проверка гипотезы
Для проверки гипотезы также используюся стандартные ошибки (SE).

Обычно проверяют гипотезу статистической значимости параметра $\theta_{est_1}$.

Гипотеза $H_0$: между $X1$ и $Y$ нет зависимости, $H_1$ - есть. 

t-критерий Стьюдента:

$$ t = {|\theta_{est_i}| \over SE(\theta_{est_i})} $$

### Оценка точности модели
1. Среднеквадратическое отклонение остатков (RSE) - оценка среднего квадратического отклонения ($\sigma^2$) ошибки $\epsilon$.
2. $R^2$ статистика - в отличие от RSE, величина безразмерная и лежит между нулем и единицей.

## Классификатор k-NN

### Алгоритм
Алгоритм k-ближайших соседей (k-nearest neighbours)

Проблемы:
* Выбор k
  * Случайное разделение выборки:
    * На две части - тренировочную и тестовую ($D_{train} : D_{test} = 80 : 20$)
    * На три части - откалывать от $D_{train}$ validation-part $D_{val}$
  * В случае двухклассовой классификации достаточно брать нечетные k
  * В остальных случаях - взвешанный метод k-NN
    * Каждому объекту тренировочных данных $x_i$ приписывается некоторый вес $\omega_i$, зависящий от тестового объекта z
    * За вес можно взять величину, обратно пропорциональную квадрату расстояния между объекатми $x_i$ и z

$$ \omega_i = \omega_i(x_i, z) = {1 \over d^2(x_i, z)} $$

* Выбор метрики

### Метрики
Метрика (расстояние) - функция, удовлетворяющая трем условиям:
1. Она неотрицательна
2. Она симметричная
3. Выполняется неравенство треугольника

Виды метрик:
1. Евклидова метрика (евклидово расстояние, расстоние по прямой)
  * Обощение теоремы Пифагора
  * Частный случай расстояния Минковского (при q = 2)

$$ d_E(x, x') = \sqrt{\sum_{i=1}^p(x_i - x_i')^2} $$

2. Расстояние Минковского

$$ d_q(x, x') = \sqrt[q]{\sum_{i=1}^p|x_i - x_i'|^q}, q \geq 1 $$

3. Манхэттенское расстояние (расстояние городских кварталов)
  * Частный случай расстояния Минковского (при q = 1)
  * Решает вопрос расчета длины поездки по городу, если все улицы города строго перпендикулярны

$$ d_1(x, x') = \sum_{i=1}^p|x_i - x_i'| $$

4. Расстояние Чебышева
  * Частный случай расстояния Минковского (при $q = \infty$)
  * Показывает максимальное покоординатное отклонение одного объекта от другого

$$ d_{\infty}(x, x') = max|x_i - x_i'|, i \in (1, ...,p) $$

<p align="center">
  <img src="/intro_to_ml/images/metrics.png" width="800">
</p>

### Классификация методом k-NN
1. Вычисляем расстояние от тестового объекта до каждого элемента тренировочного набора данных
2. Упорядочиваем эти расстояния по неубыванию и перенумеровываем элементы тренировочного набора данных (первый элемент – самый близкий к тестовому объекту, второй – второй по близости, и так далее)
3. Перенумеровываем отклики согласно перенумерованным объектам
4. Ищем тот класс (или те классы), объекты которых встретились среди k ближайших элементов чаще всего

Гипотеза компактности - возможные классы образуют компактно локализованные подмножества в пространстве объектов.

Алгоритм k-NN является
* метрическим (анализ сходства объектов с помощью метрики)
* ленивым (обучение просходит лишь в момент предсказания)

### Нормализация данных
Разные единицы измерения признаковмогут искажать расстояние между объектами.

Линейная нормировка:

$$ X_i' = {X_i - X_{min} \over X_{max} - X_{min}} $$

* $X_{min}$ – минимальное значение рассматриваемого предиктора
* $X_{max}$ – максимальное значение
* $X_i$ – нормируемое значение
* $X_i′$ – нормированное значение

### Оценка алгоритма
Алгоритм – это функция, сопоставляющая произвольному объекту некоторый отклик.

Функция потерь: $L(a, x)$
* $a$ - алгоритм
* $x$ - объект

Если $L(a, x) = 0$, то ответ $a(x)$ - корректный.

Эмпирический риск (функционал средних потерь) - доля неправильных построенного классификатора на наборе данных:

$$ Q(a, l, x_1, ..., x_n) = {1 \over n} \sum_{i=1}^nL(a, x_i) = {1 \over n} \sum_{i=1}^nI(a(x_i) \not= y(x_i)) $$

Алгоритм тем лучше, чем меньше значение соответствующего ему функционала потерь.

### Разделение набора данных
Чтобы модель не **переобучалась**, исходный набор данных принято случайно разделять:
* На две части - тренировочную и тестовую

$$ D_{train} : D_{test} = 80 : 20 $$

* На три части - откалывать от $D_{train}$ validation-part $D_{val}$)
  * Имея набор данных $D_{val}$, имеет смысл выбрать тот алгоритм, который допускает меньшее число ошибок на этом наборе данных, и тогда именно этот алгоритм и нужно оценить на $D_{test}$, предварительно обучив на всем наборе $D_{train}$ (включая искуственно отколотый набор $D_{val}$)

### k-блочная кросс-валидация
<p align="center">
  <img src="/intro_to_ml/images/cross_validation.png" width="800">
</p>

По сути дела тренировочный набор данных $D_{train}$ делится на несколько более маленьких кусочков, каждый из которых на своей итерации выступает тестовым набором данных – набором данных для оценивания алгоритма. Финальная оценка каждого алгоритма – это усреднение оценок на каждой итерации.

## Наивный байесовский классификатор

### Метрические vs Вероятностные модели
Наивный байесовский классификатор - **вероятностный** классификатор, в основе которого лежит теорема Байеса.

Данные могут быть **неточными** и **неполными**, поэтому предположение о существовании явной зависимости, дающей по описанию объекта единственно верный ответ (отклик), кажется достаточно наивным.

Вероятностные модели позволяют, в некотором смысле, устранить описанную некорректность.

### Формулы
Формула умножения вероятностей:

$$ P(AB) = P(A)P(B/A) = P(B)P(A/B) $$

Tеорема Байеса превращает результаты испытаний в вероятность событий:

$$ P(A/B) = {P(A)P(B/A) \over P(B)} $$

* $P(A)$ - априорная вероятность гипотезы A
* $P(A/B)$ - вероятность гипотезы A при наступлении события B (апостериорная вероятность)
* $P(B/A)$ - вероятность наступления события B при истинности гипотезы A (правдоподобие)
* $P(B)$ - априорная вероятность наступления события B 

Замечание: истинные вероятности неизвестны, но их можно оценить, используя **частоту**.

### Почему наивный?
На практике совместное распределение $P(X_1, X_2, ..., X_p | Класс = y)$ не известно, поэтому классификатор работает в предположении **условной независимости предикторов** при условии данной метки класса.

$$ P(X_1, X_2, ..., X_p | Класс = y) = P(X_1 | Класс = y) P(X_2 | Класс = y) ... P(X_p | Класс = y)$$

### Перемножение малых величин
В случае, если объем тренировочных данных велик, а вероятности (или их оценки) малы, то результат перемножения компьютерными средствами, имеющими ограниченную точность, приведет к чему-то вроде
нуля. Для решения этой проблемы переходят к **натуральному логарифму**.

Для двоичного классификатора с двумя предикторами формула вероятности отнесения к классу y*:

$$ P(Класс = y^* | X_1, X_2) = {1 \over 1 + e^{F(y) - F(y^*)}} $$

$$ F(y) = ln{P(Класс = y)} + \sum_{i = 1}^2{ln{P(X_i|Класс = y)}} $$

### Неизвестное число значений предиктора
На примере спам-фильтра **сглаживание по Лапласу** – предположить, что мы видели каждое слово **на один раз больше**.

$$ P(X | Класс = y) = {количество слов X в классе y \over количество слов в классе y} $$

$$ P(X | Класс = y) = {1 + количество слов X в классе y \over |V| + количество слов в классе y} $$

* $|V|$ - количество слов в словаре

А что, если в письме встретилось слово, которого **нет в словаре**? Есть два варианта: либо это слово можно выкинуть из рассмотрения, то есть пропустить, либо в момент классификации **переучить** построенный классификатор, используя снова сглаживание по Лапласу.

$$ P(X | Класс = y) = {1 + количество слов X в классе y \over |V| + r + количество слов в классе y} $$

* $r$ - количество слов в письме, которых нет в словаре

## Логистическая регрессия

### Генеративные vs Дискриминативные алгоритмы
Алгоритм двухклассовой логистической регрессии выдает **вероятность отнесения** того или иного объекта к одному из двух рассматриваемых классов.

Заметим, что при классификации методом байеса производится **оценка апостериорного максимума (MAP)**, то есть поиск совместного распределения $P(Y, X_1, X_2, ..., X_p)$.

Алгоритмы, моделирующие совместное распределение $P(Y, X_1, X_2, ..., X_p)$, называют **генеративными**.
* Они моделируют распределения для каждого класса в отдельности

Алгоритмы, непосредственно моделирующие $P(Y | X_1, X_2, ..., X_p)$, называются **дискриминативными**.
* Они в p-мерном пространстве признаков $R^p$ строят некоторую границу, разделяющую данные разных классов (это может прямая, плоскость или более сложные формы)

В основе логистической регрессии заложено следующее предположение о (параметрическом) виде распределения условных вероятностей:

$$ P(Y = 1 | X_1, X_2, ..., X_p) = {1 \over 1 + e^{-(\theta_0 + \theta_1X_1 + ... + \theta_pX_p)}} $$

* $\theta_0, \theta_1, ..., \theta_p$ - параметры алгоритма, оцениваются из тренировочного набора данных

### Логарифмируем шанс
Для вывода формулы выше необходимо перейти от вероятности отнесения объекта к положительному классу $P_+$ к шансу $odd_+$, а затем логарифмировать $ln(odd_+)$.

$$ odd_+ = P_+/P_-, P_- \not= 0$$
$$ odd_+ = \infty, P_- = 0$$

Таким образом, получим непрерывную переменную:

$[0, 1] -> [0, +\infty] -> [-\infty, +\infty]$

### Сигмоида
Сигмоида - логистическая функция:

$$ \sigma(x) = {1 \over 1 + e^{-x}} $$

Свойства:
1. Возрастающая
2. Непрерывная на R
3. При $x = +\infty$ равна 1, а при $-\infty$ - 0
4. Ограничена двумя горизонтальными асимптотами y = 0 и y = 1

Следовательно, $\sigma(x)$ - функция распределения.

**Пограничная вероятность** отнесения объекта к классу «+1» (или «−1»), то есть вероятность $P_+ = P_− = 0.5$, – это значение функции $\sigma(x)$ в точке 0, что равнозначно:

$$ x = \Psi = (\theta_0 + \theta_1X_1 + ... + \theta_pX_p) = 0 $$

Множество точек, удовлетворяющих написанному равенству, – это **гиперплоскость** (точка в $R$, прямая в $R^2$, плоскость в $R^3$).

Алгоритм логистической регрессии - **линейный** классификатор (так как граница двух классов гиперплоскость)

### Пограничная вероятность
Алгоритм логистической регрессии - это композиция решающего правила (какой порог?) и базового алгоритма логистической регрессии (просто выдает число в диапазоне [0, 1]).

### Метод максимального правдоподобия
Метод максимального правдоподобия – один из мощнейших статистических методов, позволяющий получать по выборке оценки параметров $\theta_0, \theta_1, ..., \theta_p$ семейств вероятностных распределений.

Грубо говоря, в качестве **максимально правдоподобного** значения $\theta$ берут такое, что при n испытаниях максимизируется вероятность получения выборки $x_1, x_2, ..., x_n$, полученной после эксперимента.

Число сочетаний из n элементов по k:

$$ C_n^k = {n! \over k! (n - k)!} $$

Вероятность k успехов при проведении n испытаний (формула Бернулли):

$$ P(B(n, k)) = C_n^kp^k(1 - p)^{n-k} $$

* p - вероятность успеха в каждом испытании, изначально не известна, оценивается по выборке

Функция правдоподобия:

$$ f(X, \theta) = P_{\theta}(X_1 = x_1) P_{\theta}(X_2 = x_2) ... P_{\theta}(X_n = x_n)$$

Логарифмическая функция правдоподобия:

$$ L(X, \theta) = lnf(X, \theta) = lnP_{\theta}(X_1 = x_1) + ... + lnP_{\theta}(X_n = x_n)$$

**Оценка максимального правдоподобия** заключается в поиске аргумента, при котором функция $f(X, \theta)$ доостигает максимума.

$logloss(X, \theta)$ - логистическая функция потерь (ошибки).

Градиентный спуск - численный метод для минимизации функции.

Отступ объекта $x_i$ (margin) - степень погруженности объекта в класс.

$$M(\theta, x_i) = y_i(\theta_0 + \theta_1x_{i1} + ... + \theta_px_{ip}) $$

Отступ $M(\theta, x_i)$ **отрицателен** тогда и только тогда, когда объект **неправильно** классифицирован.

### Линейная vs Логистическая регрессия
При средних значениях предикторов модели ведут себя по-разному. Так, в логистической регрессии видно сильное изменение значений вероятности за счет изменения выпуклости функции и ее стремительного роста при «средних» значениях параметра (в примере - дохода), тогда как в линейной модели значения вероятностей изменяются с одинаковой скоростью на всем диапазоне.

Кроме того, в задачах классификации у линейной модели возникает потеря нормировки.

<p align="center">
  <img src="/intro_to_ml/images/lin_vs_log_reg.png" width="800">
</p>

## F-мера и ROC-анализ

### Матрица ошибок и F-мера
**Матрица ошибок (confussion matrix)** - способ деления объектов:
* **TP (True Positives)** – верно классифицированные объекты, исходно относящиеся к классу «+1»;
* **TN (True Negatives)** – верно классифицированные объекты, исходно относящиеся к классу «−1»;
* **FN (False Negatives)** – неверно классифицированные объекты, исходно
относящиеся к классу «+1» (ошибка I рода);
* **FP (False Positives)** – неверно классифицированные объекты, исходно
относящиеся к классу «−1» (ошибка II рода)

Основные метрики:
1. Accuracy - доля правильных ответов классификатора

$$ Accuracy = {TP + TN \over TP + FP + FN + TN}$$

2. Sensitivity (чувствительность) или Recall - доля истинно положительных примеров

$$ TPR = {TP \over TP + FN} $$

3. FPR (False Positives Rate) - доля ложно положительных примеров

$$ FPR = {FP \over FP + TN} $$

4. Специфичность (Specificity) или True Negatives Rate (TNR)

$$ TNR = 1 - FPR = {TN \over TN + FP} $$

5. Precision (точность)

$$ Precision = {TP \over TP + FP} $$

**F-мера (F1-мера, F score, F1 score)** - среднее гармоническое величин Precision и Recall, заключена в диапазоне [0, 1].

$$ F = F_1 = 2 {Precision Recall \over Precision + Recall} $$

### ROC-кривая
**ROC-кривая (кривая ошибок)** - интегральная метрика, которая показывает зависимость доли истинно положительных примеров от доли ложно положительных примеров (зависимость TPR от FPR). Для ее построения нужно вычислить соответствующие значения при разных порогах отсечения.

Используется для **выбора порога отсечения**.

Чем больше выгнута ROC-кривая, тем более точным является прогнозирование результатов модели.

Оценка модели может быть получена непосредственно вычислением площади под ROC-кривой. Показатель обозначается как AUC (Area Under Curve – площадь под кривой) или **AUC-ROC**.

Оптимальным значением порога, будет точка пересечения графика чувствительности (TPR) и специфичности (TNR).


