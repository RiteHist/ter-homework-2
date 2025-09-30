# ter-homework-2

## Задание 1

### Пункт 4

В строке `platform_id = "standart-v4"` неверно указана платформа. Если взглянуть на документацию yandex по списку доступных платформ (https://yandex.cloud/ru/docs/compute/concepts/vm-platforms), то можно увидеть, что такой платформы в списке нет и наиболее похожая доступна `standard-v4a`.

В блоке `resources` внутри `resource "yandex_compute_instance" "platform"` указана недопустимая конфигурация ресурсов для выбранной платформы `standard-v4a`. На скриншоте ниже можно видеть, что значение `core_fraction` должно быть 20, 50 или 100, а значение `cores` должно быть 2 или 4:

![alt text](https://github.com/RiteHist/ter-homework-2/blob/main/media/1.PNG?raw=true)

В блоке `metadata` неверно происходит обращение к переменной `vms_ssh_root_key`, необходимо использовать функцию file(), т.к. иначе просто записывается строковое значение переменной, а не содержимое нужного файла.

### Пункт 5

Созданная VM в yandex cloud:

![alt text](https://github.com/RiteHist/ter-homework-2/blob/main/media/2.PNG?raw=true)

Подключение к VM по ssh и результат `curl ifconfig.me`:

![alt text](https://github.com/RiteHist/ter-homework-2/blob/main/media/3.PNG?raw=true)

### Пункт 6

`preemptible = true` делает VM прерываемой, что значительно сокращает её стоимость. `core_fraction = 5` задает VM гарантированную долю vCPU в 5%, что также уменьшает стоимость VM, но стоит учитывать, что доля vCPU в 5% доступна не для всех платформ.

## Задание 2

[Файл variables.tf](https://github.com/RiteHist/ter-homework-2/blob/main/src/variables.tf)

Результат выполнения `terraform plan` после замены хардкодовых значений на переменные:

![alt text](https://github.com/RiteHist/ter-homework-2/blob/main/media/4.PNG?raw=true)

## Задание 3

[Файл vms_platform.tf](https://github.com/RiteHist/ter-homework-2/blob/main/src/vms_platform.tf)

Созданная VM в yandex cloud:

![alt text](https://github.com/RiteHist/ter-homework-2/blob/main/media/5.PNG?raw=true)

## Задание 4

[Файл outputs.tf](https://github.com/RiteHist/ter-homework-2/blob/main/src/outputs.tf)

Результат выполнения `terraform output`:

![alt text](https://github.com/RiteHist/ter-homework-2/blob/main/media/6.PNG?raw=true)

## Задание 5

[Файл locals.tf](https://github.com/RiteHist/ter-homework-2/blob/main/src/locals.tf)

## Задание 6

Результат `terraform output` после изменения переменных:

![alt text](https://github.com/RiteHist/ter-homework-2/blob/main/media/7.PNG?raw=true)