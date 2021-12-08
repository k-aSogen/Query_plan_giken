
--EXPLAIN文
EXPLAIN select * from actor;


--ANALYZE オプション
EXPLAIN ANALYZE select * from actor;
/*
「ANALYZE」オプションを使用することで、予想コストに加え、実際にかかった処理時間等の情報も確認できる。
(※ ANALYZEオプションを付与すると、実際にクエリが実行されてしまうため、
INSERT文や、DELETE文などを行う際は注意が必要。)

actual time：処理時間を表す
rows：実行結果として、実際に戻ってきた行数を表す
loops：ステップの実行回数を表す
Planning time：解析されたクエリから実行計画を生成し、最適化するのに要した時間
Execution time：実行時間を表す
*/


--「FORMAT」オプション
EXPLAIN (FORMAT JSON) select * from actor;




EXPLAIN select * from address inner join city ON address.city_id=city.city_id ORDER BY city.city_id ASC;





/*
実行計画で得た処理コストの確認方法

■結果
Seq Scan on actor (cost=0.00..4.00 rows=200 width=25)

■見方
一行目の「cost=」の後にある「0.00」：始動コスト、
後半の「..」の後にある「4.00」：総コスト
「rows=」の後にある「200」：行数
「width=」の後にある「25」：行の長さ

始動コスト:一件目のデータを返すのにかかる想定のコストを表す
総コスト:処理完了までにかかる想定のコストを表す
行数：プランナによって見積もられた、ノード実行によって返却される行数を表す
(※実際に取得した結果の行数ではありません。)
行の長さ：上記同様プランナによって見積もられた、ノードの実行によって返却される行の平均の長さを表す
*/