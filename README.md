# Clase Punto con RSpec

1. Intalar la gema Rspec (gem install rspec)

2. Ejecutar rspec --init (se crean el fichero .rspec, el directorio spec/ y el fichero spec/spec\_helper.rb)

3. Primera prueba:
    Preguntar por el fichero que ha de contener la clase

    $cat spec/point\_spec.rb
    require 'point'

    $rspec spec/point\_spec.rb
   
    An error occurred while loading ./spec/point_spec.rb. - Did you mean?
                    rspec ./spec/spec_helper.rb

    Failure/Error: require 'point'

    LoadError:
    cannot load such file -- point
    # ./spec/point_spec.rb:1:in `<top (required)>'
    No examples found.


    Finished in 0.00004 seconds (files took 0.18816 seconds to load)
    0 examples, 0 failures, 1 error occurred outside of examples

4. Se arregla el fallo que produce la primera prueba:
    $touch lib/point.rb

    $rspec spec/point\_spec.rb

    No examples found.


    Finished in 0.0006 seconds (files took 0.16118 seconds to load)
    0 examples, 0 failures
    
5. Debe existir una clase para representar un punto:
       
    $cat spec/point\_spec.rb
    require 'point'

    describe Point do
    end

    $rspec spec/point\_spec.rb
    An error occurred while loading ./spec/point_spec.rb.
    Failure/Error:
    describe Point do
    end

    NameError:
    uninitialized constant Point
    # ./spec/point_spec.rb:3:in `<top (required)>'
    No examples found.


    Finished in 0.00004 seconds (files took 0.17896 seconds to load)
    0 examples, 0 failures, 1 error occurred outside of examples

6. Se arregla el fallo que produce la segunda prueba:

    $cat lib/point.rb
    class Point
    end
    $rspec spec/point\_spec.rb
    No examples found.


    Finished in 0.0004 seconds (files took 0.16054 seconds to load)
    0 examples, 0 failures

7. Debe existir una forma de inicializar un punto (tercera prueba):

    $cat spec/point\_spec.rb
    require 'point'

    # Permite agrupar pruebas
    describe Point do

      # Descrbe la prueba 
      it "Se instancia un punto con coordenadas x, y" do
         # Define la expectativa
         expect(Point.new(0,0)).not_to eq(nil) #matcher
      end
    end

    $rspec spec/point\_spec.rb
    F

    Failures:

    1) Point Se instancia un punto con coordenadas x, y
       Failure/Error: expect(Point.new(0,0)).not_to eq(nil) #matcher

       ArgumentError:
         wrong number of arguments (given 2, expected 0)
       # ./spec/point_spec.rb:9:in `initialize'
       # ./spec/point_spec.rb:9:in `new'
       # ./spec/point_spec.rb:9:in `block (2 levels) in <top (required)>'

    Finished in 0.00493 seconds (files took 0.14996 seconds to load)
    1 example, 1 failure

    Failed examples:

    rspec ./spec/point_spec.rb:7 # Point Se instancia un punto con coordenadas x, y

8. Se arregla el fallo que produce la tercera prueba:

    $cat lib/point.rb
    class Point
      def initialize(x,y)
        @x,@y = x,y
      end
    end

    
    $rspec spec/point\_spec.rb --format doc

    Point
      Se instancia un punto con coordenadas x, y

    Finished in 0.00268 seconds (files took 0.16168 seconds to load)
    1 example, 0 failures

9. Debe existir una forma de acceder a las coordenadas de un punto (cuarta prueba):
   
    $cat spec/point\_spec.rb
    require 'point'

    # Permite agrupar pruebas
    describe Point do

      # Descrbe la prueba 
      it "Se instancia un punto con coordenadas x, y" do
      # Define la expectativa
        expect(Point.new(0,0)).not_to eq(nil) #matcher
      end
      it "Se debe poder acceder a las coordenadas con los getters" do
        expect(Point.new(0,0).x).to eq(0) 
        expect(Point.new(0,0).y).to eq(1) 
      end
    end

    $rspec spec/point\_spec.rb --format doc

    Point
      Se instancia un punto con coordenadas x, y
      Se debe poder acceder a las coordenadas con los getters (FAILED - 1)

    Failures:

    1) Point Se debe poder acceder a las coordenadas con los getters
       Failure/Error: expect(Point.new(0,0).x).to eq(0)

       NoMethodError:
       undefined method `x' for #<Point:0x0000555f34ecd338 @x=0, @y=0>
       # ./spec/point_spec.rb:12:in `block (2 levels) in <top (required)>'

    Finished in 0.00306 seconds (files took 0.15878 seconds to load)
    2 examples, 1 failure

    Failed examples:

    rspec ./spec/point_spec.rb:11 # Point Se debe poder acceder a las coordenadas con los getters

9. Se arregla el fallo que produce la cuarta prueba:

    $cat lib/point.rb
    class Point
      attr_reader :x, :y
      def initialize(x,y)
        @x,@y= x, y
      end
    end

    $rspec spec/point\_spec.rb --format doc
    Point
      Se instancia un punto con coordenadas x, y
      Se debe poder acceder a las coordenadas con los getters

    Finished in 0.00298 seconds (files took 0.1688 seconds to load)
    2 examples, 0 failures

10. Debe existir una forma de representar un punto como una cadena (quinta prueba):

    $cat spec/point\_spec.rb

    require 'point'

    # Permite agrupar pruebas
    describe Point do

    # Descrbe la prueba 
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
    end

    $rspec spec/point\_spec.rb --format doc
    Point
      Se instancia un punto con coordenadas x, y
      Se debe poder acceder a las coordenadas con los getters
      El formato del punto sera (x,y) (FAILED - 1)

      Failures:

      1) Point El formato del punto sera (x,y)
         Failure/Error: expect(Point.new(0,0).to_s).to eq("(0,0)")

         expected: "(0,0)"
            got: "#<Point:0x00005585672f47b0>"

       (compared using ==)
       # ./spec/point_spec.rb:16:in `block (2 levels) in <top (required)>'

       Finished in 0.0275 seconds (files took 0.16281 seconds to load)
       3 examples, 1 failure

       Failed examples:

       rspec ./spec/point_spec.rb:15 # Point El formato del punto sera (x,y)

10. Se arregla el fallo que produce la quinta prueba:

    $cat lib/point.rb

    class Point
      attr_reader :x, :y
      def initialize(x,y)
        @x,@y= x, y
      end
      def to_s
        "(#{@x},#{@y})"
      end
    end

    $rspec spec/point\_spec.rb --format doc
    Point
      Se instancia un punto con coordenadas x, y
      Se debe poder acceder a las coordenadas con los getters
      El formato del punto sera (x,y)

      Finished in 0.00307 seconds (files took 0.15437 seconds to load)
      3 examples, 0 failures

