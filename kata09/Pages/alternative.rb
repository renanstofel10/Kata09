class AlternativeCalc

  def TotalAtualizado(item, quant)
    
    totalAtualizado = ValorTotal(item, quant) - ValorDesconto(item, quant)

    return totalAtualizado
  end

  def ValorTotal(item, quant)
    
    total = quant * priceItem(item)

    return total
  end

  def ValorDesconto(item, quant)
        
    if quantityPromo(item) != 0 
      divisor = quant.div quantityPromo(item)
    
    else
      divisor = 0
    end
    
    desconto = divisor * descontoItem(item)

    return desconto
  end  

  def priceItem(item)

    if item == "A"
      return 50

    elsif item == "B"
      return 30

    elsif item == "C"
      return 20

    elsif item == "D"
      return 15

    else  
      return 0

    end
  end

  def quantityPromo(item)

    if item == "A"
      return 3

    elsif item == "B"
      return 2 

    else 
      return 0
    end
  end

  def descontoItem(item)

    if item == "A"
      return 20

    elsif item == "B"
      return 15

    else
      return 0
    end
  end

  def dadosItem(item, quant)

    puts "ITEM #{item}\n\n"

    quantidade = quant
    puts "Quantidade: #{quantidade}\n"

    valorProduto = priceItem(item)
    puts "Valor Produto: #{valorProduto}\n"

    valorTotal = ValorTotal(item, quant)
    puts "Valor Total: #{valorTotal}\n"

    desconto = ValorDesconto(item, quant)
    puts "Desconto: #{desconto}\n"

    totalAtualizado = TotalAtualizado(item, quant)
    puts "Total com Desconto: #{totalAtualizado}\n\n"
  end
end  