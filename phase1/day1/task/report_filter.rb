class ReportFilter
    include Enumerable

    def initialize(data)
        @data = data
    end

    def each(&block)
        return to_enum(:each) unless block_given?
        @data.each(&block)
    end

    # # if implementing select_by from scratch, using yield
    # def select_by
    #     new_list = []
    #     @data.each do |item|
    #         if yield item
    #             new_list << item
    #         end
    #     end
    #     new_list
    # end

    # Use enumerable select method inside ReportFilter's select_by
    def select_by(&block)
        @data.select(&block)
    end

    def respond_to_missing?(method_name, *args, &block)
        method_name.to_s.start_with?("only_") || super
    end

    def method_missing(method_name, *args)
        if method_name.to_s.start_with?("only_")
            status = method_name.to_s.delete_prefix('only_').to_sym
            select {|item| item[:status] == status}
        else
            super
        end
    end
end

# ####################### Check #######################################

# data = [
#     { name: "Project A", budget: 1000, status: :active },
#     { name: "Project B", budget: 500,  status: :active },
#     { name: "Project C", budget: 2000, status: :archived }
# ]
# my_report = ReportFilter.new(data)
# p my_report.select_by { |item| item[:budget] > 800 }
# #=> [{name: "Project A", budget: 1000, status: :active}, {name: "Project C", budget: 2000, status: :archived}]

# p my_report.only_active
# #=> [{name: "Project A", budget: 1000, status: :active}, {name: "Project B", budget: 500, status: :active}]

# p my_report.only_archived
# #=> [{name: "Project C", budget: 2000, status: :archived}]
