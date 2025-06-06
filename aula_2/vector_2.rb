require_relative './vector_2'

class Vector2
    attr_reader :x, :y

    def initialize(x, y)
        @x = x
        @y = y
    end

    def *(n)
        if n.is_a?(Vector2)
            x * n.x + y * n.y
        elsif n.is_a?(Numeric)
            Vector2.new(x * n, y * n).to_s
        end
    end

    def coerce(n)
        [self, n]
    end

    def to_s
        "(#{x}, #{y})"
    end
end