# Начало работы с ZPG Core

ZPG Core — модульный проект для Arma 3. Для проверки, сборки и запуска используется HEMTT.

## 1. Что установить

Перед началом работы установите:

- Arma 3 через Steam;
- Git;
- Visual Studio Code;
- HEMTT;
- Arma 3 Tools через Steam — нужны для полной обработки некоторых ресурсов.

Установка HEMTT в PowerShell:

```powershell
winget install hemtt
```

После установки перезапустите VS Code и проверьте инструменты:

```powershell
git --version
hemtt --version
```

Для VS Code рекомендуется официальное расширение **HEMTT Language Server** от `BrettMayson` (`BrettMayson.hemtt`). Оно добавляет подсветку SQF и конфигураций, диагностику и быстрый доступ к последнему RPT-логу.

## 2. Получение проекта

```powershell
git clone https://github.com/LZMZ-std/ZPGCore.git
cd ZPGCore
code .
```

Если проект уже скачан, перед началом работы получите последние изменения:

```powershell
git pull
```

Все команды HEMTT запускаются из корня проекта — из папки, в которой находятся `.hemtt`, `addons`, `README.md` и `LICENSE`.

## 3. Структура проекта

```text
ZPGCore/
├── .hemtt/
│   └── project.toml
├── addons/
│   └── main/
│       ├── $PBOPREFIX$
│       ├── config.cpp
│       └── functions/
│           └── fn_postInit.sqf
├── .gitignore
├── GETTING_STARTED.md
├── LICENSE
└── README.md
```

Назначение основных файлов:

- `.hemtt/project.toml` — имя проекта, префиксы, версия и настройки HEMTT;
- `addons/main/$PBOPREFIX$` — внутренний путь аддона: `z\zpg\addons\main`;
- `addons/main/config.cpp` — регистрация аддона, его зависимостей и функций;
- `addons/main/functions/` — SQF-код проекта;
- `.hemttout/` — автоматически созданные сборки; эта папка не отправляется в Git.

## 4. Проверка и сборка

Быстрая проверка исходников:

```powershell
hemtt check
```

Разработка с поддержкой file patching:

```powershell
hemtt dev
```

Обычная тестовая сборка:

```powershell
hemtt build
```

Результаты появляются в следующих папках:

```text
.hemttout/dev
.hemttout/build
```

Если HEMTT предупреждает об отсутствии перевода строки в конце файла, выполните:

```powershell
hemtt utils fnl
```

## 5. Запуск в Arma 3

Для сборки dev-версии и запуска игры с подключённым ZPG Core выполните:

```powershell
hemtt launch -- -window -noSplash -showScriptErrors
```

После запуска игры:

1. Откройте редактор Eden.
2. Выберите карту VR.
3. Поставьте игрового персонажа.
4. Запустите сценарий.

Тестовый `fn_postInit.sqf` должен показать в игровом чате:

```text
ZPG Core loaded
```

А команда `diag_log` должна добавить в RPT-лог строку:

```text
[ZPG Core] postInit completed
```

В официальном расширении HEMTT последний RPT открывается сочетанием `Ctrl+Alt+R`. Затем используйте `Ctrl+F` и найдите `ZPG Core`.

## 6. Добавление новой функции

Создайте файл, имя которого начинается с `fn_`, например:

```text
addons/main/functions/fn_hello.sqf
```

Пример содержимого:

```sqf
params ["_name"];

systemChat format ["Привет, %1!", _name];
```

Зарегистрируйте функцию внутри `class Main` в `config.cpp`:

```cpp
class hello {};
```

После регистрации функция будет доступна под именем:

```sqf
["игрок"] call ZPG_fnc_hello;
```

После изменения `config.cpp` перезапустите игру, потому что конфигурация аддона загружается при запуске.

## 7. Рабочий порядок

Перед изменениями:

```powershell
git pull
git status
```

После изменений:

```powershell
hemtt check
hemtt build
git status
git add .
git commit -m "Краткое описание изменений"
git push
```

Не добавляйте в Git содержимое `.hemttout`, PBO-файлы и приватные ключи. Они уже исключены через `.gitignore`.

## 8. Частые ошибки

### `.hemtt/project.toml not found`

Команда запущена не из корня проекта или файл отсутствует. Перейдите в папку `ZPGCore` и повторите команду.

### `HEMTT was not able to determine the version`

В `.hemtt/project.toml` должна быть версия:

```toml
[version]
major = 0
minor = 1
patch = 0
```

### `Addon prefix not found`

В каждой папке аддона должен находиться файл `$PBOPREFIX$`. Для `addons/main` его содержимое:

```text
z\zpg\addons\main
```

### `Arma 3 Tools not found`

Установите Arma 3 Tools в Steam и запустите их хотя бы один раз. Простые SQF-аддоны могут собраться и без них, но для дальнейшей разработки инструменты понадобятся.

### Сообщение `ZPG Core loaded` не появилось

