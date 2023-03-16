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
              (28, 11, 1, 'Learn how to not just build Azure Function solutions but Azure Function solutions that take extra steps for resiliency'),
              (29, 11, 2, 'See quality techniques for testing your Azure Functions to ensure that they work under load'),
              (30, 11, 3, 'Learn how to monitor your Azure Functions to know about failures as soon as possible'),

              -- Design and Develop a Serverless Event-Driven Microservice-Based Solution in 2 Days
              (31, 12, 1, 'Understand the different serverless, event-driven cloud services and how to put them together to build a cohesive microservice-based architecture'),
              (32, 12, 2, 'Build a working serverless event-driven microservice-based solution using best practices based upon real-world experience of what has worked and what has not'),
              (33, 12, 3, 'Gets hands-on experience deploying the solution you have built using continuous integration/continuous development tools that make it easy to keep your solution updated with the latest changes'),

              -- Beyond Hello World: Getting Deeper into Azure Functions
              (34, 13, 1, 'Learn about the different Azure Function bindings and triggers outside of the HTTP trigger'),
              (35, 13, 2, 'See real-world examples of how Azure Functions have been used to solve real needs'),
              (36, 13, 3, 'Learn how you can use the Durable Functions extension to build orchestration processes that take Azure Functions further than you could have imagined'),

              -- Going Schema-less: How to migrate a relational database to a NoSQL database
              (37, 14, 1, 'Learn about the pros and cons of developing with a NoSQL data model over a relational data model'),
              (38, 14, 2, 'Learn how to migrate data from a relational data model to a NoSQL data model'),
              (39, 14, 3, 'Learn how to develop a .NET application to use a Cosmos DB NoSQL data model'),

              
              -- Technical Debt Is Not Free
              (40, 15, 1, 'Understand what technical debt is and how to measure it'),
              (41, 15, 2, 'Understand how to track technical debt in a way meaningful for developers and the business'),
              (42, 15, 3, 'Learn ways to combat technical debt'),

              -- Ch-ch-ch-changes: Tracing Changes in Azure Cosmos DB
              (43, 16, 1, 'Learn how the Azure Cosmos DB change feed works'),
              (44, 16, 2, 'Learn how to build robust applications that can react to changes within the database'),
              (45, 16, 3, 'See real-world examples of how to implement the most common use cases for the change feed'),

              -- Software Craftsmanship for New Developers
              (46, 18, 1, 'Learn what exactly is software craftsmanship is and how it can improve your development teams'),
              (47, 18, 2, 'Learn what technical debt is, how it can be helpful when used wisely, and how to minimize debt and not go bankrupt'),
              (48, 18, 3, 'Get a high-level understanding of what SOLID principles and other fundamental principles'),
              (49, 18, 4, 'Understand critical principles such as SOLID, DRY, KISS, and YANGI and practices such as TDD, pair programming, and coding dojos are and how they can help your team build high-quality software'),
              (50, 18, 5, 'Understand what code smells are, how to detect them, and how to help your team steer clear of them'),

              -- Serverless in Action
              (51, 19, 1, 'Learn the what is serverless computing'),
              (52, 19, 2, 'Learn what is Azure Functions and how to use it to develop business-critical functionality'),
              (53, 19, 3, 'Learn about the different Azure Function triggers and bindings that allow you to tie in many other Azure resources'),
              
              -- Event-Driven Architecture in the Cloud
              (54, 20, 1, 'Learn the basics of event-driven architecture'),
              (55, 20, 2, 'Learn how to transform your complex systems to become event driven'),
              (56, 20, 3, 'Learn about the benefits event-driven architecture brings to your business'),

              -- The Hitchhiker's Guide to the Cosmos
              (57, 21, 1, 'Learn about the different Azure Cosmos DB data models'),
              (58, 21, 2, 'Learn how to use the benefits of Azure Cosmos DB to build the best data solution'),
              (59, 21, 3, 'Learn about some of the common Cosmos DB use cases'),

              -- Serverless Microservices: Microservices without Containers
              (60, 22, 1, 'Understand the concepts and benefits of microservice architectures'),
              (61, 22, 2, 'Understand what exactly serverless technologies are and their benefits'),
              (62, 22, 3, 'See firsthand how-to user serverless technologies to implement a microservice architecture'),

              -- How to be a Leader
              (63, 23, 1, 'Understand the 14 Marine Corps leadership traits and how to apply them to your software development teams'),
              (64, 23, 2, 'Understand the basics of leadership'),
              (65, 23, 3, 'Understand the difference between a boss or manager and a leader'),

              -- Intro to Azure Communication Services
              (66, 24, 1, 'Learn about the new Azure Communication Services'),
              (67, 24, 2, 'Learn how to use Azure Communication Services to send and received SMS messages'),

              -- Building a .NET Application Using Azure Cosmos DB
              (68, 25, 1, 'Understand how to use Azure Cosmos DB within a .NET Core application'),
              (69, 25, 2, 'Learn about the pitfalls to watch out for when using Azure Cosmos DB'),

              -- Graphing Your Way Through the Cosmos
              (70, 26, 1, 'Understand the basics of graph databases'),
              (71, 26, 2, 'See real world examples of graph databases with common business data problems'),
              (72, 26, 3, 'Understand best practices in building graphing data solutions'),

              -- Which Microsoft Framework Am I Supposed to Use
              (73, 27, 1, 'Understand the history of Microsoft development strategies and how this brought on the development paradigms available now'),
              (74, 27, 2, 'Understand the differences between .NET Framework, .NET Core, and .NET Standard'),
              (75, 27, 3, 'Understand when to use one Microsoft .NET framework over another'),

              -- Chad and Ed’s Excellent Adventure!
              (76, 28, 1, 'Learn about announcements at Google I/O 2018'),
              (77, 28, 2, 'Learn about announcements at Microsoft Build 2018'),

              -- .NET Conf Keynote Review
              (78, 29, 1, 'Understand the announcements made during the 2018 .NET Conf conference'),

              -- Building Great Libraries with .NET Standard
              (79, 30, 1, 'Understanding the differences between .NET Framework, .NET Core, and .NET Standard'),
              (80, 30, 2, 'How to use .NET Standard effectively to build cross-platform libraries'),
              (81, 30, 3, 'Learn key library building concepts such as versioning, strong naming, and binding redirects'),

              -- Building an Ultra-Scalable API Using Azure Functions
              (82, 31, 1, 'Understand how to architect serverless solutions that offer ultra-scalability'),
              (83, 31, 2, 'Understand best practices for building solutions with the best scalability options'),
              (84, 31, 3, 'See real-world examples how to implement ultra-scalable serverless solutions'),

              -- Delivering Real-Time Data with Azure
              (85, 32, 1, 'Learn how to build real-time dashboards without managing any infrastructure'),
              (86, 32, 2, 'Learn how to use Event Hubs to ingest vast amounts of data for processing by its consumers'),
              (87, 32, 3, 'Learn how to implement Azure Stream Analytics to analyze your data in real-time'),
              (88, 32, 4, 'Learn how to build real-time dashboards with Power BI'),

              -- Azure Durable Functions for Serverless .NET Orchestration
              (89, 33, 1, 'Understand how to write Durable Azure Functions'),
              (90, 33, 2, 'Understand patterns and where to use Durable Azure Functions'),
              (91, 33, 3, 'Understand the best practices for writing stateful orchestrations'),

              -- Azure Services Every Developer Needs to Know
              (92, 34, 1, 'Understand the basics of Azure services and architecture'),
              (93, 34, 2, 'Understand the primary services a developer needs to know about to build a robust ASP.NET application'),

              -- Building Hyper-Scaled Event-Processing Solutions in Azure
              (94, 35, 1, 'Learn how to set up an Azure Event Hub and send and receive events in a .NET application'),
              (95, 35, 2, 'Learn how to build a real-time dashboard using Stream Analytics and Power BI using data ingested by Azure Event Hubs'),
              (96, 35, 3, 'Learn how archive events ingested by Azure Event Hubs for long-time storage'),
              (97, 35, 4, 'Learn how to trigger Azure Functions and Azure Logic Apps from the events within an Event Hub'),

              -- Getting Gremlins to Improve Your Data
              ( 98, 36, 1, 'Understand the basics of graph databases'),
              ( 99, 36, 2, 'Get hands-on experience setting up, configuring, and optimizing a graph database'),
              (100, 36, 3, 'Get hands-on experience working with graph databases in your application'),

              -- Getting Started with Azure SQL Database
              (101, 37, 1, 'Understand what Azure SQL is and how you can use it to power you applications'),

              -- Getting Started with Azure DevOps
              (102, 38, 1, 'Learning what exactly DevOps is and what is not'),
              (103, 38, 2, 'Learning about the different features of Azure DevOps'),
              (104, 38, 3, 'See first hand how to get started using Azure DevOps to start continuously deliver value to your customers'),

              -- Other Duties as Assigned
              (105, 39, 1, 'Learn how to seek out other duties in order to improve your skill set'),
              (106, 39, 2, 'Learn how to benefit from other duties and make strides in your professional career'),
              (107, 39, 3, 'Learn how to not be abused from other duties that take you away too much from your normal tasks'),

              -- Database-Driven Static Websites
              (108, 40, 1, 'Learn how to use Azure Static Web Apps can be used to deploy dependably fast web apps'),
              (109, 40, 2, 'Learn how to add dynamic functionality to static web apps using Azure Functions'),
              (110, 40, 3, 'Learn how to build a continious-deployment implementation that responds to database changes')

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