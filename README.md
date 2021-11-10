# TestingTaskAlefDev


### Framework для создания UI 
В качестве framework был выбран SwiftUI. Т.к. с его помощью можно наиболее быстро, используя меньшее количество кода 
реализовать тестовое задани. Он предоставляет более удобный механизм работы с alert и списками в сравнении с UIKit.

___

### Архитектура 
В качестве архитектурного паттерна испольвался MVVM. Помимо очевидных плюсов в сравнении с MVC в его пользу еще сыграло, что SwiftUI 
создавался для работы с ним. Я понимаю, что для данного приложения это избыточно и можно было все сделать без него, но я не хотел нарушать принцип 
"View не должна ничего знать о модели" о котором гласит каждый архитектурный паттерн, а для этого нужно было использовать какого-то посредника для передачи данных,
в его роли выступила ViewModel.

___

### Краткое описание приложения

#### Model
В роли модели вытсупает структура Person с двумя полями: Name и Age

#### ViewModel
Используется для хранения данных модели, введенных пользователем. Структура ViewModel подписана под протокол ObservableObject для реализации двусторонней связи
с View и оповещения всех подписчиков о изменениях.

#### Views
ContentView - основная view приложения.
PersonDetails - одна строка для ввода информации о себе\ребенке.
PersonInfo - обьединяет в себе 2 PersonDetails одну с именем, а вторую с возрастом.
ChildInfo - к PersonInfo добавлена кнопка для удаления записи.

#### Modifiers
Т.к. у обоих кнопок схожий стиль и отличается только текст и выполняемые действия был создан кастомный модификатор, что бы не дублировать код
