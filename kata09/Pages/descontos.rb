class Descontos

  def initialize(valor, quant)
    @valor = valor
    @quant = quant
  end

  def calc(quant)
    (quant / @quant).floor * @valor
  end

end