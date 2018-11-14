import os
import glob

if __name__=="__main__":
    types = glob.glob("*.0000000000.t001.nc")
    for n in range(0,len(types)):
        types[n] = types[n].split('.')[0]
        
    for t in types:
        os.system("./gluemncbig -o %s.nc -v '*' %s.*.nc"%(t,t)) 
    os.system("./gluemncbig -o grid.nc -v '*' grid.*.nc")
