# The usual suspects

all:
	@echo Targets: copy docs git

clean:
	rm -f aa bb cc

copy:
	@cp -auv *.sh ~/pgbin

git:
	@git add .
	@git commit -m "autocheck"
	@git push

# EOF
