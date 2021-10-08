module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        _array.select{|film| film["country"].present? && film["country"].include?(",")} \
              .map{|film| film["rating_kinopoisk"].to_f \
                    if film["rating_kinopoisk"].to_f > 0} \
              .select(&:present?).instance_eval { reduce(:+) / size }
      end

      def chars_count(_films, _threshold)
        _films.select{|film| film["rating_kinopoisk"].present? \
                      && film["rating_kinopoisk"].to_f > _threshold} \
              .map{|film| film["name"].count("и")}.reduce(:+)
      end
    end
  end
end
