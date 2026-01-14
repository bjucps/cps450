# Define command aliases used in automated tests

# The following commands use gradle instead of gradlew because the testing environment
# has a preinstalled version of gradle and we don't want to slow down builds by
# using gradlew, which will download gradle

export ZBUILD="gradle install"
export ZTEST="gradle test"
export ZAPP="build/install/app/bin/app"
