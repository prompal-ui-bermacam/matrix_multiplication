#!/bin/bash
./generate_matrix.sh

echo "compile..."
echo
make mpi
echo
echo "calculate..."
echo
NPS=(
    1
    2
    4
    8
)
MATRIX_SIZES=(
    128
    256
    512
    1024
    2048
)

for SZ in ${MATRIX_SIZES[@]}
do 
    echo "* * * * * * * ${SZ}x${SZ} Matrix" >> test-matrix.txt
    for PROC in ${NPS[@]}
    do
        cal_t=$((time mpirun -np ${PROC} bin/mpi data/mat_${SZ}x${SZ}.txt data/mat_${SZ}x${SZ}b.txt)  2>&1 > /dev/null | grep real | awk '{print $2}')
        echo "with mpi(${PROC})     $cal_t" >> test-matrix.txt
        echo "" >> test-matrix.txt
    done
done

for SZ in ${MATRIX_SIZES[@]}
do 
    echo "* * * * * * * ${SZ}x1 Matrix" >> test-vector.txt
    for PROC in ${NPS[@]}
    do
        cal_t=$((time mpirun -np ${PROC} bin/mpi data/mat_${SZ}x${SZ}.txt data/mat_${SZ}x1.txt)  2>&1 > /dev/null | grep real | awk '{print $2}')
        echo "with mpi(${PROC})     $cal_t" >> test-vector.txt
        echo "" >> test-vector.txt
    done
done