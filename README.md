# Clase Punto con RSpec

1. Intalar la gema Rspec (gem install rspec)

2. Ejecutar rspec --init (se crean el fichero .rspec, el directorio spec/ y el fichero spec/spec\_helper.rb)

3. Primera prueba:
    Preguntar por el fichero que ha de contener la clase

    $cat spec/point\_spec.rb
    require 'point'

    $rspec spec/point\_spec-rb
   
    An error occurred while loading ./spec/point_spec.rb. - Did you mean?
                    rspec ./spec/spec_helper.rb

    Failure/Error: require 'point'

    LoadError:
    cannot load such file -- point
    # ./spec/point_spec.rb:1:in `<top (required)>'
    No examples found.


    Finished in 0.00004 seconds (files took 0.18816 seconds to load)
    0 examples, 0 failures, 1 error occurred outside of examples

