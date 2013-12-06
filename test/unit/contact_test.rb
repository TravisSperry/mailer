require 'test_helper'

class CONTACTTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert CONTACT.new.valid?
  end
end
