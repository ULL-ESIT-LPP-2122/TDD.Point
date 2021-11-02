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

