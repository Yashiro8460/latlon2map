# latlon2map

![test](https://github.com/Yashiro8460/latlon2map/actions/workflows/test.yml/badge.svg)

このコマンドは標準入力から緯度と経度（空白区切り）を読み込み、その地点のGoogleマップのURLを標準出力へ出力するコマンドとなっている。

## インストール

```
$ git clone https://github.com/Yashiro8460/latlon2map.git
$ cd latlon2map
```

## 使用方法

### 1行の座標を変換

```
$ echo 35.6812 139.7671 | ./latlon2map
https://www.google.com/maps?q=35.6812,139.7671
```

### 複数行の座標を変換

```
$ printf "35.6812 139.7671\n36.0835 140.0764\n" | ./latlon2map
https://www.google.com/maps?q=35.6812,139.7671
https://www.google.com/maps?q=36.0835,140.0764
```

## 仕様

- 標準入力の各行について、空白区切りの「緯度 経度」を受け取る。
- 緯度は `-90` から `90`、経度は `-180` から `180` の範囲に対応している。
- 以下の入力があった場合は、標準エラー出力にエラーメッセージを出力し、終了ステータス `1` で終了する。
- エラーの対象となる入力
  - 数値以外
  - 要素数が2個以外
  - 緯度または経度が範囲外

## 必要なソフトウェア

- Python
  - テスト済みバージョン: 3.11〜3.13

## テスト環境

- Ubuntu 24.04 LTS

## ライセンス

- このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可される。
- `test.bash` の構成は、下記の講義資料（CC BY-SA 4.0 by Taro Suzuki）を参考にしている。
  - [https://github.com/tarolab-cit/lectures/tree/main/robosys2026](https://github.com/tarolab-cit/lectures/tree/main/robosys2026)
- © 2026 Takumi Yashiro
