# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN

  def before_setup
    @elem1 = 'ruby'
    @elem2 = 'js'
    @stack = Stack.new
    @stack.push! @elem1
    @stack.push! @elem2
  end

  def test_push_assert_true
    elem3 = 'python'
    @stack.push! elem3
    assert { @stack.to_a == [@elem1, @elem2, elem3]  }
  end  

  def test_pop_assert_true
    @stack.pop!
    assert { @stack.to_a == [@elem1] }
  end

  def test_clear_assert_true
    @stack.clear!
    assert { @stack.to_a == [] }
  end

  def test_empty_assert_true
    @stack.clear!
    assert { @stack.empty? == true }
  end

  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
