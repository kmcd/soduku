require 'rubygems'
require 'test/unit'

begin
  require 'redgreen'
rescue LoadError
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'sodoku'

class Test::Unit::TestCase
  # TODO: move to test/unit/sugar gem
  # Declare test in a block, eg
  # test "should foo" { assert true }
  def self.test(name, &block)
    test_name = "test_#{name.gsub(/\s+/,'_')}".to_sym
    defined = instance_method(test_name) rescue false
    raise "#{test_name} is already defined in #{self}" if defined
    if block_given?
      define_method(test_name, &block)
    else
      define_method(test_name) do
         flunk "No implementation provided for #{name}"
      end
    end
  end
end
