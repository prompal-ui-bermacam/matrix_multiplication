#!/bin/bash
echo "generate test-matrices with python3 if no test data found"
echo
if [ ! -f data/mat_128_128.txt ]; then
    echo "generate 128x128 matrix..."
    python3 random_float_matrix.py 128 128 > data/mat_128_128.txt
fi

if [ ! -f data/mat_128_128b.txt ]; then
    echo "generate 128x128 matrix..."
    python3 random_float_matrix.py 128 128 > data/mat_128_128b.txt
fi

if [ ! -f data/mat_256_256.txt ]; then
    echo "generate 256x256 matrix..."
    python3 random_float_matrix.py 256 256 > data/mat_256_256.txt
fi

if [ ! -f data/mat_256_256b.txt ]; then
    echo "generate 256x256 matrix..."
    python3 random_float_matrix.py 256 256 > data/mat_256_256b.txt
fi

if [ ! -f data/mat_512_512.txt ]; then
    echo "generate 512x512 matrix..."
    python3 random_float_matrix.py 512 512 > data/mat_512_512.txt
fi

if [ ! -f data/mat_512_512b.txt ]; then
    echo "generate 512x512 matrix..."
    python3 random_float_matrix.py 512 512 > data/mat_512_512b.txt
fi

if [ ! -f data/mat_1024_1024.txt ]; then
    echo "generate 1024x1024 matrix..."
    python3 random_float_matrix.py 1024 1024 > data/mat_1024_1024.txt
fi

if [ ! -f data/mat_1024_1024b.txt ]; then
    echo "generate 1024x1024 matrix..."
    python3 random_float_matrix.py 1024 1024 > data/mat_1024_1024b.txt
fi

if [ ! -f data/mat_2048_2048.txt ]; then
    echo "generate 2048x2048 matrix..."
    python3 random_float_matrix.py 2048 2048 > data/mat_2048_2048.txt
fi

if [ ! -f data/mat_2048_2048b.txt ]; then
    echo "generate 2048x2048 matrix..."
    python3 random_float_matrix.py 2048 2048 > data/mat_2048_2048b.txt
fi

MATRIX_SIZES=(
    128
    256
    512
    1024
    2048
)
for SZ in "${MATRIX_SIZES[@]}"
do
    FILE="data/mat_${SZ}_1.txt"
    if [ ! -f $FILE ]; then
        echo "generate ${SZ}x1 matrix..."
        python3 random_float_matrix.py ${SZ} 1 > $FILE
    fi
done