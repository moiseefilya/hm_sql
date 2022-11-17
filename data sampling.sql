--Запрос 1

select name as style_name, count(*) as count_artist
from styles s
inner join styleartist sty on id = sty.styles_id 
group by name, s.id 
order by count_artist desc; 

--Запрос 2

select count(name)
from track
where album_id = (select id from albums where data_publicate >= '2019-01-01' and data_publicate <= '2020-12-31');

--Запрос 3

select avg(duration) as avg_dur, album_name
from track as t 
right join albums as a on t.album_id = a.id 
group by a.album_name, a.id 
order by avg_dur desc; 

--Запрос 4

select name
from artists as art  
join albums as alb on alb.id = art.id 
where alb.data_publicate < '2020-01-01' or alb.data_publicate > '2021-01-01'
group by name, art.id;

--Запрос 5 

select c.name as name_collection
from collection as c 
join collectiontrack as ct on c.id = ct.collection_id 
join track as t on ct.track_id = t.id 
join albums as alb on t.album_id = alb.id 
join artistalbums as aa on alb.id = aa.albums_id 
join artists as art on aa.artist_id = art.id 
where art.name like 'ATL';

--Запрос 6

select art_alb.album_name
from (
	select artists.id as id, artists.name as artist_name, count(*) as count_styles
	from styleartist
	join styles on styles_id = styles.id
	join artists on artists_id = artists.id
	group by artists.id, artists.name
) as art_sty
join (
	select artists.id as artist_id, albums.id as album_id, albums.album_name as album_name
	from artistalbums 
	join albums on albums_id = albums.id
	join artists on artist_id = artists.id
) as art_alb on art_alb.artist_id = art_sty.id
where art_sty.count_styles > 1

--Запрос 7

select track.name
from (
	select track.id as track_id, collection.id as col_id, track.name as track_name
	from collectiontrack 
	join collection on collection_id = collection.id 
	join track on track_id = track.id 
	group by track.id, collection.id, track.name
) as col_track
full outer join track on track_id = track.id 
where track_id is null 

--Запрос 8

select art_alb.art_name
from (
	select artists.id as art_id, albums.id as alb_id, artists.name as art_name
	from artistalbums
	join artists on artist_id = artists.id 
	join albums on albums_id = albums.id 
	group by artists.id, albums.id, artists.name
) as art_alb
join track on art_alb.alb_id = track.album_id
where duration = ( select min(duration) from track )

--Запрос 9

select alb_track.album_name
from (
	select albums.id, albums.album_name, count(track.id) as count_track
	from track
	join albums on track.album_id = albums.id
	group by albums.id, albums.album_name
	having count(track.id) = -- select запрос на min(count_track)
	order by count_track desc
) as alb_track
group by alb_track.album_name, alb_track.count_track


 




