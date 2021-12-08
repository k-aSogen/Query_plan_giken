# SQL実行計画チュートリアル

## コマンド手順

### 1.Docker composeを立ち上げる <br>
```
docker-compose up -d
```

### 2.立ち上げたコンテナにdvdrental.zipをコピーする <br>
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

### 5.dvdrental.tar をしてコンテナ内でサンプルデータ作成SQLを実行する <br> 
```
pg_restore -U postgres -d dvdrental dvdrental.tar  
```
