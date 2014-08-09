## Установка
``` bash
cd /tmp
git clone https://github.com/studiofact/git-sandbox.git
cd git-sandbox
sudo make install

# Одной командой
(cd /tmp && git clone https://github.com/studiofact/git-sandbox.git && cd git-sandbox && sudo make install)
```

## Структура проектов

``` code
/home

  /dev # Каталог с проектами
    /project1
    /project2

  /user1
    /www # Песочницы для пользователя user1
      /project1
        /httpdocs
      /project2
        /httpdocs

  /user2
    /www # Песочницы для пользователя user2
      /project1
        /httpdocs
      /project2
        /httpdocs
```

## Наименование виртуальных хостов

- Проект `http://project.host.domain`
- Песочницы `http://user.project.host.domain`