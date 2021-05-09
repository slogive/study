# Terminal commands

```terminal
cp file1 "file2" (rename if you want to copy the file)

mv file .. (move the file to the parent directory)

rm file (delete the file)
```

```terminal
head principios-de-usabilidad.md (view the contain of the file)

head principios-de-usabilidad.md -n 15 ("" -n determinate the number of lines)

tail principios-de-usabilidad.md (view the last contained lines from a file)

tail principios-de-usabilidad.md -n 15 (view the last contained lines from a file)

less principios-de-usabilidad.md (navigate throught a text file) { search using "/*prop*", quit using q }

xdg-open principios-de-usabilidad.md (open the file with de default program)
```

## Wildcards

```terminal
ls *.txt (show all the files with the extension .txt)

ls index* (list all files named index)

ls index? (list all files named index with a caracter less or more exact) { ls index*?* => 1 caracter more, index*???* => 3 caracters more }

ls [[:upper:]]* (list all files with a uppercase in the first letter)

ls -d [[:upper:]]* (list all folders with a uppercase in the first letter)

ls [[:lower:]]* (list all files with a lowercase in the first letter)

ls [ad]* (list all files that started with "ad")

mv *.php /folder (move all files with the .php extension)
```

## Redirecciones

> Independiente del lenguaje, cualquier programa tiene un flujo de entrada de datos “STANDAR INPUT” = “<”, un flujo de salida “STANDAR OUTPUT” = “>” o “1>” y un modo de capturar errores “STANDAR ERROR” = “2>”. En la terminal, podemos tener este mismo flujo de datos gracias a: “<” , “>” y “2>”.
> <br/>
> TIP: esto es muy utilizado en los logs para definir los estados: [“ok”, “warning”, “error”].

```terminal
ls > files.txt (save all files names with a file redirection to a .txt)

ls >> files.txt ("" + concat)

ls 'a expresion that broke the command' 2> files.txt (save the error with a redirection using *stderr*)

ls  'a expresion that broke the command' > files.txt 2>&1 ("" + stderr + stdout)
```

## Redirecciones: pipe operator

> El pipe operator permite enviar la salida de un comando como entrada del siguiente.

```terminal
echo "Hola" (stdout to terminal)

cat files.txt index.txt (concat files and stdout)

"" is the save as | cat < files.txt index.txt (all commands that use an output from a file just pass the file to a stdin and show up in stdout)

ls -lh | less (use the pipe to redirect/use to less)

ls -lh | less | tee output.txt (list files > use less to view the content of the file > save the file with tee)

ls -lh | tee output.txt | less (list files > save the file with tee > use less to view the content of the file)

ls -lh | tee output.txt | sort | less (list files > sort > save the file with tee > use less to view the content of the file)

cowsay "Te amo mi osita" | lolcat (generate a cow with a sign > add fabulous colors)
```

## Encadenando comandos: operadores de control

Comandos separados por punto y coma “;” : Se ejecutan uno seguido del otro en el orden en que fueron puesto. Uno no se ejecuta hasta que el otro proceso aya terminado.

- Comandos separados por & : Se ejecutan todos al mismo tiempo, es decir de forma asíncrona.

- Comandos separados por && : Se ejecutan solo si el comando anterior se aya ejecutado exitosamente. Suponemos que A, B y C son comando:
  A && B && C
  El B solo se va ejecutar si el A se ejecuta exitosamente, y el C solo se va ejecutar si el B si ejecuta exitosamente. Si el B no se ejecuta exitosamenta el C no se ejecuta. Si el A no se ejecuta exitomante el B y el C no se ejecutan.

- Comandos separados por || : Solo se ejecuta uno. Sea cuantos comandos tienes separados por || solo ejecuta o toma en cuenta el primer que se ejecuta exitosamente (bajo la redundacia), y descarta automaticamente los demas. Cuando uno de los comandos se ejecuta exitosamente, descarta los demas comandos.

## Tipos de modo

| Kind  | Values  | Permissions |
| :---: | :-----: | :---------: |
| Owner | "1 1 1" |     rwx     |
| Group | "1 0 1" |     r-x     |
| Owner | "1 0 1" |     r-x     |

| Value | Desc    |
| ----- | ------- |
| r     | read    |
| w     | write   |
| x     | execute |

### Value sum

| Value 1 | Value 2 | Value 3 |
| :-----: | :-----: | :-----: |
|    4    |    2    |    1    |
| empty 0 | empty 0 | empty 0 |

### Octal

| Octal | Binario | Permission |
| :---: | :-----: | :--------: |
|   0   |   000   |    ---     |
|   1   |   001   |    --x     |
|   2   |   010   |    -w-     |
|   3   |   011   |    -wx     |
|   4   |   100   |    r--     |
|   5   |   101   |    r-x     |
|   6   |   110   |    rw-     |
|   7   |   111   |    rwx     |

### Modo simbolico

| Simbolo |     Means     |
| :-----: | :-----------: |
|    u    |     user      |
|    g    |    global     |
|    o    | other (world) |
|    a    |      all      |

## Permisos

```terminal
chmod 755 mitexto.txt (rwx - r-x - r-x)

chmod u-r mitexto.txt (user removed)

chmod u-x, go=wm mitexto.txt (remove exectute for the user, asign write for group and others)
```

## Links simbolicos

```terminal
ln -s "Folder root name" "folder direct access name"
```

## Variables de entorno

```terminal
printenv (shows all enverioment variables)

code .bashrc (edit all the $env_vars and alias)

$PATH (call any env var with *$*)
```

## Comandos de busqueda

```terminal
which code (where is located the binary for code)

type cd (show the description for cd, what type is)

find ./ -name *.txt (search all files with the extension *txt*)

find ./ -name file (search all files named *file*)

find ./ -type file (search f(folders), d(directories) named *file*) | f > for files | d > for folders

find ./ -size 20M (find files less bigger that 20M)
```

## Grep

```terminal
grep Towers movies.csv (find *Towers* inside the file)

grep -i the movies.csv ("" without case sensitive *-i*)

grep -c the movies.csv ("" number of ocurrencies inside the file *-c* *-ci*)

grep -vi towers movies.csv ("" get all values that not contain the value towers *-v* *-vi*)

wc movies.csv (count the number of lines)

wc movies.csv ("" *-l* lines | *-w* words | -c bits)
```

## Redes

```terminal
ifconfig (same as ipconfig)

curl www.google.com (show the response from internet)

curl www.google.com > index.html ("" and save the stdout in a file)

wget www.google.com (download the file from internet)

traceroute www.slogive.com (show the trace from a internet > list of computers that we use when we create a request to internet)

netstat -i (show network name)
```

## Compress

```terminal
tar -cvf {-xvf to descompress} index.tar {index.tar.gz for use Gzip} index.html (compress files *-c* compress | *-v* > verbose in terminal | *-g* use Gzip the best compress algorithm | *-f* compress a file)

zip -r index.zip index.html

unzip index.zip

rar a index.rar index.html (*a* > add files to the rar)

rar x index.rar (*x* uncompress the rar file)
```

## Process Handling

```terminal
ps (show the list of process)

kill *PID* (kill the process with the ID)

top (show the process list *h* > when the command is running to see the help)

glances (best process manager in linux)
```

## Background process to Foreground process

> First we need to create a background process, to do that just use the command `cat > anyname.anyextension` then Control + Z to put the process in background
> <br />
> Use the command `jobs` to see the process positioned in the background
> <br />
> Use the command fg with the id provided by `jobs` command.

```terminal
jobs (provide the background process id)

fg *id* (move the process to the foreground)
```

## Text editors

> Just use nano, vim sucks.
