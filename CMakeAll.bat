@echo off
setlocal

set CMAKE_TARGETS=unify interop MEXMLIO

if /i [%1] == [CLEAN] (
	for %%i in (%CMAKE_TARGETS%) do (
		if EXIST "%%i\" (
			echo Cleaning %%i...
			if EXIST "%%i\build" (
				rmdir /S "%%i\build"
			)
		)
	)
	goto goto_exit
)

if /i [%1] == [BUILD] (
	for %%i in (%CMAKE_TARGETS%) do (
		if EXIST "%%i\" (
			echo Making %%i...
			if NOT EXIST "%%i\build" (
				echo Creating build directory.
				mkdir "%%i\build"
			)
			cd "%%i\build"
			cmake -G "Visual Studio 17 2022" ..
			cd %~dp0
		)
	)
	goto goto_exit
)

goto goto_exit


:goto_exit
