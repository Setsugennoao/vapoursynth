rmdir /s /q build
del vapoursynth.*.pyd
del /q dist\*.whl
py -3.10 setup.py build_ext --inplace
