module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        rating_query(array).map { |film| film['rating_kinopoisk'].to_f }
                           .instance_eval { reduce(:+) / size }
      end

      def rating_query(array)
        array.select do |film|
          film['country'].present? \
          && film['country'].include?(',') \
          && film['rating_kinopoisk'].to_f.positive?
        end
      end

      def chars_count(films, threshold)
        chars_count_query(films, threshold)
          .map { |film| film['name'].count('и') }.reduce(:+)
      end

      def chars_count_query(films, threshold)
        films.select do |film|
          film['rating_kinopoisk'].present? \
          && film['rating_kinopoisk'].to_f > threshold
        end
      end
    end
  end
end
