module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(i = nil, &block)
        i ||= 0
        return self unless i < length

        block.call(self[i])
        my_each(i += 1, &block)
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
      def my_reduce(acc = nil, i = nil, array = nil, &block)
        i ||= 0
        array ||= self
        return acc unless i < array.length

        unless acc.present?
          acc = self[0] # first element taken as acc
          array = drop(1) # don't count first element
        end

        acc = yield(acc, array[i])
        my_reduce(acc, i += 1, array, &block)
      end
    end
  end
end
