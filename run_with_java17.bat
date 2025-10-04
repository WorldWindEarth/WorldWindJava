@echo off
echo Running WorldWind Java with Java 17 compatibility options...
echo.

REM Set Java 17 JVM options for JOGL compatibility
set JVM_OPTS=--add-exports java.base/java.lang=ALL-UNNAMED --add-exports java.desktop/sun.awt=ALL-UNNAMED --add-exports java.desktop/sun.java2d=ALL-UNNAMED

REM Check if Java is available
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Java is not found in PATH. Please ensure Java 17 is installed and configured.
    pause
    exit /b 1
)

echo Java version:
java -version
echo.

echo Starting WorldWind Java with JVM options: %JVM_OPTS%
echo.

REM Run the application with JVM options
java %JVM_OPTS% -cp "build/libs/*;jogl-all.jar;gluegen-rt.jar;worldwind-2.4.0.jar;worldwindx-2.4.0.jar" gov.nasa.worldwindx.applications.worldwindow.WorldWindow

pause
