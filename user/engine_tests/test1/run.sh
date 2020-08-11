#location of required codes
#LAMMPS_LOC="${USER_PATH}/lammps/src/lmp_mdi"
LAMMPS_LOC="/docker_image/lammps/src/lmp_mdi"
echo "IN run.sh:"
echo "USER PATH: "
echo ${USER_PATH}
#echo "LAMMPS_LOC: "
#echo ${LAMMPS_LOC}
#echo "Checking for file: "
#ls ${LAMMPS_LOC}
echo "Working directory: "
pwd
ls


#set the number of threads
#export OMP_NUM_THREADS=1

#launch LAMMPS
#${LAMMPS_LOC} -mdi "-role ENGINE -name MM -method TCP -port 8021 -hostname localhost" -in lammps.in > lammps.out
#${LAMMPS_LOC} -in lammps.in > lammps.out
docker run --rm -v ${USER_PATH}/engine_tests/test1:/data -it travis/mdi_test bash -c "cd /data && ${LAMMPS_LOC} -in lammps.in > lammps.out"
#docker run --rm -v ${USER_PATH}/_work:/data -it travis/mdi_test bash -c \"cd /data && ls && /docker_image/lammps/src/lmp_mdi -mdi \'" + mdi_engine_options + "\' -in lammps.in > lammps.out\"

echo "Test output: "
cat lammps.out
