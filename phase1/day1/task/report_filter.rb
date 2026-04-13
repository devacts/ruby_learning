class ReportFilter
    include Enumerable

    def initialize(data)
        @data = data
    end

    def each
        puts "what the hell, yo?"
    end
end

# ReportFilter.new.each
