require 'test/unit'
require_relative '../Pages/alternative.rb'

class TestAlternative < Test::Unit::TestCase

    def dadosInput(quantityA, quantityB, quantityC, quantityD)

        ac = AlternativeCalc.new

        #ITEM
        a = "A"; b = "B"; c = "C"; d = "D";

        array = [a, b, c, d]

        for item in array
        
            case item  

                when a
                ac.dadosItem(a, quantityA)
        
                when b
                ac.dadosItem(b, quantityB)
        
                when c
                ac.dadosItem(c, quantityC)
        
                else
                ac.dadosItem(d, quantityD)
            end
        end
    end
    
    def test_alternative

        ac = AlternativeCalc.new

        #QUANTITY
        quantityA = 3; quantityB = 2; quantityC = 5; quantityD = 2;

        #ASSERTIONS
        total_a = ac.TotalAtualizado("A", quantityA); assert_equal(130, total_a)
        total_b = ac.TotalAtualizado("B", quantityB); assert_equal(45, total_b)
        total_c = ac.TotalAtualizado("C", quantityC); assert_equal(100, total_c)
        total_d = ac.TotalAtualizado("D", quantityD); assert_equal(30, total_d)
        total_ab = total_a + total_b; assert_equal(175, total_ab)
        total_ac = total_a + total_c; assert_equal(230, total_ac)
        total_ad = total_a + total_d; assert_equal(160, total_ad)
        total_bc = total_b + total_c; assert_equal(145, total_bc)
        total_bd = total_b + total_d; assert_equal(75, total_bd)
        total_cd = total_c + total_d; assert_equal(130, total_cd)
        total_abc = total_a + total_b + total_c; assert_equal(275, total_abc)
        total_abd = total_a + total_b + total_d; assert_equal(205, total_abd)
        total_acd = total_a + total_c + total_d; assert_equal(260, total_acd)
        total_bcd = total_b + total_c + total_d; assert_equal(175, total_bcd)
        total_abcd = total_a + total_b + total_c + total_d; assert_equal(305 , total_abcd)

        #PRINT DADOS
        dadosInput(quantityA, quantityB, quantityC, quantityD)
    end
end
