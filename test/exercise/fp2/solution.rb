module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        i = 0
        while i < length
          yield self[i]
          i += 1
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        my_each { |el| result << yield(el) } if block_given?
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_each { |el| result << el unless el.nil? }
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        array = self

        unless acc.present?
          acc = self[0] # first element taken as acc
          array = drop(1) # don't count first element
        end

        array.my_each { |el| acc = yield(acc, el) }
        acc
      end
    end
  end
end
