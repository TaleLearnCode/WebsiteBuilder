SET IDENTITY_INSERT dbo.LearningObjective ON
GO

MERGE dbo.LearningObjective AS TARGET
USING (VALUES 
              -- Building Event-Driven Microservices
              ( 1, 1, 1, 'Learn what event-driven architecture is and how your applications can benefit from its use'),
              ( 2, 1, 2, 'Learn how to transform your complex systems to become event-driven'),
              ( 3, 1, 3, 'See firsthand how to build a event-driven microservices architecture to build highly scalable solutions'),

              -- Time Traveling Data
              ( 4, 2, 1, 'Understand the key scenarios around the use of SQL Server temporal tables'),
              ( 5, 2, 2, 'Understand how to get started using temporal tables'),
              ( 6, 2, 3, 'Understand best practices and limitations of temporal tables'),

              -- Building Microservice REST APIs using Azure Functions
              ( 7, 3, 1, 'Understand the concepts and benefits of microservice architectures'),
              ( 8, 3, 2, 'Understand the benefits to using serverless technologies for high-performance REST APIs'),
              ( 9, 3, 3, 'See firsthand how to use serverless technologies to implement a microservice architecture'),

              -- The Taming of the API
              (10, 4, 1, 'Understand what an API gateway is and how it can help improve the usability of your APIs'),
              (11, 4, 2, 'Learn how to setup Azure API Management to publish you APIs to the world'),
              (12, 4, 3, 'Learn about the tips and tricks to get the most out of Azure API Management'),

              -- File New: Build a Fully-Managed and Documented API
              (13, 6, 1, 'Understand what an API gateway is and how it can help improve the usability of your APIs'),
              (14, 6, 2, 'Learn how to setup Azure API Management to publish you APIs to the world'),
              (15, 6, 3, 'Learn about the tips and tricks to get the most out of Azure API Management'),

              -- File New: Build a Serverless Microservices from Scratch
              (16, 7, 1, 'Understand the concepts and benefits of microservice architectures'),
              (17, 7, 2, 'Understand the benefits to using serverless technologies for high-performance REST APIs'),
              (18, 7, 3, 'See firsthand how to use serverless technologies to implement a microservice architecture'),

              -- File New: Build a Event-Driven Architected Microservice from Scratch
              (19, 8, 1, 'Learn the basics of event-driven architectures'),
              (20, 8, 2, 'Learn how to transform your complex systems to become event-driven'),
              (21, 8, 3, 'See firsthand how to build a event-driven microservice architecture to build highly scalable solutions'),

              -- Secrets of Conflict Resolution
              (22, 9, 1, 'Understand the five conflict resolution methods and why you would use one over another.'),
              (23, 9, 2, 'Learn about the Karpman Dram Triangle is and how we can use it to understand the motivations of those involved within a conflict.'),
              (24, 9, 3, 'Learn the 10 useful tips for handling conflict that you can employ right away.'),

              -- Building Great Libraries
              (25, 10, 1, 'Learn how to apply coding standards and best practices to build class libraries usable by many'),
              (26, 10, 2, 'Learn how to version your class libraries in order to make changes while not breaking functionality for others'),
              (27, 10, 3, 'Learn how to publish your class libraries so potential users can find them'),

              -- Developing Resilient Serverless Solutions
              (29, 11, 1, 'Learn how to not just build Azure Function solutions but Azure Function solutions that take extra steps for resiliency'),
              (30, 11, 2, 'See quality techniques for testing your Azure Functions to ensure that they work under load'),
              (31, 11, 3, 'Learn how to monitor your Azure Functions to know about failures as soon as possible'),

              -- Design and Develop a Serverless Event-Driven Microservice-Based Solution in 2 Days
              (32, 12, 1, 'Understand the different serverless, event-driven cloud services and how to put them together to build a cohesive microservice-based architecture'),
              (33, 12, 2, 'Build a working serverless event-driven microservice-based solution using best practices based upon real-world experience of what has worked and what has not'),
              (34, 12, 3, 'Gets hands-on experience deploying the solution you have built using continuous integration/continuous development tools that make it easy to keep your solution updated with the latest changes'),

              -- Beyond Hello World: Getting Deeper into Azure Functions
              (35, 13, 1, 'Learn about the different Azure Function bindings and triggers outside of the HTTP trigger'),
              (36, 13, 2, 'See real-world examples of how Azure Functions have been used to solve real needs'),
              (37, 13, 3, 'Learn how you can use the Durable Functions extension to build orchestration processes that take Azure Functions further than you could have imagined'),

              -- Going Schema-less: How to migrate a relational database to a NoSQL database
              (38, 14, 1, 'Learn about the pros and cons of developing with a NoSQL data model over a relational data model'),
              (39, 14, 1, 'Learn how to migrate data from a relational data model to a NoSQL data model'),
              (40, 14, 1, 'Learn how to develop a .NET application to use a Cosmos DB NoSQL data model'),

              
              -- Technical Debt Is Not Free
              ( 4, 2, 1, 'Understand what technical debt is and how to measure it'),
              ( 5, 2, 2, 'Understand how to track technical debt in a way meaningful for developers and the business'),
              ( 6, 2, 3, 'Learn ways to combat technical debt'),
              
              )
AS SOURCE (LearningObjectiveId,
           PresentationId,
           SortOrder,
           LearningObjectiveText)
ON TARGET.LearningObjectiveId = SOURCE.LearningObjectiveId
WHEN MATCHED THEN UPDATE SET TARGET.PresentationId        = SOURCE.PresentationId,
                             TARGET.LearningObjectiveText = SOURCE.LearningObjectiveText,
                             TARGET.SortOrder             = SOURCE.SortOrder
WHEN NOT MATCHED THEN INSERT (LearningObjectiveId,
                              PresentationId,
                              LearningObjectiveText,
                              SortOrder)
                      VALUES (SOURCE.LearningObjectiveId,
                              SOURCE.PresentationId,
                              SOURCE.LearningObjectiveText,
                              SOURCE.SortOrder)
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT dbo.LearningObjective OFF
GO