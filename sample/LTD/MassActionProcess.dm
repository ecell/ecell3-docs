CLASSNAME = 'MassActionProcess'
BASECLASS = 'FluxProcess'
PROPERTIES = [('Real','k',0.0)]

PROTECTED_AUX ='''
'''

defineMethod( 'initialize','''
''' )

defineMethod( 'process',
'''
  Real velocity( k * N_A );
  velocity *= getSuperSystem()->getVolume();
  

  for( VariableReferenceVectorConstIterator 
	s( theVariableReferenceVector.begin() );
       s != theFirstZeroVariableReference; ++s )
    {
      VariableReference aVariableReference( *s );
      Int aCoefficient( aVariableReference.getCoefficient() );

      do {
        aCoefficient++;
        velocity *= aVariableReference.getVariable()->getConcentration();
      } while( aCoefficient != 0 );

    }

  setFlux(velocity);
''')

