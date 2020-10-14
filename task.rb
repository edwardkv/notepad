# Подключим встроенный в руби класс Date для работы с датами
require 'date'

# Класс «Задача», разновидность базового класса «Запись»
class Task < Post
  # Конструктор у класса «Задача» свой, но использует конструктор родителя.
  def initialize
    # Вызываем конструктор родителя
    super

    # Создаем специфичную для ссылки переменную экземпляра @due_date — время, к
    # которому задачу нужно выполнить
    @due_date = Time.now
  end

    def read_from_console
    puts 'Что надо сделать?'
    @text = STDIN.gets.chomp

    puts 'К какому числу? Укажите дату в формате ДД.ММ.ГГГГ, ' \
      'например 12.05.2020'
    input = STDIN.gets.chomp

    @due_date = Date.parse(input)
  end

  # Этот метод будет возвращать массив из трех строк: дедлайн задачи, описание
  # и дата создания
  def to_strings
    deadline = "Крайний срок: #{@due_date.strftime('%Y.%m.%d')}"
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')} \n"

    [deadline, @text, time_string]
  end
end
