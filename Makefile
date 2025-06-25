# The usual suspects

all:
	@echo Targets: copy docs git

clean:
	rm -f aa bb cc

copy:
	@cp -auv *.sh ~/pgbin
	@cp -auv esp/*.sh ~/pgbin
	@cp -auv clean/*.sh ~/pgbin
	@cp -auv mount/*.sh ~/pgbin
	@cp -auv backup/*.sh ~/pgbin
	@cp -auv misc/*.sh ~/pgbin

git:
	@git add .
	@git commit -m "autocheck"
	@git push

# EOF
