


all:
	echo copy docs git

copy:
	cp -uv * ~/pgbin

git:
	git add .
	git commit -m "autocheck"
	git push

# EOF
