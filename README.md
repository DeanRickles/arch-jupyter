### Arch-Jupyter
Note: Need to look into the option of running a script a boot to install additiol packages. On hold until further notice.

#### Enviroment Variables:
- [ ] Pacman packages (list of packages)
    - [ ] Error handling. 
        - [ ] Will all packages be thrown out if one package doesn't exist?
        - [ ] Validation check on each package before proceeding?

- [ ] PIP packages (requirement file?)
    - [ ] Detect file path and use file argument.
        - [ ] 1 Detect extention.
        - [ ] 2 Detect file exists.
        - [ ] 3 Detect file isn't empty.
        - [ ] 4 Change argument to file input
    - [ ] Error handling. 
        - [ ] Will all packages be thrown out if one package doesn't exist?
        - [ ] Validation check on each package before proceeding?

#### Bug
- [ ] kernal not connecting.

#### Misc:
- [x] Install dotnet 
    [26/04/2022] Installed into package. Added job to split off package under different tags for consistancy and load times.
- [ ] Review using different Tags for pre-installed packages.
- [ ] DockerCompose file
- [ ] Variable Reference file
