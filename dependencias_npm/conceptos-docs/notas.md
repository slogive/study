# Dependencias y NPM (Node package manager)

```terminal
npm init -y (accept every step and generate the .json file)

npm i moment -D (*-D* save the package as dev)

npm i nodemon -g (*-g* install the package as global)

npm list -g --depth 0 (list all the package installed as global *--depth* > where to find 0 is the more deeper)

npm i webpack -f (*-f* force the download from the npm repository)

npm i (reinstall all the package inside the package.json)

npm i json-server@0.15.0 (*@anyversion* install the specified version | *@latest* > download the last version)

npm update (update the packages)

npm outdate (show the outdate packages *--dd* show more detailed version of the command)

npm unistall json-server (uninstall the specified package)

npm cache clean --force (delete the cache from the computer for npm)

npm cache verify (verify the list of cached packages)

npm audit (audit the packages | *--json* > generate a json file with more data)

npm audit fix (fix all problem with the packages)
```
