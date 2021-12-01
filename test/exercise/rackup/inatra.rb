module Inatra
  class << self
    def routes(&block)
      @current_methods = {}
      @current_methods.default = proc { |_hash, _key| [404, {}, ['Not Found']] }
      instance_eval(&block)
    end

    %i[get post].each do |method|
      define_method(method) do |my_arg, &blk|
        if blk
          @current_methods[[method, my_arg]] = blk
        else
          @current_methods[[method, my_arg]].call
        end
      end
    end

    def call(env)
      send(env['REQUEST_METHOD'].downcase.to_sym, env['PATH_INFO'])
    end
  end
end
