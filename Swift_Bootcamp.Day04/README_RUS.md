### Привет!


Сегодня рассмотрим еще один язык программирования, который связан с продуктами Apple - ObjectiveC.
Данный язык был основным инструментом разработчиков до появления Swift.
Конечно, язык Swift имеет массу преимуществ по сравнению с ObjectiveC:
- Swift более читаемый
- Swift безопаснее
- Swift быстрее.
ObjectiveC используют для приложений, требующих обратной совместимости. Так, например,
фреймфорк SwiftUI поддерживается только с iOS 13. В то же время, ObjectiveC подходит для разработки приложений независимо от версии
платформы.

В данном проекте рассматриваются следующие темы:
- ObjectiveC и построение объектов с его помощью
- Использование ObjectiveC в Swift
- Использование Swift в ObjectiveC

## Темы:
- ObjectiveC
- ObjectiveC в Swift
- Swift в ObjectiveC

**Совет!** Во время выполнения задания внимательно смотри документацию Swift и ObjectiveC.
Примеры взаимодействия между разными API в [документации](https://developer.apple.com/documentation/swift/importing-objective-c-into-swift).
Отдельная документация по ObjectiveC представлена [здесь](https://developer.apple.com/documentation/objectivec).

### Проект: Кофейня

## Задания:

**Требование!** Создай workspace внутри папки src с названием day04.
Для каждой задачи внутри workspace необходимо создать macOS/Command Line Tool проект. Например, day04/quest1, day04/quest2.
Также не забудь при создании проекта в пункте `Add to:` выбрать созданный workplace.
Более подробное описание о создании проектов можно прочитать в [документации](https://www.swift.org/getting-started/).

### Задание 1. Кофейня
Создай проект с основным языком ObjectiveC.

**Совет!** Для начала работы со Swift и ObjectiveC изучи соответствующий пример.

Необходимо реализовать классы `Barista` и `Coffee` с обязательной следующей структурой:

**Кофе:**
- Название
- Цена

**Бариста:**
- Имя
- Фамилия
- Стаж работы
- Метод `brew()`, который описывает приготовление кофе c входным параметром класса `Coffee`.
При вызове функции должно выводится «Processing brewing coffee...»


Основной сценарий работы программы:
1. Программа предлагает на выбор меню из 3 различных видов кофе.
2. Пользователь выбирает кофе по номеру через консольный ввод.
3. Бариста готовит этот кофе.
4. Программа выводит «Your {$name} is ready!»
5. При вводе некорректных данных программа выводит «Try again!» и ожидает новой попытки ввода.

_Пример:_
```
Choose coffee in menu:
1. Сappuccino 2$
2. Americano 1,5$
3. Latte 2,3$

1

Proccesing brewing coffee...
Your Сappuccino is ready!
```  

### Задание 2. Сделай мне черный кофе, машина
По итогу задания 1 ты реализовал консольного бариста на языке ObjectiveC.
Это задание выполняется на языке Swift.

На языке Swift необходимо реализовать класс `BaristaMachine`.
Требования к классу `BaristaMachine`:

**Бариста-машина:**
- Объект, написанный на Swift
- Для поддержки класса `Barista` следует выделить общий протокол `IBarista`
- Содержит название модели кофемашины
- Варит кофе при помощи метода `brew()`
- Содержит время приготовления кофе объемом 300мл
- Во время процесса варки на экран выводится время ожидания приготовления (можно сделать постоянным)
Например, `"Coffee is brewing. 1 minute - time left"`.
- Получает на вход объект кофе, который был описан в предыдущем задании при помощи ObjectiveC.


**Совет!** изучи в Xcode, как компилятор генерирует файлы ObjectiveC в Swift.
Сделать это можно, после того как ты сделал `Build`, во вкладке меню у открытого файла, выбрав `Generated Interfaces`.


Основной сценарий работы программы:
1. Программа предлагает на выбор бариста - человека или кофемашину (меню по номеру).
2. При выборе кофемашины, должна быть применена скидка 10% на все меню.
3. Программа предлагает на выбор меню из 3 различных видов кофе.
4. Пользователь выбирает кофе по номеру через консольный ввод.
5. Выбранный бариста готовит этот кофе.
6. Программа выводит «Coffee is ready!».
7. В случае ввода некорректных данных программа выводит «Try again!» и предлагает повторить попытку ввода.

_Пример:_
```
Choose barista:
1. Man
2. Machine

2

Choose coffee in menu:
1. Сappuccino 1,8$
2. Americano 1,35$
3. Latte 2,07$

1

Coffee is brewing. One minute - time left
Coffee is ready!
```
