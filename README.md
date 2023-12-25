Support Apple Silicon only.

```
$ cd ./template
$ ./setup.sh RGB
$ cd ../RGB
$ echo 'document.body.style.background = "rgb("+((Math.random()*255)>>0)+","+((Math.random()*255)>>0)+","+((Math.random()*255)>>0)+")";' > main.js
$ ./build.sh
$ open ./RGB.saver
```

