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
              (149, 14, 27),
              
              -- Technical Debt Is Not Free
              (150, 15, 15),
              (151, 15,  6),
              (152, 15, 16),
              (153, 15, 17),
              (154, 15, 18),
              (155, 15, 19),
              (156, 15, 20),
              (157, 15, 21),
              
              -- Ch-ch-ch-changes: Tracing Changes in Azure Cosmos DB
              (158, 16,  3),
              (159, 16,  4),
              (160, 16, 35),
              (161, 16, 23),
              (162, 16, 36),
              (163, 16, 11),

              -- What’s New for C# Developers
              (164, 17,  7),
              (165, 17,  1),

              -- Software Craftsmanship for New Developers
              (166, 18, 19),
              (167, 18, 22),

              -- Serverless in Action
              (168, 19,  3),
              (169, 19,  4),
              (170, 19,  5),
              (171, 19,  8),
              (172, 19, 14),

              -- Event-Driven Architecture in the Cloud
              (173, 20,  3),
              (174, 20, 36),
              (175, 20,  4),
              (176, 20,  5),
              (177, 20,  8),
              (178, 20, 35),
              (179, 20, 39),

              -- The Hitchhiker's Guide to the Cosmos
              (180, 21,  4),
              (181, 21,  8),
              (182, 21, 35),
              (183, 21, 23),
              (184, 21, 24),
              (185, 21, 37),

              -- Serverless Microservices: Microservices without Containers
              (186, 22,  1),
              (187, 22, 32),
              (188, 22,  3),
              (189, 22,  4),
              (190, 22,  5),
              (191, 22,  7),
              (192, 22,  8),
              (193, 22, 11),
              (194, 22, 14),

              -- How to be a Leader
              (195, 23, 40),
              (196, 23, 22),

              -- Intro to Azure Communication Services
              (197, 24,  4),
              (198, 24, 41),
              (199, 24,  8),
              (200, 24, 42),
              (201, 24, 43),
              (202, 24, 44),
              (203, 24, 45),

              -- Building a .NET Application Using Azure Cosmos DB
              (204, 25,  4),
              (205, 25, 46),
              (206, 25, 35),
              (207, 25,  1),
              (208, 25, 32),
              (209, 25, 23),
              (210, 25, 24),
              (211, 25, 37),

              -- Graphing Your Way Through the Cosmos
              (212, 26,  4),
              (213, 26, 35),
              (214, 26,  8),
              (215, 26, 23),
              (216, 26, 24),
              (217, 26, 47),
              (218, 26, 12),
              (219, 26, 48),

              -- Which Microsoft Framework Am I Supposed to Use
              (220, 27,  3),
              (221, 27,  1),
              (222, 27, 49),
              (223, 27, 32),
              (224, 27, 50),

              -- Chad and Ed’s Excellent Adventure!
              (225, 28, 51),
              (226, 28, 52),

              -- .NET Conf Keynote Review
              (227, 29, 52),

              -- Building Great Libraries with .NET Standard
              (228, 30,  3),
              (229, 30,  1),
              (230, 30, 49),
              (231, 30, 32),
              (232, 30, 50),

              -- Building an Ultra-Scalable API Using Azure Functions
              (233, 31,  2),
              (234, 31,  3),
              (235, 31,  4),
              (236, 31, 53),
              (237, 31,  8),
              (238, 31, 14),

              -- Delivering Real-Time Data with Azure
              (239, 32,  8),
              (240, 32, 54),
              (241, 32,  4),
              (242, 32, 55),

              -- Azure Durable Functions for Serverless .NET Orchestration
              (243, 33,  3),
              (244, 33,  4),
              (245, 33,  5),
              (246, 33, 14),

              -- Azure Services Every Developer Needs to Know
              (247, 34, 56),
              (248, 34,  4),
              (249, 34, 57),
              (250, 34,  5),
              (251, 34, 58),
              (252, 34, 59),
              (253, 34, 60),
              (254, 34,  8),
              (255, 34, 14),

              -- Building Hyper-Scaled Event-Processing Solutions in Azure
              (256, 35, 36),
              (257, 35,  3),
              (258, 35,  4),
              (259, 35,  8),

              -- Getting Gremlins to Improve Your Data
              (260, 36,  3),
              (261, 36,  4),
              (262, 36, 35),
              (263, 36, 23),
              (264, 36, 24),
              (265, 36, 47),

              -- Getting Started with Azure SQL Database
              (266, 37,  4),
              (267, 37, 59),
              (268, 37,  8),
              (269, 37, 23),
              (270, 37, 24),
              (371, 37, 27),

              -- Getting Started with Azure DevOps
              (372, 38, 15),
              (373, 38,  4),
              (374, 38, 61),
              (375, 38,  8),
              (376, 38, 62),
              (377, 38, 63),
              (378, 38, 64)

              )

              
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