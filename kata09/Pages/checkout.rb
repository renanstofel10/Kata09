class CheckOut

  def initialize(regras)
    @regras = regras
    @itens = Hash.new
  end

  def scan(item)
    @itens[item] ||= 0
    @itens[item] += 1
  end

  def total
    @itens.inject(0) do |mem, (item, quant)|
      mem + preco(item, quant)
    end
  end

  private
  def preco(item, quant)
    if regra(item)
      regra(item).preco(quant)
    else
      raise "Item inválido: '#{item}'"
    end
  end

  def regra(item)
    @regras[item]
  end
end
