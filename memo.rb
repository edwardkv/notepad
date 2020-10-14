# Класс «Заметка», разновидность базового класса «Запись»
class Memo < Post

  def read_from_console
    puts 'Новая заметка (все, что пишите до строчки "end"):'
    line = nil

    until line == 'end'
      # Читаем очередную строку и записываем из ввода пользователя
      line = STDIN.gets.chomp

      @text << line
    end

    # Удалим последний элемент из массива @text — там служебное слово «end»,
    @text.pop
  end

  # Этот метод будет возвращать массив из строк заметки + строка-дата создания
  def to_strings
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n"
    # Возвращаем массив @text с добавление в начало (методом массива unshift)
    # строчки с датой создания заметки.
    @text.unshift(time_string)
  end
end
