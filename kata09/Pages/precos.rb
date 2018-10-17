class Precos

  def initialize(starts_at, *descontos)
    @starts_at = starts_at
    @descontos = descontos
  end

  def preco(quant)
    quant * @starts_at - desconto(quant)
  end

  def desconto(quant)
    @descontos.inject(0) do |mem, desconto|
      mem + desconto.calc(quant)
    end
  end
end