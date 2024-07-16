# effect_analyzer

## インタプリタ/アナライザの使い方
```
$ dune build
```
**末尾に;;をつけない場合は評価できないので注意**

## インタープリタの場合

### コンソールから入力
```
$ ./_build/default/src/interpriter.exe
do h <- handler { return x -> return x, reverse (x;k) -> k false } in 
do h2 <- handler { return x -> reverse(false;z. return z), eff(x;k) -> k x } in
with h handle with h2 handle eff(true;y. return y);;
```

### ファイルから入力
```
$ ./_build/default/src/interpriter.exe filepath
```

## アナライザの場合

### コンソールから入力
```
$ ./_build/default/src/analyzer.exe
do h <- handler { return x -> return x, reverse (x;k) -> k false } in 
do h2 <- handler { return x -> reverse(false;z. return z), eff(x;k) -> k x } in
with h handle with h2 handle eff(true;y. return y);;
```

### ファイルから入力
```
$ ./_build/default/src/analyzer.exe filepath
```