module Exercise
  module Arrays
    class << self
      def replace(array)
        max_num = array.max
        array.map { |num| num > 0 ? num = max_num : num }
      end

      def search(array, query, start_index = nil, end_index = nil)
        start_index ||= 0
        end_index ||= array.length - 1

        return -1 if start_index > end_index

        middle_index = (start_index + end_index) / 2
        case query <=> array[middle_index]
        when 0
          middle_index
        when -1
          max_index = middle_index - 1
          search(array, query, start_index, middle_index - 1)
        when 1
          min_index = middle_index + 1
          search(array, query, middle_index + 1, end_index)
        else
          -1
        end
      end
    end
  end
end
