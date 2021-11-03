require 'point'

# Permite agrupar pruebas
describe Point do

  # Describe la prueba 
  it "Se instancia un punto con coordenadas x, y" do
    # Define la expectativa
    expect(Point.new(0,0)).not_to eq(nil) #matcher
  end
  it "Se debe poder acceder a las coordenadas con los getters" do
    expect(Point.new(0,0).x).to eq(0) 
    expect(Point.new(0,0).y).to eq(0) 
  end
  it "El formato del punto sera (x,y)" do
    expect(Point.new(0,0).to_s).to eq("(0,0)")
  end
  it "Se debe de poder multiplicar un punto por un escalar" do
    expect((Point.new(1,1) * 5).to_s).to eq("(5,5)")
  end
  it "Se deben de poder sumar dos puntos" do
    expect((Point.new(1,1) + Point.new(4,4)).to_s).to eq("(5,5)")
  end

end
