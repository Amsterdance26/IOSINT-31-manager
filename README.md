# IOSINT-31
 Структура проекта и жизненный цикл приложения
 
IOSUI Navigation Project

Задача 1

Добавьте в ваше приложение новый таргет из шаблона iOS: Framework с названием StorageService.
Перенесите в новый таргет StorageService файл Post.swift. Если структура Post содержится в другом
файле, то создайте новый файл и перенесите Post в него. Исключите этот файл из таргета Navigation.
Добавьте в проект необходимые модификаторы доступа Public и сделайте импорт фреймворка StorageService
там, где это необходимо. Проверьте, что ваш проект успешно компилируется без ошибок.

Задача 2

Создайте дубликат текущей схемы (Scheme) проекта и назовите его Release. Для этой новой схемы в пункте
меню Product > Scheme > Edit scheme установите build configuration как Release. В зависимости от
выбранной схемы ваш проект должен запускаться или в Debug, или в Release конфигурации. Для фона экрана
в ProfileViewController настройте разный цвет фона для Debug и Release конфигурации с помощью
специального флага компиляции DEBUG. Запустите проект в обеих схемах и проверьте, что цвет фона
автоматически меняется в зависимости от выбранной конфигурации.
