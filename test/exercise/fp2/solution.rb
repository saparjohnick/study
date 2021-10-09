module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        i = 0
        while i < self.length
          yield self[i]
          i+= 1
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        if block_given?
          self.my_each {|el| result << yield(el)}
        end
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        self.my_each{|el| result << el unless el.nil?}
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc=nil, &block)
        _array = self
        
        unless acc.present?
          acc = self[0] # first element taken as acc
          _array = self.drop(1) # don't count first element
        end

        _array.my_each {|el| acc = yield(acc, el)}
        acc
      end
    end
  end
end
