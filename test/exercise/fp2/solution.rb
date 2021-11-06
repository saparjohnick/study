module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(array = nil, &block)
        array ||= self
        starts_at ||= 0
        return self if array.size == 0

        block.call(array.first)
        starts_at += 1
        my_each(array[starts_at..array.size-1], &block)
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
        starts_at ||= 0
        array ||= self
        return acc if array.size == 0

        acc, *array = array if acc.nil?
        acc = yield(acc, array.first)
        starts_at += 1
        my_reduce(acc, array[starts_at..array.size-1], &block)
      end
    end
  end
end
