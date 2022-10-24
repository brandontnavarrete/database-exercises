USE albums_db;

SELECT * FROM albums;

SELECT name,
		release_date from albums;
		
select name from albums
where artist = "Pink Floyd";

select release_date from albums
where name = 'Sgt. pepper''s'' Lonely Hearts Band';

select genre from albums
where name Like 'Nevermind';

select name from albums
	where release_date Between 1990 AND 1999;
	
	SELECT * FROM albums;
	
Select sales,
 			name from albums 
				where sales <20;

/*
3.)
a. 31
b. 23
c. id
d. youngest album is 21 in year 2011
   oldest is sgt. pepper's lonley hearts.. in 1967
   
4.)
a. select name from albums
where artist = "Pink Floyd";
#The Dark Side of the Moon
#The Wall

b. 1967

c. Grunge, Alternative rock

d.
The Bodyguard,
Jagged Little Pill,
Come On Over,
Falling into You,
Let's Talk About Love,
Dangerous,
The Immaculate Collection,
Titanic: Music from the Motion Picture,
Metallica,
Nevermind,
Supernatural,

e.
14.4	Grease: The Original Soundtrack from the Motion Picture
19.3	Bad
13.1	Sgt. Pepper's Lonely Hearts Club Band
17.9	Dirty Dancing
19.3	Let's Talk About Love
16.3	Dangerous
19.4	The Immaculate Collection
14.4	Abbey Road
19.6	Born in the U.S.A.
17.7	Brothers in Arms
18.1	Titanic: Music from the Motion Picture
16.7	Nevermind
17.6	The Wall

f. Because i only queried "LIKE ROCK"
15	The Beatles	Sgt. Pepper's Lonely Hearts Club Band	1967	13.1	Rock	Sgt. Pepper's Lonely Hearts Club Band
20	The Beatles	1	2000	22.6	Rock	1
23	The Beatles	Abbey Road	1969	14.4	Rock	Abbey Road
24	Bruce Springsteen	Born in the U.S.A.	1984	19.6	Rock	Born in the U.S.A.
30	Santana	Supernatural	1999	20.5	Rock	Supernatural



*/
Select *,
	name from albums
		where genre LIKE 'rock'; 


