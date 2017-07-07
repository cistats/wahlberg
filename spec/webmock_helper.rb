require 'addressable/template'

module WebmockHelpers
  def stub_some_request
    stub_request(:any, Addressable::Template.new("#{ENV['SOME_URL']}/api/something{?query*}"))
  end
end