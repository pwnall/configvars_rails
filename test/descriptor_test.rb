require File.expand_path('../test_helper', __FILE__)

class DescriptorTest < ActiveSupport::TestCase
  setup do    
    @simple_desc = ConfigvarsRails.variable_descriptor 'config_vars.http_user'
    @block_desc = ConfigvarsRails.variable_descriptor 'block_example'
  end
  
  test 'default_value' do
    assert_equal 'config', @simple_desc.default_value
    assert_in_delta Time.now, @block_desc.default_value, 0.1
  end
  
  test 'value_type' do
    assert_equal :string, @simple_desc.value_type
  end
  
  test 'default_value fallback in ConfigVar[]' do
    assert_equal 'config', ConfigVar['config_vars.http_user']
  end
end
