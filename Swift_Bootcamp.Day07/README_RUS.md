### Привет!

Для разработки мобильных приложений зачастую необходимо использовать сетевой слой.
Рассмотрим [URLSession](https://developer.apple.com/documentation/foundation/urlsession) - библиотеку, 
предоставленную Apple для работы с сетью, а также [Alamofire](https://github.com/Alamofire/Alamofire), которая является сторонней библиотекой для упрощенного взаимодействия с сетью.

## Темы

- HTTP
- URL
- JSONSerialization
- URLSession
- Codable
- Alamofire

## Проект 

### Информация об объектах для IOS

Сегодня тема проекта - список объектов. А конкретно - приложение для получения списка объектов с описанием.

## Задания

**Требование!** Создай workspace внутри папки src с названием day07.
Для каждой задачи внутри workspace необходимо создать macOS/Command Line Tool проект. Например, day07/quest1, day07/quest2.
Также не забудь при создании проекта в пункте `Add to:` выбрать созданный workplace.
Более подробное описание о создании проектов можно прочитать в [документации](https://www.swift.org/getting-started/).

**Требования:** 
1. Используй [API от одного из самых известных международных аэропортов - Схипхол](https://developer.schiphol.nl/). 
2. Опиши модели данных для рейсов и получи данные от сервиса.

 **Подсказки:** 
1. Для получения доступа к API необходимо зарегистрироваться.
2. Описание API находится на вкладке Documentation. 
3. Обрати внимание на обязательные параметры запросов. 
4. Узнать Application ID и Application Key можно на вкладе Applications.
5. Не забывай дожидаться ответ от севера, ведь операция не выполняется мгновенно.

**Требование!** Создай workspace внутри папки src с названием day07, если используе Swift Packet Manager.
При использовании Cocoapods воспользуйся сгенерированным workspace после команды `pod install`
Для каждой задачи внутри workspace необходимо создать macOS/Command Line Tool проект. Например, day07/quest1, day07/quest2.
Также не забудь при создании проекта в пункте `Add to:` выбрать созданный workplace.
Более подробное описание о создании проектов можно прочитать в [документации](https://www.swift.org/getting-started/).

### Задание 0. Создать новый проект в XCode

### Задание 1. Протокол сетевого сервиса

При выполнении задания необходимо:
- Создать dto модели, описывающие структуру объектов полетов с необходимыми, по твоему мнению, полями, получаемых с сервера. Полей у объекта должно быть не менее десяти.
- Разработать протокол сетевого сервиса IObjectService, в котором должны быть:
    - Информация о базовом URL
    - Метод для получения списка объектов с описанием. В качестве параметра метода должна быть функция completion, в которую будет передаваться dto модель, либо nil.

Обязательно нужно разобраться с протоколом [HTTP](https://developer.mozilla.org/ru/docs/Web/HTTP/Overview), понять структуру [URL](https://developer.mozilla.org/ru/docs/Learn/Common_questions/Web_mechanics/What_is_a_URL), а также посмотреть [RESTful API](https://restfulapi.net).


### Задание 2. Реализация протокола сетевого сервиса с использованием URLSession

Необходимо реализовать разработанный протокол IObjectService с использованием URLSession.

- Реализация должна быть в ObjectURLSessionService
- Должен использоваться метод [dataTask](https://developer.apple.com/documentation/foundation/urlsession/1407613-datatask)
- Для десериализации JSON использовать [JSONSerialization](https://developer.apple.com/documentation/foundation/jsonserialization)
- Для dto моделей должен быть реализован дополнительный init для десериализации JSON
- При получении ответа должна вызываться функция completion
- При ошибке в функцию completion должен передаваться nil, а сама ошибка должна выводиться в консоль
- Должен быть вывод полученного ответа в консоль

### Задание 3. Реализация протокола сетевого сервиса с использованием Alamofire

Необходимо реализовать разработанный протокол IObjectService с использованием Alamofire, а также использовать [Codable](https://developer.apple.com/documentation/swift/codable) для сериализации.

- Реализация должна быть в ObjectAlamofireService
- dto модели должны реализовать протокол Decodable
- Для запроса Alamofire должен использоваться метод responseDecodable
- При получении ответа должна вызываться функция completion
- При ошибке в функцию completion должен передаваться nil, а сама ошибка должна выводиться в консоль
- Должен быть вывод полученного ответа в консоль