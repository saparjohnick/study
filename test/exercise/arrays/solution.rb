module Exercise
  module Arrays
    class << self
      def replace(array)
        max_num = array.sort[-1]
        array.map(&:to_i).map{|num| num > 0 ? num = max_num : num}
      end

      def search(_array, _query)
        _array.map.with_index{|num, index| return index if num == _query}
        return -1
      end
    end
  end
end
