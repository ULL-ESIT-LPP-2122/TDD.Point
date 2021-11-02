require 'point'

# Permite agrupar pruebas
describe Point do

  # Descrbe la prueba 
  it "Se instancia un punto con coordenadas x, y" do
    # Define la expectativa
    expect(Point.new(0,0)).not_to eq(nil) #matcher
  end
end
