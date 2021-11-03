module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        films = array.select do |film|
          film['country'].present? \
          && film['country'].include?(',') \
          && film['rating_kinopoisk'].to_f.positive?
        end
        rating_sum = films.map { |film| film['rating_kinopoisk'].to_f }
                          .reduce(&:+)
        rating = rating_sum / films.size
      end

      def chars_count(films, threshold)
        films = films.select do |film|
          film['rating_kinopoisk'].present? \
          && film['rating_kinopoisk'].to_f > threshold
        end
        chars_sum = films.map { |film| film['name'].count('и') }.reduce(:+)
      end
    end
  end
end
