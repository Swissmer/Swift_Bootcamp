### Привет, студент. Это твой первый проект на Swift

Сегодняшняя цель - знакомство с основными функциями языка Swift, 
который является одним из самых известных языков для разработки, используемых в устройствах компании Apple.

**Swift** — это язык программирования с открытым исходным кодом, разработанный компанией Apple, и предназначенный для разработки приложений для ОС экосистемы компании. Однако, время от времени, он также может использоваться в других проектах.

Главные преимущества Swift:
- Читаемость: синтаксис языка выделяется среди других языков, что делает написание и чтение кода проще.
- Производительность: Swift быстрее, чем Objective-C, и разработан для высокой эффективности, что делает его подходящим для разработки высоконагруженных приложений.
- Безопасность: Swift имеет богатые инструменты для проверки типов и обработки ошибок, что помогает разработчикам писать более безопасный и защищенный код.

Вот некоторые из возможностей языка, которые делают его мощным и удобным инструментом:
- Optional
- Расширения
- Встроенные шаблонные функции, такие как map, filter и т.д.
- Structs, поддерживающие методы, расширения и протоколы
- Расширенный контроль управления с помощью специальных конструкций do, guard, defer, и repeat

# Темы
Прямо сейчас мы познакомимся с основами языка, вспомним как работают базовые вещи и разомнем пальцы. Основные темы:
- Типы данных
- Операторы, циклы и условия
- Использование аргументов в программе

