#!/bin/sh

if [ $# -ne 1 ]; then
	echo Usage: $0 filename
	exit 1
fi

# fullname like path/to/base1.base2.ext
fullname=$1
# filename is base1.base2.ext
filename=${fullname##*/}
# basename is base1.base2
basename=${filename%.*}
# extention is ext
extension=${filename##*.}

case "${extension}" in
h|hh)
	def=$(echo ${filename} | tr '[a-z]' '[A-Z]' | tr '.' '_')
	def=__${def}__
	cat > ${fullname} << EOF
#ifndef ${def}
#define ${def}

#endif  // ifndef ${def}
EOF
	;;
csh)
	cat > ${fullname} << EOF
#!/bin/csh -f
EOF
	chmod +x ${fullname}
	;;
sh|bash)
	cat > ${fullname} << EOF
#!/bin/sh
EOF
	chmod +x ${fullname}
	;;
py)
cat > ${fullname} << EOF
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

def main():
	print("Hello world.") 

	if __name__ == "__main__":
main()
EOF
	chmod +x ${fullname}
	;;
html|htm)
	cat > ${fullname} << EOF
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title></title>
</head>
<body>

</body>
</html>
EOF
	;;
*)
	;;
esac

vim ${fullname}
