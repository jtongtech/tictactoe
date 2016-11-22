require 'minitest/autorun'
require_relative 'new.rb'

class TestNew < Minitest::Test

    def test_reverse_of_empty_array
        arr = []
        assert_equal([], arr.my_reverse())
    end

    def test_reverse_of_two_items
        arr = ["a", "b"]
        assert_equal(["b", "a"], arr.my_reverse())
    end

    def test_my_index_for_empty_array
        arr = []
        assert_equal(nil, arr.my_index("a"))
    end

    def test_my_index_for_position_3_not_empty
        arr = ["a", "b", "d", "d", "e"]
        assert_equal(1, arr.my_index("b"))
        assert_equal(3, arr.my_index("d"))
    end

    def test_my_index_reversed_last_instance_not_empty
        arr = ["a", "b", "d", "d", "e"]
        assert_equal(3, arr.my_reverse.my_index("b"))
        assert_equal(2, arr.my_reverse.my_index("d"))
    end

    # def test_my_index_for_last_instance_2
    #     arr = ["1", "2", "2", "3"]
    #     assert_equal(2, arr.my_index())
    # end
end