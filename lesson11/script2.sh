#!/bin/bash

#************************************************# 
#                  script2.sh                    # 
#             автор: Rusakov Dmitrii             # 
#                Октябрь 22, 2025                # 
#                                                # 
#          Сканирование дериктории и             #
#           изменение файлов в ней.              # 
#************************************************#

# Указываем рабочую директорию
WORK_DIR="$HOME/myfolder"

# Проверяем, существует ли директория. Ести нет, завершаем работу, если есть, то переходим
if [ ! -d "$WORK_DIR" ]; then
  echo "Stop working: Not found $WORK_DIR ."
  exit 1
else
  cd "$WORK_DIR"

  # Cчитаем и выводим количество файлов в текущей директории
  FILE_COUNT_IN_WORK_DIR=$(find . -maxdepth 1 -type f | wc -l)
  echo "Count file in folder: $FILE_COUNT_IN_WORK_DIR"

  # Запускаем цикл, который перебирает все файлы и папки в текущей директории 
  for file in *; do

    # Оператор [ ! -s "$file" ] вернет true, если размер файла равен нулю. Затеи файл удаляется
	if [ ! -s "$file" ]; then
	rm "$file"
	echo "  -> Delete file"
	continue  # Переходим к следующему файлу, так как данный файл удалён
	fi

	# С помощью 'stat' получаем права в формате "777" и исправляем их на "664"
	if [ "$(stat -c %a "$file")" = "777" ]; then
	chmod 664 "$file"
	echo "  -> Change chmod to 664"
	fi


	# Оставляем только первую строку в файле
	sed -i '1!d' "$file"
	echo "  -> Delete second string"
  done

fi