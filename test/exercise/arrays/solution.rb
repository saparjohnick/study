module Exercise
  module Arrays
    class << self
      def replace(array)
        max_num = array.max
        array.map(&:to_i).map { |num| num > 0 ? num = max_num : num }
      end

      def search(array, query)
        array.map.with_index { |num, index| return index if num == query }
        -1
      end
    end
  end
end
