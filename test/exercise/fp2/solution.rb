module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        for num in self
          block.call(num)
        end
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        result = MyArray.new
        my_reduce(1) { |_acc, el| result << block.call(el) }
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_reduce(1) do |acc, el|
          result << el unless el.nil?
          acc
        end
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        my_each do |num|
          if acc.nil?
            acc = num
            next
          end
          acc = block.call(acc, num)
        end
        acc
      end
    end
  end
end
