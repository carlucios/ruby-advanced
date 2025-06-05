class Settings
    def initialize
        @settings = {}
        @readonly_methods = []
    end

    def add(key, value, **kwargs)
        @settings[key] = value

        define_singleton_method(key) do
            @settings[key]
        end

        if kwargs[:alias]
            define_singleton_method(kwargs[:alias]) do
                @settings[key]
            end

            @readonly_methods << kwargs[:alias] if kwargs[:readonly]
        end

        @readonly_methods << key if kwargs[:readonly]
    end

    def method_missing(method_name, *args, &block)
        if @settings.key?(method_name)
          @settings[method_name]
        elsif @settings.key?(method_name.to_s.chomp("=").to_sym)
            if @readonly_methods.include?(method_name.to_s.chomp("=").to_sym)
                puts "Erro: configuração '#{method_name.to_s.chomp("=").to_sym}' é somente leitura"
            elsif @settings.key?(method_name.to_s.chomp("=").to_sym)
                @settings[method_name.to_s.chomp("=").to_sym] = args.first
            else
                super
            end
        else
          "Configuração '#{method_name}' não existe."
        end
    end
    
    def respond_to_missing?(method_name, include_private = false)
        key = method_name.to_s.chomp("=").to_sym
        @settings.key?(key) || super
    end
    
    def all
        output = "{ "
        @settings.each do |k, v|
            output += "#{k}: #{v}, "
        end
        
        output = output.reverse.sub(', '.reverse, ' }'.reverse).reverse
        puts output
    end
end