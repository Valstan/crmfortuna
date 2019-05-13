#!/bin/bash
# ***************************
# ***   Uley Script 1.3   ***
# *** by Savinih Valentin ***
# ***************************
# Резервный список программ, которые надо не надо ли
# krusader dolphin kde-l10n-ru chromium-browser chromium-browser-l10n
#
# Заполнение неявных переменных
U6432=2
REPA=2
VMWARE=2
# Определяем архитектуру операционной системы
UARCH=$(arch)
# Опрос пользователя и заполнение переменных скрипта
if (whiptail --title "ULEY SCRIPT 1.3" --yes-button "Да, я согласен. Начнём!" --no-button "НЕ, жутковато шота..." --yesno "Здравия желаю!

Перед Вами творение Валентина Савиных, универсальный скрипт Улей версии 1.3. облегчающий ежедневную установку одних и тех же программ на систему Линукс.
Скрипт все время изменяется, так что если нашли какие-то неудобства, сразу пишите мне в комментариях под новостью о скрипте, я постараюсь быстро все исправить, добавить.
Ну и конечно данную программу Вы используете на свой страх и риск, я не даю никаких гарантий на сохранность Ваших данных. Если Вы согласны, жмите кнопку -ДА-" 20 70)
then
echo ""
else
exit
fi
UOS=$(whiptail --title "ВЕРСИЯ ОС" --menu "Укажите версию операционной системы, на которой Вы запустили этот скрипт. Если у Вас совершенно другая версия ОС, то скорей всего скрипт работать не будет." 10 40 4 \
"1" "Дебиан 8 Debian 8" \
"2" "Линукс Минт Linux Mint 18, 18.1" \
"3" "Убунту Ubuntu 16.04, 16.10" \
"0" "Выйти из установки" 3>&1 1>&2 2>&3)
if [ $UOS = 0 ]
then
exit
else
echo ""
fi
if [ $UOS = 1 ]
	then
	U6432=$(whiptail --title "МУЛЬТИАРЧ" --menu "У Вас 64-битная операционная система. Установить мультиарч (поддержка 32 битных библиотек в 64 битном Дебиане) ? Это нужно например чтобы установить TeamViewer, а он только в 32 битном исполнении." 15 50 3 \
"1" "ДА, хочу мультиарч" \
"2" "НЕТ, уже есть или ненужно" \
"0" "Выйти из установки" 3>&1 1>&2 2>&3)
		if [ $U6432 = 0 ]
		then
		exit
		else
		echo ""
		fi
	REPA=$(whiptail --title "РЕПОЗИТОРИИ DEBIAN" --menu "Расширить стандартные репозитории Debian? Обычно по-умолчанию используется только секция main, мы можем добавить секции non-free и contrib, это практически не нарушит стабильности Вашей системы, но добавит много возможностей" 16 50 3 \
"1" "ДА, конечно, как без них" \
"2" "НЕТ, уже добавляли" \
"0" "Выйти из установки" 3>&1 1>&2 2>&3)
		if [ $REPA = 0 ]
		then
		exit
		else
		echo ""
		fi
	MEDIA=$(whiptail --title "МУЛЬТИМЕДИА КОДЕКИ" --menu "Установим мультимедиа-кодеки?" 12 40 3 \
"1" "ДА, надо бы" \
"2" "НЕТ, уже установлены" \
"0" "Выйти из установки" 3>&1 1>&2 2>&3)
		if [ $MEDIA = 0 ]
		then
		exit
		else
		echo ""
		fi
	DE=$(whiptail --title "ГРАФИЧЕСКАЯ ОБОЛОЧКА" --menu "Выберите графическое окружение:" 14 40 5 \
"openbox" "доктор прописал" \
"lxqt" "обычное" \
"icewm" "для админа" \
"-" "НЕТ, уже установлен" \
"0" "Выйти из установки" 3>&1 1>&2 2>&3)
		if [ $DE = 0 ]
		then
		exit
		else
		echo ""
		fi
	PANEL=$(whiptail --title "XFCE4 ПАНЕЛЬ" --menu "Установить панель XFCE4 с прибамбусиками?
Если в предыдущем шаге Вы выбрали LXQT, то панелька там уже есть, нажмите НЕТ.
Если панель Вам вообще не нужна или Вы установите свою панель, нажмите НЕТ." 15 60 3 \
"-" "НЕТ у меня есть своя" \
"1" "ДА установить панельку" \
"0" "Выйти из установки" 3>&1 1>&2 2>&3)
		if [ $PANEL = 0 ]
		then
		exit
		else
		echo ""
		fi
	else
	echo ""
fi
# -------------------------
if [ $UARCH = x86_64 ]
then
	CHROME=$(whiptail --title "GOOGLE CHROME" --menu "Установить браузер Google Chrome?" 12 40 3 \
"1" "ДА, установить Хром" \
"2" "НЕТ, уже есть или ненужно" \
"0" "Выйти из установки" 3>&1 1>&2 2>&3)
	if [ $CHROME = 0 ]
	then
	exit
	else
	echo ""
	fi
	VMWARE=$(whiptail --title "УСТАНОВКА ВИРТУАЛЬНОЙ МАШИНЫ" --menu "Установить скачанную VMware?
ВНИМАНИЕ! ОСТОРОЖНО!
Условия запуска этого скрипта:
1. Пакет VMware должен лежать в папке prog рядом с скриптом
2. Запуск установки VMware возможен только из под Иксов" 15 70 3 \
"2" "НЕТ, иксы еще не установлены" \
"1" "ДА, установить VMware" \
"0" "Выйти из установки" 3>&1 1>&2 2>&3)
	if [ $VMWARE = 0 ]
	then
	exit
	else
	echo ""
	fi
else
echo ""
fi
PAKET=$(whiptail --title "НАБОРЫ ПАКЕТОВ ПРОГРАММ" --menu "Выберите вариант набора пакетов программ:" 15 50 6 \
"standart" "для клиентов и дома" \
"video" "монтаж видео и звука" \
"games" "еще игры" \
"min" "индивидуальная мелочь" \
"-" "НЕТ, в другой раз" \
"0" "Выйти из установки" 3>&1 1>&2 2>&3)
if [ $PAKET = 0 ]
then
exit
else
echo ""
fi
VK=$(whiptail --title "ПЛАГИН VK В PIDGIN" --menu "Установим плагин VK в Pidgin ?" 13 50 3 \
"1" "ДА, установить" \
"-" "НЕТ ненадо... у меня и пиджина-то нету..." \
"0" "Выйти из установки" 3>&1 1>&2 2>&3)
if [ $VK = 0 ]
then
exit
else
echo ""
fi
DEBB=$(whiptail --title "СКАЧАННЫЕ DEB ПАКЕТЫ" --menu "Установить скачанные DEB пакеты?
ВНИМАНИЕ! ОСТОРОЖНО!
Условия запуска этого скрипта:
1. Все пакеты должны лежать в папке prog рядом с скриптом
2. Убедитесь что все пакеты подходят для Вашей архитектуры (64 или 32 бита)
иначе могут быть битые held-пакеты
или даже уничтожение установленных пакетов Вашей ОС" 15 80 3 \
"2" "ОЙ нет, я боюся..." \
"1" "ДА, установить всё" \
"0" "Выйти из установки" 3>&1 1>&2 2>&3)
if [ $DEBB = 0 ]
then
exit
else
echo ""
fi
# ---------------------
ACESTREAM=$(whiptail --title "ACE STREAM ТОРРЕНТ-ТВ" --menu "Установить ТоррентТВ AceStream для просмотра тв-каналов, спортивных трансляций и фильмов с торрентов?
ВНИМАНИЕ! ОСТОРОЖНО!
Условия запуска этого скрипта:
1. Установка протестирована только на Минте и Убунте
2. На чистом Дебиане это не сработает точно" 17 70 3 \
"2" "НЕТ, мне это не нужно" \
"1" "ДА, установить ТоррентТВ" \
"0" "Выйти из установки" 3>&1 1>&2 2>&3)
if [ $ACESTREAM = 0 ]
then
exit
else
echo ""
fi
if (whiptail --title "СТАРТ УСТАНОВКИ" --yes-button "ДА! Начать установку" --no-button "НЕТ, с начала" --yesno "Компоненты для установки выбраны! Если все правильно, начинаем установку?" 10 60)
then
echo "ПОЕХАЛИ!!!"
else
# Перезапускаем скрипт с начала, а текущую сессию закрываем
sh $0
exit
fi
#
# Установка выбранных компонентов
#
# Если выбрана 64 битная архитектура ОС, то подключаем мультиарч
# тоесть поддержку установки и работы 32-битных приложений
if [ $U6432 = 1 ]
	then
# Подключаем архитектуру i386
	dpkg --add-architecture i386
	else
	echo ""
fi
#
# Google Chrome
#
if [ $CHROME = 1 ]
	then
# Добавляем репу Google Chrome
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
# Подписываем репу Google
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
apt update -y --force-yes
# Устанавливаем Google Chrome
apt install -y --force-yes google-chrome-stable
	else
	echo ""
fi
#
# Добавляем репы
#
if [ $REPA = 1 ]
then
echo "deb http://mirror.yandex.ru/debian/ jessie main contrib non-free
deb-src http://mirror.yandex.ru/debian/ jessie main contrib non-free
deb http://security.debian.org/ jessie/updates main contrib non-free
deb-src http://security.debian.org/ jessie/updates main contrib non-free
deb http://mirror.yandex.ru/debian/ jessie-updates main contrib non-free
deb-src http://mirror.yandex.ru/debian/ jessie-updates main contrib non-free" > /etc/apt/sources.list
apt update -y --force-yes
apt full-upgrade -y --force-yes
else
echo ""
fi
#
# Ставим Мультимедиа кодеки
#
if [ $MEDIA = 1 ]
then
echo "deb http://www.deb-multimedia.org jessie main non-free
deb http://www.deb-multimedia.org jessie-backports main" > /etc/apt/sources.list.d/media.list
apt update -y --force-yes
apt install -y --force-yes deb-multimedia-keyring
apt update -y --force-yes
apt full-upgrade -y --force-yes
else
echo ""
fi
#
# Ставим Иксы
#
if [ $DE = lxqt ]
then
echo "deb http://packages.siduction.org/lxqt jessie-backports main
deb-src http://packages.siduction.org/lxqt jessie-backports main" > /etc/apt/sources.list.d/lxqt.list
apt-key adv --keyserver pgpkeys.mit.edu --recv-key 15CBD88045C45076
apt update -y --force-yes
apt install -y --force-yes xorg lxqt connman cmst firmware-linux-free firmware-linux-nonfree gnome-mplayer gecko-mediaplayer lightdm konsole firefox-esr firefox-esr-l10n-ru chromium chromium-l10n print-manager mousepad
else
echo ""
fi
if [ $DE = icewm ]
then
apt install -y --force-yes xorg icewm firmware-linux-free firmware-linux-nonfree gnome-mplayer gecko-mediaplayer lightdm konsole firefox-esr firefox-esr-l10n-ru chromium chromium-l10n print-manager mousepad
else
echo ""
fi
if [ $DE = openbox ]
then
apt install -y --force-yes xorg openbox firmware-linux-free firmware-linux-nonfree gnome-mplayer gecko-mediaplayer lightdm konsole firefox-esr firefox-esr-l10n-ru chromium chromium-l10n print-manager mousepad
else
echo ""
fi
#
# Ставим проги
#
if [ $PANEL = 1 ]
then
# Устанавливаем XFCE4 панельку с прибамбусиками
apt install -y --force-yes xfce4-panel xfce4-goodies libxfce4ui-utils xfce4-power-manager xfce4-battery-plugin xfce4-cellmodem-plugin xfce4-datetime-plugin xfce4-power-manager xfce4-power-manager-plugins xfce4-xkb-plugin xfce4-mixer
else
echo ""
fi
if [ $PAKET = standart ]
then
# Создаем список пакетов для установки
STANDART="sudo gthumb make synaptic cheese shutter soundconverter cups samba pidgin pidgin-mra pidgin-libnotify pidgin-plugin-pack pidgin-themes zenmap qbittorrent mpv audacious wireless-tools gnome-mahjongg aisleriot gnome-mines gnome-sudoku lbreakout2 dreamchess gweled snake4 billard-gl"
# Устанавливаем все пакеты из списка
apt install -y --force-yes $STANDART
else
echo ""
fi
if [ $PAKET = video ]
then
# Создаем список пакетов для установки
VIDEO="openshot blender inkscape frei0r-plugins audacity"
# Устанавливаем все пакеты из списка
apt install -y --force-yes $VIDEO
else
echo ""
fi
if [ $PAKET = games ]
then
# Создаем список пакетов для установки
GAMES="libgl1-nvidia-glx:i386 libgl1-fglrx-glx:i386 warzone2100 warzone2100-music widelands micropolis bzflag hedgewars playonlinux steam"
# Устанавливаем все пакеты из списка
apt install -y --force-yes $GAMES
else
echo ""
fi
if [ $PAKET = min ]
then
# Добавляем репу Webmin
echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list
# Подписываем репу Webmin
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc
apt update -y --force-yes
# Создаем список пакетов для установки
ADMIN="webmin links gthumb lshw make synaptic luckybackup keepass2 cups samba zenmap qbittorrent mpv audacious screen filezilla"
# Устанавливаем все пакеты из списка
apt install -y --force-yes $ADMIN
else
echo ""
fi
if [ $VK = 1 ]
then
# Добавляем VK в Pidgin
	if [ $UARCH = x86_64 ]
	then
		cp -f x86_64/*.so /usr/lib/purple-2
		cp -f x86_64/*.so /usr/lib/pidgin
		cp -r protocols /usr/share/pixmaps/pidgin
	else
		cp -f i386/*.so /usr/lib/purple-2
		cp -f i386/*.so /usr/lib/pidgin
		cp -r protocols /usr/share/pixmaps/pidgin
	fi
else
echo ""
fi
if [ $DEBB = 1 ]
then
dpkg -i ./prog/*.deb
apt install -y --force-yes -f
else
echo ""
fi
if [ $VMWARE = 1 ]
then
sh ./prog/*.bundle
else
echo ""
fi
# ACESTREAM
if [ $ACESTREAM = 1 ]
then
	if [ $UARCH = x86_64 ]
	then
		dpkg -i prog/acestream64/*.deb
	else
		dpkg -i prog/acestream86/*.deb
	fi
		apt install -y --force-yes -f
		sh -c 'echo "deb http://repo.acestream.org/ubuntu/ trusty main" > /etc/apt/sources.list.d/acestream.list'
		wget -O - http://repo.acestream.org/keys/acestream.public.key | apt-key add -
		apt update -y --force-yes
		apt install -y --force-yes acestream-full
else
echo ""
fi
#
if (whiptail --title "Завершение установки" --yes-button "Установить еще" --no-button "Выйти" --yesno "Или всё, или еще что-нибудь установить?" 10 60)
then
# Перезапускаем скрипт с начала, а текущую сессию закрываем
sh $0
exit
else
echo "ПОКА !!!"
fi
exit
