--Запрос 1

select name as style_name, count(*) as count_artist
from styles s
inner join styleartist sty on id = sty.styles_id 
group by name, s.id 
order by count_artist desc; 

--Запрос 2

select count(*) as count_track
from track
join albums on album_id = albums.id 
where albums.data_publicate between '2019-01-01' and '2020-12-31'

--Запрос 3

select avg(duration) as avg_dur, album_name
from track as t 
right join albums as a on t.album_id = a.id 
group by a.album_name, a.id 
order by avg_dur desc; 

--Запрос 4

select artists.name
from artists 
where artists.name not in ( select artists.name 
							from artists
							join artistalbums on artists.id = artistalbums.artist_id 
							join albums on artistalbums.albums_id = albums.id 
							where albums.data_publicate between '2020-01-01' and '2020-12-31' );

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

select albums.album_name as album_name
from albums 
join artistalbums on albums.id = artistalbums.albums_id 
join artists on artistalbums.artist_id = artists.id 
join styleartist on artists.id = styleartist.artists_id 
join styles on styleartist.styles_id = styles.id 
group by album_name
having count(styles.name) > 1


--Запрос 7

select track.name as track_name
from track
left join collectiontrack on track.id = collectiontrack.track_id 
left join collection on collectiontrack.collection_id = collection.id 
where collection.name is null


--Запрос 8

select artists.name as artist_name
from artists
join artistalbums on artists.id = artistalbums.artist_id 
join albums on artistalbums.albums_id = albums.id 
join track on albums.id = track.album_id 
group by artists.name, track.duration 
having track.duration = ( select min(track.duration) from track )

--Запрос 9

select albums.album_name 
from albums
join track on albums.id = track.album_id
group by albums.album_name 
having count(track.id) = ( select count(track.id) as count_track
							from albums
							join track on albums.id = track.album_id 
							group by albums.album_name 
							order by count_track asc
							limit 1);


 




