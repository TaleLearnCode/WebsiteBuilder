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
              ( 34,  3, 30),
              ( 35,  3, 31),
              ( 36,  3, 14),
              ( 37,  3, 10),

              -- The Taming of the API
              ( 38,  4,  1),
              ( 39,  4, 32),
              ( 40,  4,  2),
              ( 41,  4,  3),
              ( 42,  4,  4),
              ( 43,  4,  7),
              ( 44,  4,  8),
              ( 45,  4,  9),
              ( 46,  4, 10),
              ( 47,  4, 11),
              ( 48,  4, 12),
              ( 49,  4, 14),

              -- Advanced Serverless Workshop
              ( 50,  5, 14),
              ( 51,  5,  4),
              ( 52,  5, 33),
              ( 53,  5, 34),

              -- File New: Build a Fully-Managed and Documented API
              ( 54,  6,  1),
              ( 55,  6, 32),
              ( 56,  6,  2),
              ( 57,  6,  3),
              ( 58,  6,  4),
              ( 59,  6,  7),
              ( 60,  6,  8),
              ( 61,  6,  9),
              ( 62,  6, 10),
              ( 63,  6, 11),
              ( 64,  6, 12),
              ( 65,  6, 14),

              -- File New: Build a Serverless Microservices from Scratch
              ( 66,  7,  1),
              ( 67,  7,  2),
              ( 68,  7,  3),
              ( 69,  7,  4),
              ( 70,  7,  7),
              ( 71,  7,  8),
              ( 72,  7,  9),
              ( 73,  7, 28),
              ( 74,  7, 29),
              ( 75,  7, 11),
              ( 76,  7, 30),
              ( 77,  7, 31),
              ( 78,  7, 14),
              ( 79,  7, 10),

              -- File New: Build a Event-Driven Architected Microservice from Scratch
              ( 80,  8,  1),
              ( 81,  8,  2),
              ( 82,  8,  3),
              ( 83,  8,  4),
              ( 84,  8,  5),
              ( 85,  8,  6),
              ( 86,  8,  7),
              ( 87,  8, 35),
              ( 88,  8,  8),
              ( 89,  8,  9),
              ( 90,  8, 10),
              ( 91,  8, 11),
              ( 92,  8, 12),
              ( 93,  8, 13),
              ( 94,  8, 14),

              -- Secrets of Conflict Resolution
              ( 95,  9, 18),
              ( 96,  9, 22),

              -- Building Great Libraries
              ( 97, 10,  1),
              ( 98, 10,  2),
              ( 99, 10,  3),
              (100, 10,  6),
              (101, 10,  7),
              (102, 10, 10),

              -- Developing Resilient Serverless Solutions
              (103, 11,  1),
              (104, 11,  3),
              (105, 11,  4),
              (106, 11,  5),
              (107, 11,  6),
              (108, 11,  7),
              (109, 11,  8),
              (110, 11,  9),
              (111, 11, 10),
              (112, 11, 11),
              (113, 11, 12),
              (114, 11, 14),

              -- Design and Develop a Serverless Event-Driven Microservice-Based Solution in 2 Days
              (115, 12,  1),
              (116, 12,  2),
              (117, 12,  3),
              (118, 12,  4),
              (119, 12,  5),
              (120, 12,  7),
              (121, 12,  8),
              (122, 12,  9),
              (123, 12, 36),
              (124, 12, 11),
              (125, 12, 12),
              (126, 12, 13),
              (127, 12, 14),
              (128, 12, 10),

              -- Beyond Hello World: Getting Deeper into Azure Functions
              (129, 13,  1),
              (130, 13,  3),
              (131, 13,  4),
              (132, 13,  5),
              (133, 13,  7),
              (134, 13,  8),
              (135, 13,  9),
              (136, 13, 28),
              (137, 13, 38),
              (138, 13, 14),

              -- Going Schema-less: How to migrate a relational database to a NoSQL database
              (139, 14,  1),
              (140, 14, 32),
              (141, 14,  3),
              (142, 14,  4),
              (143, 14,  7),
              (144, 14,  8),
              (145, 14, 35),
              (146, 14, 23),
              (147, 14, 24),
              (148, 14, 37),
              (149, 14, 27))

              
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