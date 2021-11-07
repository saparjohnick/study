module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(array = nil, &block)
        array ||= self
        return self if array.size == 0
        
        first_el, *new_array = array
        block.call(first_el)
        my_each(new_array, &block)
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
      def my_reduce(acc = nil, array = nil, &block)
        array ||= self
        return acc if array.size == 0

        acc, *array = array if acc.nil?
        acc = yield(acc, array.first)
        first_el, *new_array = array
        my_reduce(acc, new_array, &block)
      end
    end
  end
end
