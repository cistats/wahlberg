RSpec.configure do |config|
  config.disable_monkey_patching!

  config.order = :random
  Kernel.srand config.seed

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end


RSpec::Matchers.define :intersect_with do |challenge_range|
  # Check to see if any elements exist in the intersection
  match do |current_range|
    [current_range.to_a & challenge_range.to_a].flatten.any?
  end

  failure_message do |current_range|
    "#{current_range.inspect} doesn't overlap with #{challenge_range.inspect}"
  end

  failure_message_when_negated do |current_range|
    "#{current_range.inspect} overlaps with #{challenge_range.inspect}"
  end

  description do
    "intersection of an enumerable's elements"
  end
end