doc:
	git submodule foreach 'cd ./extras/; make'

adddoc:
	git submodule foreach 'git add $(opt) '
commit:
	git submodule foreach 'git commit -a $(opt) -m=$(msg)'
status:
	git submodule foreach 'git status;git show-branch -a --topo-order --more=10'
	

version:
	git submodule foreach 'cat library.properties  | grep version | sed 's/version=//g' '
tag:# -f : to move a tag
	git submodule foreach 'make  --makefile=../makefile tag2 opt=$(opt)'
tag2:
	git tag $(opt) $(shell cat library.properties  | grep version | sed 's/version=//g') 
pull:
	git pull
	git submodule foreach 'git pull $(opt)'
push:# --force : to move a tag
	
	git submodule foreach 'git push --tags $(opt) origin master'
	git push
	
	
patch:
	git config -l | grep user
	git config --local user.email zoubata@yahoo.fr
	git config --local user.name zoubata

	git change-commits GIT_AUTHOR_EMAIL "Pierre.Valleau@Microchip.com" "zoubata@yahoo.fr"
	git change-commits GIT_AUTHOR_NAME "Pierre Valleau" "zoubata"
	git config -l | grep user
patchs:
	git submodule foreach 'git config --local user.email zoubata@yahoo.fr'
	git submodule foreach 'git config --local user.name zoubata'
	git submodule foreach 'git change-commits GIT_AUTHOR_EMAIL "Pierre.Valleau@Microchip.com" "zoubata@yahoo.fr"'
	git submodule foreach 'git change-commits GIT_AUTHOR_NAME "Pierre Valleau" "zoubata"'
	
	