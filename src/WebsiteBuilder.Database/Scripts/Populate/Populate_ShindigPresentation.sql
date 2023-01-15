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
              ( 33, 10, 9, '2022-10-04 13:00', '2022-10-04 14:00', 'CDT', 'Tuscany'),                -- Prairie Dev Con - Regina
              (135,  1, 9, '2023-03-23 14:45', '2023-03-23 16:00', 'PDT', NULL),                     -- VSLive Las Vegas 2023

              -- Going Schema-less: How to migrate a relational database to a NoSQL database
              ( 34,  14, 14, '2022-07-26 16:00', '2022-07-26 17:00', 'CDT', 'Room H'),                -- THAT
              ( 35,  98, 14, '2021-10-15 15:10', '2021-10-15 16:10', 'EDT', 'Breakout Three'),        -- Momentum Developer Conference
              ( 36,  99, 14, '2021-10-09 13:00', '2021-10-09 14:00', 'EDT', '207'),                   -- Atlanta Code Camp
              ( 37,  25, 14, '2021-09-17 14:15', '2021-09-17 15:15', 'CDT', '2211'),                  -- KCDC
              ( 38, 100, 14, '2021-07-27 19:30', '2021-07-27 21:30', 'CDT', 'Online'),                -- Tulsa .NET User Group
              ( 39,  29, 14, '2021-07-27 15:30', '2021-07-27 16:30', 'CDT', 'Hybrid'),                -- THAT
              ( 40,  30, 14, '2021-07-14 15:45', '2021-07-14 16:15', 'CDT', '105'),                   -- Nebraska.Code

              -- Technical Debt Is Not Free
              ( 41,  16, 15, '2022-07-22 14:00', '2022-07-22 14:45', 'EDT', 'Ballroom'),                  -- Scenic City Summit
              ( 42,  17, 15, '2022-08-20 19:00', '2022-07-20 20:30', 'EDT', 'Modis'),                     -- Louisville .NET Meetup (July 2022)
              ( 43,  18, 15, '2022-07-15 13:15', '2022-07-15 14:15', 'CDT', 'Arbor 2'),                   -- Nebraska.Code() 2022
              ( 44,  19, 15, '2022-06-08 11:00', '2022-06-08 12:00', 'CDT', 'Prosperity'),                -- dev up
              (134,   1, 15, '2023-03-23 11:00', '2023-03-23 12:15', 'PDT', NULL),                        -- VSLive Las Vegas 2023
              (135,   2, 15, '2023-04-20 16:30', '2023-04-20 17:30', 'EDT', 'Mt. Everest (Auditorium)'),  -- Inflectracon 2023

              -- Ch-ch-ch-changes: Tracing Changes in Azure Cosmos DB
              ( 45,   4, 16, '2022-11-10 14:50', '2022-11-10 15:50', 'EST', 'Kilimanjaro 8'),         -- Tech Bash
              ( 46,  19, 16, '2022-06-08 08:30', '2022-06-08 09:30', 'CDT', 'Insight'),               -- dev up
              ( 47,  26, 16, '2021-09-17 13:00', '2021-09-17 14:00', 'CDT', 'N/A'),                   -- Music City Tech
              ( 48,  25, 16, '2021-09-16 14:30', '2021-09-16 15:30', 'CDT', '2209'),                  -- KCDC
              ( 49,  42, 16, '2020-10-13 18:00', '2020-10-13 19:30', 'EDT', 'N/A'),                   -- Hampton Roads .NET User Group

              -- What’s New for C# Developers
              ( 50, 101, 17, '2021-11-17 19:00', '2021-11-17 20:30', 'EST', 'Modis'),                 -- Louisville .NET Meetup
              ( 51,  23, 17, '2021-11-30 18:15', '2021-11-30 20:00', 'CST', 'N/A'),                   -- Tulsa .NET User Group
              ( 52, 102, 17, '2021-12-13 10:30', '2021-12-13 11:30', 'EST', 'N/A'),                   -- Glennis Solutions

              -- Software Craftsmanship for New Developers
              ( 53, 103, 18, '2021-10-11 18:30', '2021-10-11 19:30', 'CDT', 'Online'),                 -- Nashville Women Programmers
              ( 54, 104, 18, '2021-07-22 19:00', '2021-07-22 20:30', 'EDT', 'Modis'),                  -- Louisville .NET Meetup
              ( 55,  30, 18, '2021-07-15 14:30', '2021-07-15 15:30', 'CDT', 'Arbor 1'),                -- Nebraska.Code()
              ( 56,  70, 18, '2019-06-28 12:00', '2019-06-28 13:30', 'EDT', 'N/A'),                    -- Software Guild
              ( 57,  77, 18, '2019-01-22 18:00', '2019-01-22 19:30', 'EST', 'Waystar'),                -- Tech Foundations Louisville

              -- Serverless in Action
              ( 58, 105, 19, '2021-10-07 18:00', '2021-10-07 19:30', 'EDT', 'Online'),                 -- Roanoke Valley .NET User Group
              ( 59,  56, 19, '2019-11-14 16:00', '2019-11-14 17:00', 'EST', 'Aloeswood'),              -- TechBash
              ( 60,  59, 19, '2019-10-11 16:00', '2019-10-11 17:00', 'EDT', 'Ballroom 4'),             -- DevSpace
              ( 61,  61, 19, '2019-10-04 13:15', '2019-10-04 14:00', 'EDT', '11'),                     -- Scenic City Summit
              ( 62,  76, 19, '2019-04-13 13:50', '2019-04-13 14:50', 'EDT', 'N/A'),                    -- CodeStock
              ( 63,  79, 19, '2019-01-11 14:45', '2019-01-11 15:45', 'EDT', 'N/A'),                    -- CodeMash
              ( 64,  83, 19, '2018-10-04 15:20', '2019-10-04 16:20', 'EDT', 'N/A'),                    -- DogFoodCon
              ( 65,  85, 19, '2018-08-31 10:00', '2018-08-31 11:00', 'EDT', 'N/A'),                    -- CoderCruise
              ( 66,  90, 19, '2018-05-04 13:00', '2018-05-04 14:00', 'EDT', 'N/A'),                    -- StirTrek
              ( 67,  93, 19, '2018-04-19 19:00', '2018-04-19 20:30', 'EDT', 'N/A'),                    -- Louisville .NET Meetup

              -- Event-Driven Architecture in the Cloud
              ( 68, 106, 20, NULL, NULL, 'CDT', NULL),                                                 -- Praire.Code()
              ( 69,  26, 20, '2021-09-16 11:00', '2021-09-16 12:00', 'CDT', 'N/A'),                    -- Music City Tech
              ( 70,  27, 20, '2021-09-09 08:45', '2021-09-09 09:45', 'CDT', 'Online'),                 -- DevSpace
              ( 71,  28, 20, '2021-07-30 16:00', '2021-07-30 17:00', 'CDT', 'Marquis-Ascendum'),       -- CincyDeliver
              ( 72,  37, 20, '2020-12-15 18:00', '2020-12-15 19:30', 'CST', 'Online'),                 -- Dallas & Austin Azure Meetup
              ( 73,  48, 20, NULL, NULL, NULL, NULL),                                                  -- Boston Code Camp 33
              ( 74,  56, 20, '2019-11-13 16:00', '2019-11-13 17:00', 'EST', 'Sagewood'),               -- TechBash
              ( 75,  57, 20, '2019-10-17 19:00', '2019-10-17 20:30', 'EDT', 'Modis'),                  -- Louisville .NET Meetup
              ( 76,  58, 20, '2019-10-16 08:00', '2019-10-16 09:00', 'CDT', 'Discovery B'),            -- devup
              ( 77,  60, 20, '2019-10-10 11:00', '2019-10-10 11:00', 'CDT', 'Ballroom B'),             -- Little Rock Tech Fest

              -- The Hitchhiker's Guide to the Cosmos
              ( 78, 107, 21, NULL, NULL, NULL, NULL),                                                  -- European Cloud Conference
              ( 79,  26, 21, '2021-09-17 11:00', '2021-09-17 12:00', 'CDT', 'Online'),                 -- Music City Tech
              ( 80,  34, 21, '2021-03-16 18:00', '2021-03-16 19:30', 'CST', 'Online'),                 -- Dallas & Austin Azure Meetup
              ( 81,  44, 21, '2020-10-03 09:00', '2020-10-03 10:00', 'CDT', 'Online'),                 -- TDevConf
              ( 82,  48, 21, NULL, NULL, NULL, NULL),                                                  -- Boston Code Camp 33
              ( 83,  51, 21, NULL, NULL, NULL, NULL),                                                  -- Ignite the Tour Chicago
              ( 84,  54, 21, '2020-02-07 13:45', '2020-02-07 14:30', 'EST', 'Theater 1'),              -- Ignite the Tour Government
              ( 85,  59, 21, '2019-10-12 13:00', '2019-10-12 14:00', 'CST', 'Ballroom 3'),             -- DevSpace
              ( 86,  63, 21, '2019-09-14 15:45', '2019-09-14 16:45', 'EDT', '107'),                    -- Atlanta Code Camp

              -- Serverless Microservices: Microservices without Containers
              ( 87,  28, 22, '2021-07-30 13:20', '2021-07-03 14:20', 'EDT', 'Sterling'),               -- Cincy Deliver

              -- How to be a Leader
              ( 88,  33, 23, '2021-04-08 18:15', '2021-04-08 20:00', 'CDT', 'Online'),                 -- Tulsa .NET User Group
              ( 89,  65, 23, '2019-09-06 13:50', '2019-09-06 14:50', 'CDT', '186'),                    -- Music City Tech
              ( 90,  67, 23, '2019-08-15 10:00', '2019-08-15 11:00', 'CDT', 'Ardis'),                  -- Nebraska.Code()
              ( 91,  82, 23, '2018-10-13 16:00', '2018-10-13 17:00', 'CDT', 'Ballroom 4'),             -- DevSpace
              ( 92,  92, 23, '2018-04-20', '2018-04-20', 'CDT', 'N/A'),                                 -- CodeStock

              -- Intro to Azure Communication Services
              ( 93,  35, 24, '2021-03-15 18:00', '2021-03-15 19:30', 'EDT', 'Online'),                 -- Columbus App Dev User Group

              -- Building a .NET Application Using Azure Cosmos DB
              ( 94, 36, 25, '2021-03-16 18:00', '2021-03-16 19:30', 'CST', 'Online'),                  -- Dallas & Austin Azure Meettup
              ( 95, 39, 25, '2020-11-09 18:15', '2020-11-09 20:30', 'CDT', 'Online'),                  -- Tulsa .NET User Group

              -- Graphing Your Way Through the Cosmos
              ( 96, 38, 26, '2020-11-14', '2020-11-14', 'EST', 'Online'),                              -- Granite State Code Camp
              ( 97, 43, 26, '2020-10-14 13:40', '2020-10-14 14:40', 'UTC+11', 'Room 5'),               -- NDC Sydney
              ( 98, 50, 26, NULL, NULL, NULL, NULL),                                                   -- Code Stock
              ( 99, 51, 26, NULL, NULL, NULL, NULL),                                                   -- Microsoft Ignite the Tour Chicago
              (100, 52, 26, NULL, NULL, NULL, NULL),                                                   -- Orlando Code Camp
              (101, 53, 26, '2020-02-29 13:20', '2020-02-29 14:20', 'EST', '2072'),                    -- South Florida Developers Conference
              (102, 54, 26, '2020-02-06 12:05', '2020-02-06 12:25', 'EST', 'Theater 3'),               -- Microsoftf Ignite the Tour Government
              (103, 55, 26, '2020-01-09 11:45', '2020-01-09 12:45', 'EST', 'Salon A'),                 -- CodeMash
              (104, 56, 26, '2019-11-15 09:00', '2019-11-15 10:00', 'EST', 'Aloeswood'),               -- TechBash
              (105, 62, 26, '2019-10-03 11:00', '2019-10-03 12:00', 'EDT', 'Polaris'),                 -- DogFoodCon

              -- Which Microsoft Framework Am I Supposed to Use
              (106, 86, 27, '2018-07-12 08:45', '2018-07-12 09:45', 'CDT', NULL),                      -- KCDC
              (107, 94, 27, '2018-02-15 19:00', '2018-02-15 20:30', 'EDT', 'Modis'),                   -- Louisville .NET Meetup
              (108, 95, 27, '2018-02-15 11:30', '2018-02-15 13:00', 'CDT', 'Browning Room B'),         -- Evansville Technology Group

              -- Chad and Ed’s Excellent Adventure!
              (109, 89, 28, '2018-05-18 19:00', '2018-05-18 20:30', 'EDT', 'Modis'),                   -- Louisville .NET Meetup

              -- .NET Conf Keynote Review
              (110, 84, 29, '2018-10-02 18:00', '2018-10-02 21:00', 'EDT', 'Atria Training Room'),     -- Louisville .NET Meetup

              -- Building Great Libraries with .NET Standard
              (111, 67, 30, '2019-08-16 15:15', '2019-08-16 16:15', 'CDT', 'Osborne'),                 -- Nebraska.Code 2019
              (112, 65, 30, '2019-09-07 09:00', '2019-09-07 10:00', 'CDT', '178'),                     -- Music City Tech 2019
              (113, 64, 30, '2019-09-13 13:15', '2019-09-13 14:15', 'CDT', 'Ballroom North'),          -- Prairie.Code() 2019

              -- Building an Ultra-Scalable API Using Azure Functions
              (114, 61, 31, '2019-10-04 09:30', '2019-10-04 10:15', 'EDT', '12'),                      -- Scenic City Summit 2019
              (115, 83, 31, '2018-10-05 14:10', '2018-10-05 15:10', 'EDT', NULL),                      -- DogFoodCon 2018

              -- Delivering Real-Time Data with Azure
              (116, 58, 32, '2019-10-16 13:00', '2019-10-16 14:00', 'CDT', 'Discovery A'),             -- DevUp 2019
              (117, 53, 32, '2020-02-29 14:40', '2020-02-29 15:40', 'EST', '2072'),                    -- South Florida Developers Conference 2020
              (118, 52, 32, '2020-03-28 13:10', '2020-03-28 14:10', 'EDT', 'Room 6'),                  -- Orlando Code Camp & Technical Conference 2020

              -- Azure Durable Functions for Serverless .NET Orchestration
              (119, 75, 33, '2019-05-26 08:30', '2019-05-26 09:30', 'EDT', NULL),                      -- Stir Trek 2019
              (120, 39, 33, '2020-05-01 13:15', '2020-05-01 14:15', 'CDT', 'Wabash'),                  -- Indy.Code() 2020

              -- Azure Services Every Developer Needs to Know
              (121, 78, 34, '2019-01-17 19:00', '2019-01-17 20:30', 'EST', NULL),                      -- Louisville .NET Meetup January 2019

              -- Building Hyper-Scaled Event-Processing Solutions in Azure
              (122, 58, 35, '2019-10-16 10:30', '2019-10-16 11:30', 'CDT', 'Discovery B'),             -- dev up 2019

              -- Getting Gremlins to Improve Your Data
              (123,  72, 36, '2019-05-31 09:00', '2019-05-31 17:00', 'EDT', NULL),                      -- Beer City Code 2019
              (124,  65, 36, '2019-09-05 08:00', '2019-09-05 14:00', 'CDT', '183'),                     -- Music City Tech 2019
              (125, 107, 36, NULL, NULL, 'CEST', NULL),                                                 -- European Cloud Conference

              -- Getting Started with Azure SQL Database
              (126,  87, 37, '2018-06-02 09:30', '2018-06-02 10:30', 'EDT', NULL),                      -- Pittsburg TechFest 2018
              (127,  76, 37, '2019-04-12 10:30', '2019-04-12 11:30', 'CDT', NULL),                      -- CodeStock 2019
              (128,  73, 37, '2018-05-14 11:20', '2018-05-14 12:20', 'EDT', NULL),                      -- DotNetSouth 2019
              (129,  69, 37, '2019-07-18 10:00', '2019-07-18 11:00', 'CDT', NULL),                      -- KDCDC 2019

              -- Getting Started with Azure DevOps
              (130,  81, 38, '2018-12-13 11:30', '2018-12-13 12:30', 'CST', NULL),                      -- Evansville Technology Group - December 2018
              (131,  80, 38, '2018-12-20 19:00', '2018-12-20 20:30', 'EST', 'Modis'),                   -- Louisville .NET Meetup - December 2018
              (132,  73, 38, '2019-05-13 11:20', '2019-05-13 12:20', 'EDT', NULL),                      -- DotNetSouth
              (133,  68, 38, '2019-07-26 13:00', '2019-07-26 14:00', 'EDT', 'Carolina')                 -- Cincy Deliver 2019


)
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