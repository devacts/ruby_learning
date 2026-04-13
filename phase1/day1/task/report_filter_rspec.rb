# report_filter_spec.rb
require 'rspec'
require_relative 'report_filter' # You will create this file

RSpec.describe ReportFilter do
  let(:data) { [
    { name: "Project A", budget: 1000, status: :active },
    { name: "Project B", budget: 500,  status: :archived },
    { name: "Project C", budget: 2000, status: :active }
  ] }

  subject { ReportFilter.new(data) }

  it "is Enumerable" do
    puts "running is Enumerable"
    expect(subject).to be_kind_of(Enumerable)
    expect(subject).to respond_to(:map)
  end

  # it "filters data based on a block criteria" do
  #   # Only projects with budget > 800
  #   result = subject.select_by { |item| item[:budget] > 800 }
  #   expect(result.map { |i| i[:name] }).to eq(["Project A", "Project C"])
  # end

  # it "allows chaining or summing (testing Enumerable integration)" do
  #   total_budget = subject.sum { |item| item[:budget] }
  #   expect(total_budget).to eq(3500)
  # end

  # it "supports a custom 'status_check' method via method_missing" do
  #   # Staff level: Dynamically handle filters like .only_active or .only_archived
  #   # based on the :status key in the hash
  #   active_projects = subject.only_active
  #   expect(active_projects.count).to eq(2)
  #   expect(active_projects.first[:name]).to eq("Project A")
  # end
end
