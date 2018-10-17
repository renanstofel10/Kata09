require 'test/unit'
require_relative '../Pages/checkout.rb'
require_relative '../Pages/descontos.rb'
require_relative '../Pages/precos.rb'
require_relative '../Pages/regras.rb'

class TestPrice < Test::Unit::TestCase

    def calculatePrice(items)

        co = CheckOut.new(REGRAS)
    
        items.split(//).each { |item| 
        co.scan(item)
        }

        co.total
    end

    def test_total
        assert_equal(  0, calculatePrice(""))
        assert_equal( 50, calculatePrice("A"))
        assert_equal( 80, calculatePrice("AB"))
        assert_equal(115, calculatePrice("CDBA"))
        assert_equal(100, calculatePrice("AA"))
        assert_equal(130, calculatePrice("AAA"))
        assert_equal(180, calculatePrice("AAAA"))
        assert_equal(230, calculatePrice("AAAAA"))
        assert_equal(260, calculatePrice("AAAAAA"))
        assert_equal(160, calculatePrice("AAAB"))
        assert_equal(175, calculatePrice("AAABB"))
        assert_equal(225, calculatePrice("AAABBA"))
        assert_equal(205, calculatePrice("AAABBB"))
        assert_equal(195, calculatePrice("AAABBC"))
        assert_equal(190, calculatePrice("AAABBD"))
        assert_equal(190, calculatePrice("DABABA"))
    end

    def test_incremental

        co = CheckOut.new(REGRAS)

        assert_equal(0, co.total)
        co.scan("A");  assert_equal(50, co.total)
        co.scan("B");  assert_equal(80, co.total)
        co.scan("A");  assert_equal(130, co.total)
        co.scan("A");  assert_equal(160, co.total)
        co.scan("B");  assert_equal(175, co.total)
    end
end