CLASSNAME = 'PKCactivePProcess'
BASECLASS = 'FluxProcess'
PROPERTIES = []

PROTECTED_AUX = ''' 
  VariableReference S0;
  VariableReference S1;
  VariableReference S2;
  VariableReference S3;
  VariableReference P0;
'''

defineMethod('initialize','''
  S0 = getVariableReference( "S0" );
  S1 = getVariableReference( "S1" );
  S2 = getVariableReference( "S2" );
  S3 = getVariableReference( "S3" );
  P0 = getVariableReference( "P0" );
''')

defineMethod('react',
'''
  const Real s0( S0.getVariable()->getValue() );
  const Real s1( S1.getVariable()->getValue() );
  const Real s2( S2.getVariable()->getValue() );
  const Real s3( S3.getVariable()->getValue() );

  const Real p( s0 + s1 + s2 + s3 );

  P0.getVarialbe()->setValue(p);
''')