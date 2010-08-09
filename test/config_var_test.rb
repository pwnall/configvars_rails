require File.expand_path('../test_helper', __FILE__)

class ConfigVarTest < ActiveSupport::TestCase
  def setup
    @var = ConfigVar.new :name => 'var', :value => 'var_value'
  end
  
  test "setup" do
    assert @var.valid?
  end
  
  test "duplicate flag name" do
    @var.name = 'app_uri'
    assert !@var.valid?
  end

  test "convenience get" do
    @var.save!
    assert_equal 'var_value', ConfigVar['var']
    
    assert_raise IndexError do
      assert_equal 'failure', ConfigVar['undefined']
    end
  end
  
  test "convenience set" do
    ConfigVar['other_var'] = 'other_value'
    assert_equal 'other_value',
                 ConfigVar.where(:name => 'other_var').first.value
  end
end
