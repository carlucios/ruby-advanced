class HtmlBuilder
    def initialize(&block)
        @html = ""
        instance_eval(&block) if block_given?
    end

    def div(*content, &block)
        if block_given?
            @html << "<div>"
            instance_eval(&block) 
            @html << "</div>"
        else
            @html << "<div>#{content}</div>\n"
        end
    end

    def span(content)
        @html << "<span>#{content}</span>\n"
    end

    def result
        @html
    end
end