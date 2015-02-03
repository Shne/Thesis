#!/bin/bash

cd SimpleWaveletConstruction
make CONF=Debug clean
make CONF=Debug
make CONF=Release clean
make CONF=Release