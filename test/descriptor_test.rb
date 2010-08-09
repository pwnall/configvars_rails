require File.expand_path('../test_helper', __FILE__)

class DescriptorTest < ActiveSupport::TestCase
  setup do    
    @simple_desc = ConfigvarsRails.variable_descriptor 'simple_var'
    @block_desc = ConfigvarsRails.variable_descriptor 'block_var'
  end
  
  test 'default_value' do
    assert_equal 'simple_val', @simple_desc.default_value
    assert_in_delta Time.now, @block_desc.default_value, 0.1,
                    'first block call'
  end
  
  test 'value_type' do
    assert_equal :string, @simple_desc.value_type
  end
  
  test 'default_value fallback in ConfigVar[]' do
    assert_equal 'simple_val', ConfigVar['simple_var']
  end
end
