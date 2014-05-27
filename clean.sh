#!/bin/bash -e

sudo chown -R $USER.$USER volumes/
rm -rf volumes/lib/*
rm -rf volumes/log/*
