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
	album_id integer references albums(id)
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