[Документация Swift](https://docs.swift.org/swift-book/LanguageGuide/)

### Проект: Умный калькулятор 
Рассматриваются базовые функции языка при помощи проекта, который представляет собой набор инструментов для решения разных типов задач.

# Задачи

**Внимание!** Для создания проектов в течение всего интенсива будем использовать Workspace. 
Он позволит тебе удобно хранить несколько проектов в одном дне.

**Требование!** Создай workspace внутри папки src с названием day00. 
Для каждой задачи внутри workspace необходимо создать macOS/Command Line Tool проект. Например, day00/quest1, day00/quest2.
Также не забудь при создании проекта в пункте `Add to:` выбрать созданный workspace.
Более подробное описание о создании проектов можно прочитать в [документации](https://www.swift.org/getting-started/).

### Задание 0. Новый проект
Пример проекта можно посмотреть в папке `code-samples`.

- Выбери вкладку File -> New -> Workspace
- Выбери вкладку File -> New -> Project -> macOS -> Command line tool 
(в пункте `Add to:` укажи созданный workspace, также проект должен лежать внутри папки code-samples)

Успех! Твое погружение в Swift началось!


### Задание 1. Круги на полях
Разработай математический модуль, который определяет, пересекаются ли окружности.

- Две окружности на координатной плоскости: первая с центром в точке (x1, y1) с радиусом r1, вторая с центром в точке (x2, y2) с радиусом r2.
- Программа считывает координаты и радиус по очереди при помощи командной строки. 
- Программа работает с вещественными числами.
- Программа определяет, пересекаются ли окружности, и выводит это в качестве результата (касание также считается пересечением). В случае нахождения одного круга внутри другого необходимо вывести "One circle is inside another". Смотри пример ниже.
- Программа не завершается с ошибкой при некорректных входных данных. Она выводит "Couldn't parse a number. Please, try again" и повторяет попытку ввода параметра.

| Входные данные | Выходные данные |
| ------ | ------ |
| 0.0<br/>  0.0 <br/> 3.0 <br/> 4.0 <br/> 4.0 <br/> 3.0 <br/> | The circles intersect |
| 2.0<br/>  2.0 <br/> 3.0 <br/> 1.0 <br/> 1.0 <br/> 1.0 <br/> | One circle is inside another |
| 4.0<br/> 4.0 <br/> 4.0 <br/> -4.0 <br/> -10.0 <br/> 1.0 <br/> | The circles is not intersect |

### Задание 2. Составление чисел
Разработай модуль для составления чисел в соответствии с заданным пользователем числом.

- Программа последовательно составляет числа из соседних цифр в заданном пользователем числе и выводит их на экран. Например, 123 при расмотрении от высшего порядка к низшему будет выведено 3 числа - 1, 12 и 123.
- Пользователь выбирает порядок рассмотрения числа lower (от низшего порядка к высшему) или higher (от высшего порядка к низшему). Например, при lower результатом для 1022 будут выведенные числа - 2, 22, 220, 2201; при higher - 1, 10, 102, 1022.
- Составленное число должно быть частью заданного, начиная с первой цифры заданного или его перевернутой версии при рассмотрении от низшего порядка к высшему (lower).

Программа работает с целочисленными значениями типа `Int` и прекращает работу при неправильных входных переменных. Она должна бросить любую ошибку для остановки программы, например `throw Exception("message")`.

| Входные данные | Выходные данные |
| ------ | ------ |
| lower<br/> 352 | 3 <br/> 35 <br/> 352 |
| higher<br/> -352 | -2 <br/> -25 <br/> -253
| higher<br/> 1000 | 0 <br/> 0 <br/> 0 <br/> 1



### Задание 3. Термометр 
Наиболее комфортная температура для человека варьируется в зависимости от сезона: от 22 до 25°C летом и от 20 до 22°C зимой. Напиши программу, которая, учитывая текущий сезон, определяет и выводит комфортную температуру и разницу с текущей.
- Температурный сенсор работает со шкалой Цельсия. Входные данные представляют собой целочисленные значения.
- Программа может выводить результаты в трех шкалах: Цельсия, Кельвин и Фаренгейт. Входные данные должны быть указаны только в градусах Цельсия.
- Программа не должна завершаться с ошибкой при некорректных данных. Вместо этого она должна вывести сообщение об ошибке и предложить повторно ввести данные. Например - "Incorrect input. Enter a temperature:".
- Дополнительно, программа предлагает регулировать температуру, если она не удовлетворяет комфортным значениям.
- Порядок ввода данных:
  1. шкала измерения температуры, которую будет использовать программа для выходных значений;
  2. время года (S - лето, W - зима);
  3. текущая температура в градусах цельсия.

| Входные данные | Выходные данные |
| ------ | ------ |
| Celsius<br/>  S <br/> 17 <br/>  | The temperature is 17 ˚C <br/> The comfortable temperature is from 22 to 25 ˚C. <br/>Please, make it warmer by 5 degrees.|
| Fahrenheit<br/>  S <br/> 22 <br/>  | The temperature is 71,6 F <br/> The comfortable temperature is from 71,6 to 77 F. <br/>The temperature is comfortable. |




### Задание 4. Слишком мокро
Добавим для предыдущего задания обработку значения влажности. 

Комфортная влажность для человека составляет от 30% до 60% летом и от 30% до 45% зимой. В задаче 4 необходимо добавить параметры комфортной влажности для обоих сезонов. После указания температуры необходимо ввести значение влажности и определить, является ли оно комфортным. Если влажность не удовлетворяет требованиям, то посоветуй уменьшить или увеличить ее на определенный процент.

| Входные данные | Выходные данные |
| ------ | ------ |
| Celsius<br/>  S <br/> 17 <br/> 35 <br/>  | The temperature is 17 ˚C <br/> The comfortable temperature is from 22 to 25 ˚C. <br/>Please, make it warmer by 5 degrees. <br/> The comfortable humidity is from 30% to 60% <br/>The humidity is comfortable|

### Бонусное задание 5. Круги на полях - 2
Расширь функционал 1 задания. Если окружности соприкасаются или пересекаются, выведи координаты точек касания и пересечения.

| Входные данные | Выходные данные |
| ------ | ------ |
| 0.0 <br/>  1.0 <br/> 1.0 <br/> 2.0 <br/> 1.0 <br/> 1.0 <br/> | The circles intersect <br/> [ [1.0, 1.0] ]|

### Бонусное задание 6. Речевой модуль
**Требование!** Не используй готовые решения для преобразования числовых значений в соответствующий ему текст.

В детстве многие, кто любит фантастику и механизмы, мечтали об устройстве, которое могло бы понимать слова, принимать голосовые команды и выполнять соответствующие действия. Теперь голосовое управление стало привычным форматом общения с компьютером, облегчая нашу жизнь и делая это общение более естественным. Нашему умному калькулятору непременно нужен модуль-посредник, переводящий распознанную речь на язык, понятный компьютеру.

Разработать речевой модуль, который считывает целые числа в цифровом формате и переводит их в числа словами.
- Модуль должен принимать числа до миллиона включительно (положительные и отрицательные)
- Модуль получает целое число в цифровом формате и печатает его словами на английском. Это означает, что набор слов, разделенных дефисом, составляет число. Пример: one-hundred-two
- Процесс ввода-вывода числа повторяется до тех пор, пока пользователь не напечатает «exit».
- При запуске, перед вводом, модуль печатает "The program is running. Enter a number or type "exit" to stop:"
- На втором числе и далее, перед вводом, модуль выводит "Enter a number:"
- Каждую 5-ю итерацию, перед вводом, модуль печатает "Enter a number or type "exit" to stop:"
- Если введены неверные данные (слово, символ или неподдерживаемое число), модуль выводит "Incorrect format, try again.\nEnter a number:" или "The number is out of bounds, try again.\nEnter a number:" и ожидает другого ввода

_Пример_
```
The program is running. Enter a number or type "exit" to stop:
yes
Incorrect format, try again

Enter a number:
34
thirty-four

Enter a number:
exit

Bye!
```
