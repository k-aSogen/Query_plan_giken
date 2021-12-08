# SQL実行計画チュートリアル

## 環境構築コマンド手順(前提としてDockerを導入していること)

### 1.Docker composeを起動して新たにコンテナを立ち上げる <br>
```
docker-compose up -d
```

### 2.立ち上げたコンテナに同ディレクトリ内にあるdvdrental.zipをコピーする <br>
```
docker cp dvdrental.zip postgres:/
```
### 3.コンテナ内にコピーしたdvdrental.zipを解凍する <br>

```
docker exec -it postgres unzip dvdrental.zip
```

### 4.コンテナ内のpostgreSQLを起動,dvdrentalを作成する。 <br> 
```
docker exec -it postgres psql

CREATE DATABASE dvdrental;
```

### 5.コンテナ内でdvdrental.tarに記載してあるサンプルデータ作成SQLを実行する <br> 
```
docker exec -it postgres pg_restore -U root -d dvdrental dvdrental.tar 
```
