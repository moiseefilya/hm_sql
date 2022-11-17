CREATE TABLE IF NOT EXISTS styles (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS artists (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT null
);

CREATE TABLE IF NOT EXISTS albums (
	id SERIAL primary key,
	name VARCHAR(60) not null,
	data_publicate date
);

create table if not exists track (
	id SERIAL primary key,
	name VARCHAR(60) not null,
	duration VARCHAR(60) not null,
	album_id integer references albums (id)
);
	
create table if not exists collection (
	id SERIAL primary key,
	name VARCHAR(60) not null,
	data_publicate date
);

 create table if not exists StyleArtist (
 	style_id integer references artists(id),
 	artist_id integer references styles(id),
 	constraint pk primary key (style_id, artist_id)
);

create table if not exists ArtistAlbums (
	artist_id integer references albums(id),
	albums_id integer references artists(id),
	constraint primaryk primary key (artist_id, albums_id)
);

create table if not exists CollectionTrack (
	collection_id integer references track(id),
	track_id integer references collection(id),
	constraint pkey primary key (collection_id, track_id)
);

insert into artists(name)
values(' Louis Armstrong'),('50 Cent'),('Кино'),('ATL'),('Markul'),('A$AP Rocky'),('Bob Mrley'),('BONES');

insert into styles (name)
values('Hip Hop'),('Рэп'),('Рок'),('Джаз'),('Рэгги');

insert into albums (name,data_publicate)
values('Legend','1984-01-02'),('Cest si bon','1991-03-14'),('Get Rich or Die Tryin','2003-04-24'),
('Группа крови','1988-11-14'),('Марабу','2015-06-12'),('Sense of Humans','2021-11-29'),
('Testing','2018-01-16'),('OFFLINE','2020-09-30');

insert into track (name,duration,album_id)
values('Numb','feat Ralph Castelli',8),('No Woman No Cry','disc 2',1),('Группа крови','самый популярный',4),
('Only You','jaz',2),('Wanksta','8 Mile Soundtrack',3),('Is This Love','disc 1',1),
('Changes','most popular',7),('Демоны','мой любимый',5),('Hello,Dolly','jaz',2),
('Марабу','самый популярный',5),('Cuba Libre','красивая',6),('Cheat Code','мой любимый',6),
('Prise the Lord','Da Shine',7),('P.I.M.P.','most popular',3),('Timberlake','feat Juicy J',8),
('Прохожий','3:40',4);

insert into collection (name,data_publicate)
values('Foreign','2021-03-26'),('Рэп плейлист','2022-10-12'),('Hip Hop','2020-02-25'),
('Русский','2021-12-15'),('Новинки','2022-10-31'),('Менее популярные','2021-07-10'),
('Любимые','2021-10-19'),('Микс','2009-10-16');

insert into artistalbums (artist_id, albums_id)
values(7,1),(2,3),(3,4),(4,5),(5,6),(6,7),(8,8);

insert into collectiontrack (collection_id, track_id)
values(1,1),(1,2),(1,4),(1,5),(1,6),(1,7);

select name, data_publicate from albums
where data_publicate >= '2018-01-01' and data_publicate <= '2018-12-31';

select name from collection
where data_publicate >= '2018-01-01' and data_publicate <= '2020-12-26';

select name from artists
where name not like '% %';

select name from track
where name like '%You%';

update track 
set duration = 301
where id = 1;

update track 
set duration = 185
where id IN (14, 2, 8);

update track 
set duration = 204
where id in (3, 6);

update track 
set duration = 96
where id in (10, 5, 7);

update track 
set duration = 117
where id in (11, 15);

update track 
set duration = 293
where id in (4, 16);

ALTER TABLE track ALTER COLUMN duration type int4;


update track 
set duration = 167
where id in (9, 12, 13);

select name, duration from track
where duration = (select max(duration) from track);

select name, duration from track
where duration >= 210;

insert into styleartist(style_id, artist_id)
values (4,1), (5,1), (6,1), (2,2), (8,2), (3,3), (1,5),(7,5)









