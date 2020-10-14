# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Подключаем класс Post и его детей: Memo, Link, Task
require_relative 'post'
require_relative 'memo'
require_relative 'link'
require_relative 'task'

# Поздороваемся с пользователем и просим у него, что он хочет создать.

puts 'Привет, я твой блокнот!'
puts
puts 'Что хотите записать в блокнот?'

# Запишем в переменную choices массив типов записей, которые можно создать,
# вызвав у класса Post метод post_types (статический метод).
choices = Post.post_types

# Для начала цикла запишем в переменную choice (куда позже будем складывать
# выбор пользователя) значение -1.
choice = -1

# Пока юзер не выбрал правильно (от 0 до длины массива вариантов), спрашиваем
# у него число и выводим список возможных вариантов для записи.
until choice >= 0 && choice < choices.size
  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end

  choice = gets.to_i
end

entry = Post.create(choice)

entry.read_from_console

entry.save

puts 'Ваша запись сохранена!'
