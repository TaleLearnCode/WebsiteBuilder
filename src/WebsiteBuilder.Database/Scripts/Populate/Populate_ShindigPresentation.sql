SET IDENTITY_INSERT dbo.ShindigPresentation ON
GO

MERGE dbo.ShindigPresentation AS TARGET
USING (VALUES
              -- Building Event-Driven Microservices
              (  1, 22,  1, '2022-04-07 13:55', '2022-04-07 14:55', 'EDT', 'Ballroom B'),        -- CodeStock
              (  2, 19,  1, '2022-06-07 11:00', '2022-06-07 11:00', 'CDT', 'Imagination B'),     -- dev up
              (  3, 15,  1, '2022-07-27 14:30', '2022-07-27 15:30', 'CDT', 'Room H'),            -- THAT Wisconsin
              (  4, 11,  1, '2022-09-17 11:15', '2022-09-17 12:15', 'EDT', 'Room 104'),          -- Atlanta Developers' Conference
              (  5, 10,  1, '2022-10-03 09:45', '2022-10-03 10:45', 'CDT', 'Lombardy'),          -- Prairie Dev Con - Regina
              (  6,  8,  1, '2022-10-19 09:35', '2022-10-19 10:35', 'EDT', 'Hamilton'),          -- Indy.Code
              (  7,  7,  1, '2022-10-20 15:10', '2022-10-20 16:10', 'EDT', 'Ballroom D'),        -- Momentum Developer Conference
              (  8,  5,  1, '2022-11-07 15:30', '2022-11-07 16:30', 'CST', 'A3'),                -- Prairie Dev Con - Winnipeg
              
              -- Time Traveling Data
              (  9, 56, 2, '2019-11-15 11:30', '2019-11-15 12:30', 'EST', 'Rosewood'),           -- TechBash
              ( 10, 14, 2, '2022-08-06 14:00', '2022-08-06 15:00', 'EDT', '255'),                -- Beer City Code
              ( 11, 13, 2, '2022-08-09 15:30', '2022-08-09 16:30', 'CDT', '2201'),               -- KCDC
              ( 12,  5, 2, '2022-11-08 14:15', '2022-11-08 15:15', 'CST', 'A3'),                 -- Prairie Dev Con Winnipeg

              -- Building Microservice REST APIs Using Azure Functions
              ( 13,  4, 3, '2022-11-10 11:30', '2022-11-10 12:30', 'EST', 'Suite 10'),           -- TechBash
              ( 14, 16, 3, '2022-07-22 09:00', '2022-07-22 09:45', 'EDT', 'Ballroom'),           -- Scenic City Summit
              ( 15, 19, 3, '2022-06-07 08:30', '2022-06-07 09:30', 'CDT', 'Imagination A'),      -- dev up
              ( 16, 20, 3, '2022-05-06 13:00', '2022-05-06 14:00', 'EDT', 'Daugherty'),          -- Stir Trek
              ( 17, 21, 3, '2022-04-28 19:00', '2022-04-28 21:00', 'EDT', 'Modis'),              -- Louisville .NET Meetup

              -- The Taming of the API
              ( 18,  8, 4, '2022-10-19 14:30', '2022-10-19 15:30', 'EDT', 'Sycamore'),           -- Indy.Code()
              ( 19, 14, 4, '2022-08-06 16:00', '2022-08-06 16:00', 'EDT', 'Room 222'),           -- Beer City Code
              ( 20, 18, 4, '2022-07-15 14:30', '2022-07-15 15:30', 'CDT', 'Yankee Hill'),        -- Nebraska.Code()
              ( 21, 19, 4, '2022-06-08 16:00', '2022-06-08 17:00', 'CDT', 'Imagination C & D'),  -- dev up
              ( 22, 22, 4, '2022-04-07 13:55', '2022-04-07 14:55', 'EDT', 'Ballroom B'),         -- Ballroom B

              -- Advanced Serverless Workshop
              ( 23,  9, 5, '2022-10-17 09:00', '2022-10-17 17:00', 'CEST', 'TBA'),               -- Serverless Architecture Conference - Berlin
              ( 24,  3, 5, NULL, NULL, 'BST', NULL),                                             -- Serverless Architecture Conference - London

              -- File New: Build a Event-Driven Architected Microservice from Scratch
              ( 25,  3, 8, NULL, NULL, 'BST', NULL),                                             -- Serverless Architecture Conference - London

              -- Secrets of Conflict Resolution
              ( 26, 96, 9, '2016-05-20 14:15', '2016-05-20 15:15', 'CDT', 'Auditorium'),             -- Nebraska.Code()
              ( 27, 97, 9, '2016-09-27 18:00', '2016-09-27 19:30', 'EDT', 'MAX Technical Training'), -- CINNUG
              ( 28, 92, 9, NULL, NULL, 'EDT', NULL),                                                 -- CodeStock
              ( 29, 65, 9, NULL, NULL, 'CDT', NULL),                                                 -- Music City Tech
              ( 30, 72, 9, '2019-06-01 14:00', '2019-06-01 14:50', 'EDT', 'Room 252'),               -- Beer City Code
              ( 31, 71, 9, '2019-06-06 18:00', '2019-06-06 19:30', 'EDT', 'TEKsystems'),             -- Louisville Tech Ladies
              ( 32, 12, 9, '2022-09-08 18:30', '2022-09-08 20:00', 'CDT', 'Online'),                 -- Tulsa .NET User Group
              ( 33, 10, 9, '2022-10-04 13:00', '2022-10-04 14:00', 'CDT', 'Tuscany'))                -- Prairie Dev Con - Regina

              ---- Going Schema-less: How to migrate a relational database to a NoSQL database
              --( 34,  14, 15, '2022-07-26 16:00', '2022-07-26 17:00', 'CDT', 'Room H'),                -- THAT
              --( 35,  98, 15, '2021-10-15 15:10', '2021-10-15 16:10', 'EDT', 'Breakout Three'),        -- Momentum Developer Conference
              --( 36,  99, 15, '2021-10-09 13:00', '2021-10-09 14:00', 'EDT', '207'),                   -- Atlanta Code Camp
              --( 37,  25, 15, '2021-09-17 14:15', '2021-09-17 15:15', 'CDT', '2211'),                  -- KCDC
              --( 38, 100, 15, '2021-07-27 19:30', '2021-07-27 21:30', 'CDT', 'Online'),                -- Tulsa .NET User Group
              --( 39,  29, 15, '2021-07-27 15:30', '2021-07-27 16:30', 'CDT', 'Hybrid'),                -- THAT
              --( 40,  30, 15, '2021-07-14 15:45', '2021-07-14 16:15', 'CDT', '105'))                   -- Nebraska.Code



AS SOURCE (ShindigPresentationId,
           ShindigId,
           PresentationId,
           StartDateTime,
           EndDateTime,
           TimeZone,
           Room)
ON TARGET.ShindigPresentationId = SOURCE.ShindigPresentationId
WHEN MATCHED THEN UPDATE SET TARGET.ShindigId     = SOURCE.ShindigId,
                             TARGET.PresentationId = SOURCE.PresentationId,
                             TARGET.StartDateTime  = SOURCE.StartDateTime,
                             TARGET.EndDateTime    = SOURCE.EndDateTime,
                             TARGET.TimeZone       = SOURCE.TimeZone,
                             TARGET.Room           = SOURCE.Room
WHEN NOT MATCHED THEN INSERT (ShindigPresentationId,
                              ShindigId,
                              PresentationId,
                              StartDateTime,
                              EndDateTime,
                              TimeZone,
                              Room)
                      VALUES (SOURCE.ShindigPresentationId,
                              SOURCE.ShindigId,
                              SOURCE.PresentationId,
                              SOURCE.StartDateTime,
                              SOURCE.EndDateTime,
                              SOURCE.TimeZone,
                              SOURCE.Room)
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT dbo.ShindigPresentation OFF
GO