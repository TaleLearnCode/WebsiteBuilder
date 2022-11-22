SET IDENTITY_INSERT dbo.PresentationTag ON
GO

MERGE dbo.PresentationTag AS TARGET
USING (VALUES 
              -- Building Event-Driven Microservices
              (  1,  1,  1),
              (  2,  1,  2),
              (  3,  1,  3),
              (  4,  1,  4),
              (  5,  1,  5),
              (  6,  1,  6),
              (  7,  1,  7),
              (  8,  1,  8),
              (  9,  1,  9),
              ( 10,  1, 10),
              ( 11,  1, 11),
              ( 12,  1, 12),
              ( 13,  1, 13),
              ( 14,  1, 14),

              -- Time Traveling Data
              ( 15,  2,  1),
              ( 16,  2,  3),
              ( 17,  2,  7),
              ( 18,  2, 23),
              ( 19,  2, 24),
              ( 20,  2, 25),
              ( 21,  2, 26),
              ( 22,  2, 27),

              -- Building Microservice REST APIs Using Azure Functions
              ( 23,  3,  1),
              ( 24,  3,  2),
              ( 25,  3,  3),
              ( 26,  3,  4),
              ( 27,  3,  7),
              ( 28,  3,  8),
              ( 29,  3,  9),
              ( 30,  3, 28),
              ( 31,  3, 29),
              ( 32,  3, 11),
              ( 33,  3, 13),
              ( 33,  3, 30),
              ( 34,  3, 31),
              ( 35,  3, 14),
              ( 36,  3, 10),

              -- The Taming of the API
              ( 37,  4,  1),
              ( 38,  4, 32),
              ( 39,  4,  2),
              ( 40,  4,  3),
              ( 41,  4,  4),
              ( 42,  4,  7),
              ( 43,  4,  8),
              ( 44,  4,  9),
              ( 45,  4, 10),
              ( 46,  4, 11),
              ( 47,  4, 12),
              ( 48,  4, 14),

              -- Advanced Serverless Workshop
              ( 49,  5, 14),
              ( 50,  5,  4),
              ( 51,  5, 33),
              ( 52,  5, 34),

              -- File New: Build a Fully-Managed and Documented API
              ( 53,  6,  1),
              ( 54,  6, 32),
              ( 55,  6,  2),
              ( 56,  6,  3),
              ( 57,  6,  4),
              ( 58,  6,  7),
              ( 59,  6,  8),
              ( 60,  6,  9),
              ( 61,  6, 10),
              ( 62,  6, 11),
              ( 63,  6, 12),
              ( 64,  6, 14),

              -- File New: Build a Serverless Microservices from Scratch
              ( 65,  7,  1),
              ( 66,  7,  2),
              ( 67,  7,  3),
              ( 67,  7,  4),
              ( 68,  7,  7),
              ( 69,  7,  8),
              ( 70,  7,  9),
              ( 71,  7, 28),
              ( 72,  7, 29),
              ( 73,  7, 11),
              ( 74,  7, 30),
              ( 75,  7, 31),
              ( 76,  7, 14),
              ( 77,  7, 10),

              -- File New: Build a Event-Driven Architected Microservice from Scratch
              ( 78,  8,  1),
              ( 79,  8,  2),
              ( 80,  8,  3),
              ( 81,  8,  4),
              ( 82,  8,  5),
              ( 83,  8,  6),
              ( 84,  8,  7),
              ( 85,  8, 35),
              ( 86,  8,  8),
              ( 87,  8,  9),
              ( 88,  8, 10),
              ( 89,  8, 11),
              ( 90,  8, 12),
              ( 91,  8, 13),
              ( 92,  8, 14),

              -- Secrets of Conflict Resolution
              ( 93,  9, 18),
              ( 94,  9, 22),

              -- Building Great Libraries
              ( 95, 10,  1),
              ( 96, 10,  2),
              ( 97, 10,  3),
              ( 98, 10,  6),
              ( 99, 10,  7),
              (100, 10, 10),

              -- Developing Resilient Serverless Solutions
              (101, 11,  1),
              (102, 11,  3),
              (103, 11,  4),
              (103, 11,  5),
              (104, 11,  6),
              (105, 11,  7),
              (106, 11,  8),
              (107, 11,  9),
              (108, 11, 10),
              (109, 11, 11),
              (110, 11, 12),
              (111, 11, 14),

              -- Design and Develop a Serverless Event-Driven Microservice-Based Solution in 2 Days
              (112, 12,  1),
              (112, 12,  2),
              (113, 12,  3),
              (113, 12,  4),
              (114, 12,  5),
              (115, 12,  7),
              (116, 12,  8),
              (116, 12,  9),
              (116, 12, 36),
              (117, 12, 11),
              (118, 12, 12),
              (119, 12, 13),
              (120, 12, 14),
              (121, 12, 10),

              -- Beyond Hello World: Getting Deeper into Azure Functions
              (122, 13,  1),
              (123, 13,  3),
              (124, 13,  4),
              (125, 13,  5),
              (126, 13,  7),
              (127, 13,  8),
              (128, 13,  9),
              (128, 13, 28),
              (129, 13, 38),
              (130, 13, 14),

              -- Going Schema-less: How to migrate a relational database to a NoSQL database
              (131, 14,  1),
              (132, 14, 32),
              (133, 14,  3),
              (134, 14,  4),
              (135, 14,  7),
              (136, 14,  8),
              (137, 14, 35),
              (138, 14, 23),
              (139, 14, 24),
              (140, 14, 37),
              (141, 14, 27),




              -- Technical Debt Is Not Free
              (15, 2, 15),
              (16, 2, 16),
              (17, 2, 17),
              (18, 2, 18),
              (19, 2, 19),
              (20, 2, 20),
              (21, 2, 21),
              (22, 2,  6),
              
AS SOURCE (PresentationTagId,
           PresentationId,
           TagId)
ON TARGET.PresentationTagId = SOURCE.PresentationTagId
WHEN MATCHED THEN UPDATE SET TARGET.PresentationId = SOURCE.PresentationId,
                             TARGET.TagId          = SOURCE.TagId
WHEN NOT MATCHED THEN INSERT (PresentationTagId,
                              PresentationId,
                              TagId)
                      VALUES (SOURCE.PresentationTagId,
                              SOURCE.PresentationId,
                              SOURCE.TagId)
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT dbo.PresentationTag OFF
GO