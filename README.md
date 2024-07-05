# effect_analyzer

## インタプリタの使い方
```
$ dune build
```
**末尾に;;をつけない場合は評価できないので注意**

### コンソールから入力
```
$ ./_build/default/src/eval.exe
do h <- handler { return x -> return x, reverse (x;k) -> k false } in 
do h2 <- handler { return x -> reverse(false;z. return z), eff(x;k) -> k x } in
with h handle with h2 handle eff(true;y. return y);;
```

### ファイルから入力
```
$ ./_build/default/src/eval.exe filepath
```

## 開発関連
lexer
```
ocamllex src/lexer.mll
```

parser 
```
menhir src/parser.mly
```