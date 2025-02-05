go
use WorldEvents
go
select count (*) as [Number of events],max(EventDate),min(Eventdate) from
tblEvent

go 
use [Music_01]
go
select Artist_Type,count(*) from Artist
group by Artist_type

go
use WorldEvents
go
 select 
 UPPER (left (c.CategoryName,1)) as [Category Initial],
 count(*) as [number of initials],
 format (
 avg (
 cast (
 LEN(e.EventName ) as float)
 )	
 ,'0.00'
 ) AS 'Average event name lenght'
 
 from 
 tblCategory as c
 Inner Join tblEvent as e
 on c.CategoryID=e.CategoryID
 group by 
 upper(left(c.CategoryName,1))
 order by 
 'Category initial'



 go
USE Movies_02
go
select 
 f.Title,
 s.Source
 from Film as f
 join Source as s on
 f.SourceID=s.SourceID
 where s.Source='NA'
 order by 
 f.Title


 --2
 go
 use WorldEvents
 go
 

SELECT


cy.CountryName AS Country,

ev.EventName AS [What happened],

ev.EventDate AS [When happened]

FROM

tblCountry AS cy

INNER JOIN tblEvent AS ev

ON cy.CountryID = ev.CountryID

ORDER BY
[When happened]
---3


select tblAuthor.AuthorName,

tblEpisode.Title,

tblEpisode.EpisodeType

from tblAuthor

inner join  tblEpisode on 
tblAuthor.AuthorID=tblEpsiode.AuthorID
where
tblEpisode.EpisodeType like'%special'
order by 
tblEpisode.Title

