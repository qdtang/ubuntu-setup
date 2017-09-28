#!/bin/sh

usage()
{
	echo "usage: $1 <test_name>"
	exit $2
}

if [ $# != 1 ]; then
	usage $0 1
fi

if [ "$1" = "-h" -o "$1" = "--help" ]; then
	usage $0 0
fi


name=$1

mkdir ${name}
cd ${name}

#cpp file skeleton
cat > ${name}.cpp << EOF
#include <iostream>

int main(int argc, char *argv[])
{
	std::cout << "Hello\n";
	return 0;
}
EOF

#Makefile
cat >  Makefile << EOF
override CXXFLAGS += -Wall -Werror -std=c++17
.PHONY: clean debug release

release: CXXFLAGS += -O2
debug: CXXFLAGS += -g

debug release: ${name}

${name}: ${name}.cpp
	\$(CXX) \$(CXXFLAGS) \$< -o \$@
	@echo ======================OUTPUT======================
	@./\$@

clean:
	\$(RM) ${name} 
EOF
