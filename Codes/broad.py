import numpy as np

def _gaussian( x, broad):
	dx = x[1] - x[0]
	sigma = broad
	twoSigmaSq = 2.0 * sigma**2
	norm = np.sqrt(2 * np.pi) * sigma / dx 
	#Divided for dx to take into account implementation as sum instead of integral (volume element)

	g = np.arange( -10*sigma, 10*sigma, dx)
	g = np.exp( -(g**2) / twoSigmaSq)
	g /= norm
	return g

def _lorentz( x, broad):
	dx = x[1] - x[0]
	gamma = broad
	gammaSq = gamma**2
	norm = np.pi / gamma / dx 
	#Divided for dx to take into account implementation as sum instead of integral (volume element)

	g = np.arange( -15*gamma, 15*gamma, dx)
	g = 1/(g**2 + gammaSq)
	g /= norm
	return g

v = [ _gaussian, _lorentz]
vc = [ "gauss", "lorentz"]
def broad( fname="", type="gauss", broad = 0.1, oname=""):
	fname = fname.split(",")
	if oname:
		oname = oname.split(",")
		if len(fname) != len( oname):
			raise Exception( "Must provide same number of output names as inputs names")

	if not type in vc:
		raise Exception( "Invalide type '{}'.`n".format( type))

	func = v[ vc.index( type)]

	for c, name in enumerate( fname):
		print("Applying '{}' broadening of '{}' to '{}'".format( type.upper(), broad, name))
		data = np.loadtxt( name, usecols=None)
		x = data[:,0]
		y = data[:,1:]
		conv = func( x, broad)
		lgh = int( len( conv)/2)
		#print( lg)
		new_m = None
		for yi in y.transpose():
			new = np.convolve( yi, conv, mode='full')
			#print( len(new))
			new = new[ lgh:-lgh]
			#print( len(new))
			if isinstance( new_m, np.ndarray):
				new_m = np.vstack( (new_m, new))
			else: 
				new_m = np.copy( new)

		#print( x, x.shape)
		#print( new_m, new_m.shape)
		if oname:
			n_name = oname[c]
		else:
			n_name = "{}_{}".format( name, broad)
		print( "Saving broadened data to '{}'".format( n_name))
		np.savetxt( n_name, np.c_[ x, new_m.transpose()])

if __name__ == "__main__":
	import sys
	argc = len( sys.argv)
	if( not 2<=argc<=5):
		print("Incorrect use. Pleas pass arguments:"
			"\n\t'fname'\t (comma separated),"
			"\n\t'type\t(gauss/lorentz, default=gauss)',"
			"\n\t'broad\t (default=0.1)'"
			"\n\t'oname\t(optional) (comma separated)'")
		exit()
	if( argc==2):
		broad( str( sys.argv[1]))
	if( argc==3):
		broad( str (sys.argv[1]), str( sys.argv[2]))
	if( argc==4):
		broad( str (sys.argv[1]), str( sys.argv[2]), float( sys.argv[3]))
	if( argc==5):
		broad( str (sys.argv[1]), str( sys.argv[2]), float( sys.argv[3]), str( sys.argv[4]))

		
