Support Apple Silicon only.

##### setup

```
$ cd ./template
$ ./setup.sh RGB
```

##### test

```
$ cd ../RGB
$ echo 'document.body.style.background = "rgb("+((Math.random()*255)>>0)+","+((Math.random()*255)>>0)+","+((Math.random()*255)>>0)+")";' > main.js
$ ./build.sh
$ open ./RGB.saver
```

