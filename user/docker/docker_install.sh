# NOTE: SHOULD PROBABLY MAKE THIS UNECCESSARY
cd ../

# Obtain a clone of LAMMPS
if [ ! -d "build/lammps" ]; then
    git clone https://github.com/MolSSI-MDI/lammps.git --branch mdi build/lammps
fi
#LAMMPS_INSTALL='serial'
LAMMPS_INSTALL='mpi'

# Configure LAMMPS
cd build/lammps/src
make yes-asphere
make yes-body
make yes-class2
make yes-colloid
make yes-compress
make yes-coreshell
make yes-dipole
make yes-granular
make yes-kspace
make yes-manybody
make yes-mc
make yes-misc
make yes-molecule
make yes-opt
make yes-peri
make yes-qeq
make yes-replica
make yes-rigid
make yes-shock
make yes-snap
make yes-srd
make yes-user-mdi

# Build the MDI Library
cd ../lib/mdi
#python Install.py -m gcc
make -f Makefile.gcc
cd ../../src
  
# Build LAMMPS
if test "${LAMMPS_INSTALL}" = 'serial'; then make mpi-stubs; fi
make -j 4 "${LAMMPS_INSTALL}"
cp lmp_"${LAMMPS_INSTALL}" lmp_mdi