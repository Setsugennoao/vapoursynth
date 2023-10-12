@echo off

call setmvscvars.bat

@echo %VERSION_STRING%

rem 64bit build
mkdir buildp64\vapoursynth64\coreplugins
mkdir buildp64\vapoursynth64\plugins
mkdir buildp64\sdk\include
mkdir buildp64\sdk\examples
mkdir buildp64\sdk\lib32
mkdir buildp64\sdk\lib64
mkdir buildp64\doc
mkdir buildp64\vsgenstubs4
copy ..\vsrepo\vsrepo.py buildp64
copy ..\vsrepo\vsgenstubs.py buildp64
copy ..\vsrepo\vsgenstubs4 buildp64\vsgenstubs4
copy vs-detect-python.bat buildp64
copy 7z.exe buildp64
copy 7z.dll buildp64
copy ..\vapoursynth.cp3*-win_amd64.pyd buildp64
copy ..\msvc_project\x64\Release\VapourSynth.dll buildp64
copy ..\msvc_project\x64\Release\vsscript.dll buildp64
copy ..\msvc_project\x64\Release\avfs.exe buildp64
copy ..\msvc_project\x64\Release\vsvfw.dll buildp64
copy ..\msvc_project\x64\Release\vspipe.exe buildp64
copy ..\msvc_project\x64\Release\AvsCompat.dll buildp64\vapoursynth64\coreplugins
copy ..\include\VapourSynth.h buildp64\sdk\include
copy ..\include\VSHelper.h buildp64\sdk\include
copy ..\include\VSScript.h buildp64\sdk\include
copy ..\include\VapourSynth4.h buildp64\sdk\include
copy ..\include\VSHelper4.h buildp64\sdk\include
copy ..\include\VSScript4.h buildp64\sdk\include
copy ..\include\VSConstants4.h buildp64\sdk\include
copy ..\msvc_project\Release\vapoursynth.lib buildp64\sdk\lib32
copy ..\msvc_project\Release\vsscript.lib buildp64\sdk\lib32
copy ..\msvc_project\x64\Release\vapoursynth.lib buildp64\sdk\lib64
copy ..\msvc_project\x64\Release\vsscript.lib buildp64\sdk\lib64
copy ..\sdk\filter_skeleton.c buildp64\sdk\examples
copy ..\sdk\invert_example.c buildp64\sdk\examples
copy ..\sdk\vsscript_example.c buildp64\sdk\examples
copy "%MVSCRedistPath%\%RedistVersion%\x64\Microsoft.VC%RedistShortVersion%.CRT\*" buildp64
copy pfm-192-vapoursynth-win.exe buildp64
copy .\setup.py buildp64
copy .\VAPOURSYNTH_VERSION buildp64
copy .\MANIFEST.in buildp64
xcopy /E ..\doc\_build\html\* buildp64\doc
type nul >buildp64\portable.vs
type nul >buildp64\vapoursynth64\plugins\.keep
if "%SKIP_COMPRESS%" EQU "" (
  IF EXIST "Compiled\vapoursynth64-portable-R%VERSION_STRING%.7z" (
    del Compiled\vapoursynth64-portable-R%VERSION_STRING%.7z
  )
  cd buildp64
  7z.exe a ..\Compiled\VapourSynth64-Portable-R%VERSION_STRING%.7z *
  cd ..
  rmdir /s /q buildp64
)

:endc

if "%SKIP_WAIT%" EQU "" (
  pause
)
