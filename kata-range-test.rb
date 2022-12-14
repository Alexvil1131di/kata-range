require 'minitest/autorun'
require_relative "kata-range.rb"
include Kata_range


class Test_kata_range < Minitest::Test
    def test_input_should_recive_a_valid_range_with_brackets_at_the_edge
        assert_equal '[5,41]', Kata_range.valid_format_input('[5,41]')
    end

    def test_input_should_recive_a_valid_range_with_parenthesis_at_the_edge
        assert_equal '(12,23)', Kata_range.valid_format_input('(12,23)')
    end

    def test_input_should_recive_a_valid_range_with_parenthesis_and_brackets_at_the_edge
        assert_equal '[12,23)', Kata_range.valid_format_input('[12,23)')
    end

    def test_input_should_not_recive_letters
        assert_equal StandardError.new("Invalid Input"), Kata_range.valid_format_input('[2s,23)')
    end

    def test_input_should_not_recive_any_type_of_symbols_except_for_a_comma
        assert_equal StandardError.new("Invalid Input"), Kata_range.valid_format_input('[2-23)')
    end

    def test_input_should_recive_negative_numbers
        assert_equal '[-12,23)', Kata_range.valid_format_input('[-12,23)')
    end

    def test_first_number_should_be_minor_than_the_second
        assert_equal '[-12,23)', Kata_range.valid_format_input('[-12,23)')
    end

    def test_save_into_an_array_all_the_elements_of_the_range
        input = Kata_range.valid_format_input('[3,5]')
        assert_equal [3,4,5], Kata_range.get_array(input)
    end

    def test_groups_of_numbers_should_recive_a_valid_group_limited_by_angle_brackets
        assert_equal "{2,3,1,4}", Kata_range.valid_group_input("{2,3,1,4}")
    end

    def test_groups_of_numbers_should_not_recive_letters_or_symbols
        assert_equal StandardError.new("Invalid Input"), Kata_range.valid_group_input("{2,3,a,?}")
    end

    def test_groups_of_numbers_should_not_recive_letters
        assert_equal StandardError.new("Invalid Input"), Kata_range.valid_group_input("{2,3,a,9}")
    end

    def test_groups_of_numbers_should_not_recive_symbols
        assert_equal StandardError.new("Invalid Input"), Kata_range.valid_group_input("{2,3,?,9}")
    end

    def test_find_a_group_of_numbers_on_a_range
        assert_equal true, Kata_range.contains("[2,8]","{5,8}")
    end

    def test_get_all_points_should_return_the_entire_colection_of_numbers_in_that_range
        assert_equal [7,8], Kata_range.get_all_points("(6,9)")
    end

    def test_if_a_range_contain_all_the_values_of_another_range
        assert_equal true, Kata_range.contains_a_range("[2,9]","[3,4]")
    end

    def test_should_return_the_end_points_of_an_array
        assert_equal [4,5], Kata_range.show_the_end_points("(3,6)")
    end

    def test_if_the_ranges_have_common_numbers
        assert_equal true, Kata_range.overlapse_with("[2,6]","(5,41]")
    end

    def test_is_two_ranges_are_equal
        assert_equal true, Kata_range.is_equal("[2,6]","(1,7)")
    end

end
