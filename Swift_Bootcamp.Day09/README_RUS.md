### Привет!

Тесты - залог качества кода и улучшение процесса разработки. 
Поэтому сегодняшняя тема - Unit-тестирование для iOS.

# Темы:
- Unit-тестирование
- XcTest


**Совет!** Продолжай читать официальную документацию и статьи о преимуществах Swift.
[Документация Swift](https://developer.apple.com/documentation/xctest)

## Задания

**Требование!** Создай workspace внутри папки src с названием day09, если используе Swift Packet Manager.
При использовании Cocoapods применяй сгенерированный workspace после команды `pod install`
Для каждой задачи внутри workspace необходимо создать macOS/Command Line Tool проект. Например, day09/quest1, day09/quest2.
Также не забудь при создании проекта в пункте `Add to:` выбрать созданный workplace.
Более подробное описание о создании проектов можно прочитать в [документации](https://www.swift.org/getting-started/).


### Задание 1. Unit-тесты

Необходимо покрыть Unit-тестами класс ***SimpleCalculator***, который находится в файле `SimpleCalculator.swift`.

- Скопируй ***SimpleCalculator*** к себе в проект
- Создай новый **Target**, выбери **Unit Testing Bundle**, в **Product Name** впиши ***SimpleCalculatorTests***
- Все тесты необходимо реализовать в ***SimpleCalculatorTests***
- Для метода ***circleArea***(вычисление площади круга) написать тест с использованием XCTAssertEqual
- Для метода ***fibonacci***(нахождение n-го числа Фибоначчи) покрыть тестами все возможные случаи с использованием XCTAssertEqual
- Для метода ***fahrenheit***(конвертация градусов Цельсия в градусы Фаренгейта) написать тест с использованием XCTAssertEqual
- Для метода ***isEven***(проверка четности числа) покрыть тестами все возможные случаи с использованием XCTAssertTrue, XCTAssertFalse
- Для метода ***getAvg***(нахождение среднего значения) покрыть тестами все возможные случаи с использованием XCTAssertNil, XCTAssertNotNil, XCTAssertEqual

### Задание 2. Исправление ошибок

По результатам тестов найти и исправить ошибки в скопированном ***SimpleCalculator***



