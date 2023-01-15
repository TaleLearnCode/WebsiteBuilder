SET IDENTITY_INSERT dbo.ShindigPresentationDownload ON
GO

MERGE dbo.ShindigPresentationDownload AS TARGET
USING (VALUES
              -- Building Event-Driven Microservices
              (  1,   1, 'Slides', 'https://github.com/TaleLearnCode/BuildingEventDrivenMicroservices/blob/main/Presentations/Building%20Event-Driven%20Microservices%20-%20CodeStock.pdf'),   -- CodeStock
              (  2,   2, 'Slides', 'https://github.com/TaleLearnCode/BuildingEventDrivenMicroservices/blob/main/Presentations/Building%20Event-Driven%20Microservices%20-%20DevUp.pdf'),       -- dev up
              (  3,   3, 'Slides', 'https://github.com/TaleLearnCode/BuildingEventDrivenMicroservices/blob/main/Presentations/BuildingEventDrivenMicroservices_THAT.pdf'),                     -- THAT Wisconsin
              (  4,   4, 'Slides', 'https://github.com/TaleLearnCode/BuildingEventDrivenMicroservices/blob/main/Presentations/BuildingEventDrivenMicroservices_AtlDevCon.pdf'),                -- Atlanta Developers' Conference
              (  5,   5, 'Slides', 'https://github.com/TaleLearnCode/BuildingEventDrivenMicroservices/blob/main/Presentations/Building%20Event-Driven%20Microservices%20-%20PDCRegina.pdf'),   -- Prairie Dev Con - Regina
              (  6,   6, 'Slides', 'https://github.com/TaleLearnCode/BuildingEventDrivenMicroservices/blob/main/Presentations/Building%20Event-Driven%20Microservices%20-%20IndyCode.pdf'),    -- Indy.Code
              (  7,   7, 'Slides', 'https://github.com/TaleLearnCode/BuildingEventDrivenMicroservices/blob/main/Presentations/Building%20Event-Driven%20Microservices%20-%20Momentum.pdf'),    -- Momentum Developer Conference
              (  8,   8, 'Slides', 'https://github.com/TaleLearnCode/BuildingEventDrivenMicroservices/blob/main/Presentations/Building%20Event-Driven%20Microservices%20-%20PDCWinnipeg.pdf'), -- Prairie Dev Con - Winnipeg

              -- Time Traveling Data
              (  9,   9, 'Slides', 'https://github.com/TaleLearnCode/TimeTravellingData/blob/main/Presentations/TimeTravelingTables-TechBash2019.pdf'),    -- TechBash
              ( 10,  10, 'Slides', 'https://github.com/TaleLearnCode/TimeTravellingData/blob/main/Presentations/TimeTravellingData_BeerCityCode2022.pdf'), -- Beer City Code
              ( 11,  11, 'Slides', 'https://github.com/TaleLearnCode/TimeTravellingData/blob/main/Presentations/TimeTravellingData_KCDC2022.pdf'),         -- KCDC
              ( 12,  12, 'Slides', 'https://github.com/TaleLearnCode/TimeTravellingData/blob/main/Presentations/TimeTravellingData_PDCWinnipeg.pdf'),      -- Prairie Dev Con Winnipeg

              -- Building Microservice REST APIs using Azure Functions
              ( 13, 13, 'Slides', 'https://github.com/TaleLearnCode/BuildingMicroserviceRESTAPIsUsingAzureFunctions/blob/main/Presentations/BuildingMicroserviceRESTAPIsUsingAzureFunctions_TechBash2022.pdf'),      -- TechBash
              ( 14, 14, 'Slides', 'https://github.com/TaleLearnCode/BuildingMicroserviceRESTAPIsUsingAzureFunctions/blob/main/Presentations/BuildingMicroserviceRESTAPIsUsingAzureFunctions_ScenicCitySummit.pdf'),  -- Scenic City Summit
              ( 15, 15, 'Slides', 'https://github.com/TaleLearnCode/BuildingMicroserviceRESTAPIsUsingAzureFunctions/blob/main/Presentations/Building_Microservice_REST_APIs_Using_Azure_Functions-DevUp.pdf'),       -- dev up
              ( 16, 16, 'Slides', 'https://github.com/TaleLearnCode/BuildingMicroserviceRESTAPIsUsingAzureFunctions/blob/main/Presentations/Building_Microservice_REST_APIs_Using_Azure_Functions-StirTrek.pdf'),    -- Stir Trek
              ( 17, 17, 'Slides', 'https://github.com/TaleLearnCode/BuildingMicroserviceRESTAPIsUsingAzureFunctions/blob/main/Presentations/Building_Microservice_REST_APIs_Using_Azure_Functions-LouDotNet.pdf'),   -- Louisville .NET Meetup

              -- The Taming of the API
              ( 18, 18, 'Slides', 'https://github.com/TaleLearnCode/TheTamingOfTheAPI/blob/main/Presentations/TheTamingOfTheAPI_IndyCode.pdf'),                     -- Indy.Code
              ( 19, 19, 'Slides', 'https://github.com/TaleLearnCode/TheTamingOfTheAPI/blob/main/Presentations/TheTamingOfTheAPI_BeerCityCode.pdf'),                 -- Beer City Code
              ( 20, 20, 'Slides', 'https://github.com/TaleLearnCode/TheTamingOfTheAPI/blob/main/Presentations/TheTamingOfTheAPI_NebraskaCode.pdf'),                 -- Nebraska.Code()
              ( 21, 21, 'Slides', 'https://github.com/TaleLearnCode/TheTamingOfTheAPI/blob/main/Presentations/The%20Taming%20of%20the%20API%20-%20DevUp.pdf'),      -- dev up
              ( 22, 22, 'Slides', 'https://github.com/TaleLearnCode/TheTamingOfTheAPI/blob/main/Presentations/The%20Taming%20of%20the%20API%20-%20CodeStock.pdf'),  -- CodeStock
              
              -- Advanced Serverless Workshop
              ( 23, 23, 'Slides', 'https://github.com/TaleLearnCode/AdvancedServerlessWorkshop/blob/main/Presentations/Advanced%20Serverless%20Workshop%20-%20Azure.pdf'),  -- Serverless Architecture Conference - Berlin
              ( 24, 24, 'Available Afterwards', NULL),                                                                                                                      -- Serverless Architecture Conference - London

              -- File New: Build a Event-Driven Architected Microservice from Scratch
              ( 25, 25, 'Available Afterwards', NULL),

              -- Secrets of Conflict Resolution
              ( 26, 26, 'Slides', 'https://github.com/TaleLearnCode/SecretsOfConflictResolution/blob/main/Presentations/SecretsOfConflictResolution-Nebraska2016.pdf'),                  -- Nebraska.Code()
              ( 27, 27, 'Slides', 'https://github.com/TaleLearnCode/SecretsOfConflictResolution/blob/main/Presentations/SecretsOfConflictResolution-Cincinnati2016.pdf'),                -- CINNUG
              ( 28, 28, 'Slides', 'https://github.com/TaleLearnCode/SecretsOfConflictResolution/blob/main/Presentations/SecretsOfConflictResolution-CodeStock2018.pdf'),                 -- CodeStock
              ( 29, 29, 'Slides', 'https://github.com/TaleLearnCode/SecretsOfConflictResolution/blob/main/Presentations/SecretsOfConflictResolution-MusicCity2018.pdf'),                 -- Music City Tech
              ( 30, 30, 'Slides', 'https://github.com/TaleLearnCode/SecretsOfConflictResolution/blob/main/Presentations/SecretsOfConflictResolution-BeerCityCode2019.pdf'),              -- Beer City Code
              ( 31, 31, 'Slides', 'https://github.com/TaleLearnCode/SecretsOfConflictResolution/blob/main/Presentations/SecretsOfConflictResolution-LouisvilleTechLadiesJune2019.pdf'),  -- Louisville Tech Ladies
              ( 32, 32, 'Slides', 'https://github.com/TaleLearnCode/SecretsOfConflictResolution/blob/main/Presentations/SecretsOfConflictResolution-Tulsa2022.pdf'),                     -- Tulsa .NET User Group
              ( 33, 33, 'Slides', 'https://github.com/TaleLearnCode/SecretsOfConflictResolution/blob/main/Presentations/SecretsOfConflictResolution-PDCRegina2022.pdf'),                 -- Prairie Dev Con - Regina
              
              -- Going Schema-less: How to migrate a relational database to a NoSQL database
              ( 34, 34, 'Slides', 'https://github.com/TaleLearnCode/GoingSchemaless/blob/main/presentations/GoingSchemaless_THAT.pdf'),      -- THAT
              ( 35, 35, 'Slides', 'https://github.com/TaleLearnCode/GoingSchemaless/blob/main/presentations/GoingSchemaless_Momentum.pdf'),  -- Momentum Developer Conference
              ( 36, 36, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/GoingSchemaless_AtlantaCodeCamp.pdf'),                     -- Atlanta Code Camp
              ( 37, 37, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/GoingSchemaless_KCDC.pdf'),                                -- KCDC
              ( 38, 38, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/GoingSchemaLess_Tulsa.pdf'),                               -- Tulsa .NET User Group
              ( 39, 39, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/GoingSchemaLess_THAT.pdf'),                                -- THAT
              ( 40, 40, 'Slides', 'https://bit.ly/3ehtuGH'),                                                                                 -- Nebraska.Code

              -- Technical Debt Is Not Free
              ( 41, 41, 'Slides', 'https://github.com/TaleLearnCode/TechnicalDebtIsNotFree/blob/main/Presentations/TechnicalDebitIsNotFree_ScenicCitySummit.pdf'), -- Scenic City Summit 2022
              ( 42, 42, 'Slides', 'https://github.com/TaleLearnCode/TechnicalDebtIsNotFree/blob/main/Presentations/TechnicalDebitIsNotFree-LouDotNet.pdf'),        -- Louisville .NET Meetup - July 2022
              ( 43, 43, 'Slides', 'https://github.com/TaleLearnCode/TechnicalDebtIsNotFree/blob/main/Presentations/TechnicalDebitIsNotFree_NebraskaCode.pdf'),     -- Nebraska.Code() 2022
              ( 44, 44, 'Slides', 'https://github.com/TaleLearnCode/TechnicalDebtIsNotFree/blob/main/Presentations/TechnicalDebitIsNotFree_DevUp.pdf'),            -- dev up 2022

              -- Ch-ch-ch-changes: Tracing Changes in Azure Cosmos DB
              ( 45, 45, 'Available Afterwards', NULL),                                                                                                                                                  -- TechBash 2022
              ( 46, 46, 'Slides', 'https://github.com/TaleLearnCode/Ch-ch-ch-changes-Tracing-Changes-in-Azure-Cosmos-DB/blob/main/Presentations/ChChChChanges-DevUp.pdf'),                              -- dev up
              ( 47, 47, 'Available Afterwards', NULL),                                                                                                                                                  -- Music City Tech
              ( 48, 48, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/ChChChChanges-KCDC.pdf'),                                                                                             -- KCDC
              ( 49, 49, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/Ch-ch-ch-changes%20-%20Tracing%20Changes%20in%20Azure%20Cosmos%20DB%20-%20Hampton%20Roads%20Net%20User%20Group.pdf'), -- Hampton Roads .NET User Group

              -- What’s New for C# Developers
              ( 50, 50, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/WhatsNewForCSharpDevelopers-LouDotNet.pdf'),                                                                          -- Louisville .NET Meetup
              ( 51, 51, 'Available Afterwards', NULL),                                                                                                                                                  -- Tulsa .NET Meetup
              ( 52, 52, 'Available Afterwards', NULL),                                                                                                                                                  -- Glennis Solutions

              -- Software Craftsmanship for New Developers
              ( 53, 53, 'Available Afterwards', NULL),                                                                                                                                                  -- Nashville Women Programmers
              ( 54, 54, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/SoftwareCraftsmanshipForNewDevelopers-LouDotNet.pdf'),                                                                -- Louisville .NET Meetup
              ( 55, 55, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/SoftwareCraftsmanshipForNewDevelopers-Nebraska2021.pdf'),                                                             -- Nebraska.Code()
              ( 56, 56, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/SoftwareCraftsmanshipForNewDevelopers-SoftwareGuild.pdf'),                                                            -- Software Guild
              ( 57, 57, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/SoftwareCraftsmanshipForNewDevelopers-TechFoundationsLouisville.pdf'),                                                -- Tech Foundations Louisville

              -- Serverless in Action
              ( 58, 58, 'Available Afterwards', NULL),                                                                                                                                                  -- Roanoke Valley .NET User Group
              ( 59, 59, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/Serverless%20in%20Action%20-%20TechBash.pdf'),                                                                        -- TechBash
              ( 60, 60, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/Serverless%20in%20Action%20-%20DevSpace.pdf'),                                                                        -- DevSpace
              ( 61, 61, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/From%20Zero%20to%20Serverless%20-%20Scenic%20City%20Summit.pdf'),                                                     -- Scenic City Simmit
              ( 62, 62, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/Serverless%20in%20Action%20-%20CodeStock.pdf'),                                                                        -- CodeStock
              ( 63, 63, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/From%20Zero%20to%20Serverless%20-%20CodeMash.pdf'),                                                                   -- CodeMash
              ( 64, 64, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/From%20Zero%20to%20Serverless%20-%20DogFoodCon%20(No%20Connectivity).pdf'),                                           -- DogFoodCon
              ( 65, 65, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/From%20Zero%20to%20Serverless%20-%20CoderCruise.pdf'),                                                                 -- CoderCruise
              ( 66, 66, 'N/A', NULL),                                                                                                                                                                   -- StirTrek
              ( 67, 67, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/From%20Zero%20to%20Serverless%20-%20Louisville%20.NET%20Meetup.pdf'),                                                 -- Louisville .NET Meetup

              -- Event-Driven Architecture in the Cloud
              ( 69, 69, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/EventDrivenArchictureInTheCloud-MusicCityCode.pdf'),                                                                  -- Music City Code
              ( 70, 70, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/EventDrivenArchictureInTheCloud-DevSpace.pdf'),                                                                       -- DevSpace
              ( 71, 71, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/EventDrivenArchictureInTheCloud-CincyDeliver.pdf'),                                                                   -- CincyDeliver
              ( 72, 72, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/Event-Driven%20Architecture%20in%20the%20Cloud%20-%20Dallas%20&%20Austin%20Azure%20Meetup.pdf'),                      -- Dallas & Austin Azure Meetup
              ( 74, 74, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/Event-Driven%20Architecture%20in%20the%20Cloud%20-%20TechBash.pdf'),                                                  -- TechBash
              ( 75, 75, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/Event-Driven%20Architecture%20in%20the%20Cloud%20-%20Louisville%20.NET.pdf'),                                         -- Louisville .NET Meetup
              ( 76, 76, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/Event-Driven%20Architecture%20in%20the%20Cloud%20-%20DevUp.pdf'),                                                     -- devup
              ( 77, 77, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/Event-Driven%20Architecture%20in%20the%20Cloud%20-%20Little%20Rock%20Tech%20Fest.pdf'),                               -- Little Rock Tech Fest

              -- The Hitchhiker's Guide to the Cosmos
              ( 79, 79, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/HitchhickersGuideToTheCosmos-MusicCityTech.pdf'),                                                                     -- Music City Tech
              ( 80, 80, 'Available Afterwards', NULL),                                                                                                                                                  -- Dallas & Austin Azure Meetup
              ( 81, 81, 'Slides', 'https://github.com/TaleLearnCode/HitchhikersGuideToCosmos/blob/master/Presentations/The%20Hitchhicker''s%20Guide%20to%20the%20Cosmos%20-%20TDevConf.pdf'),           -- TDevConf
              ( 84, 84, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/Graphing%20Your%20Way%20Through%20the%20Cosmos%20-%20Ignite%20Government.pptx'),                                      -- Ignite the Tour Government
              ( 85, 85, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/The%20Hitchhicker%27s%20Guide%20to%20the%20Cosmos%20-%20DevSpace.pdf'),                                               -- DevSpace
              ( 86, 86, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/The%20Hitchhicker%27s%20Guide%20to%20the%20Cosmos%20-%20Atlanta%20Code%20Camp.pdf'),                                  -- Atlanta Code Camp

              -- Serverless Microservices: Microservices without Containers
              ( 87, 87, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/ServerlessMicroservices-MicroservicesWithoutContainers_CincyDeliver2021.pdf'),                                        -- Cincy Deliver

              -- How to be a Leader
              ( 88, 88, 'Available Afterwards', NULL),                                                                                                                                                  -- Tulsa .NET User Group
              ( 89, 89, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/How%20to%20be%20a%20Leader%20-%20Music%20City%20Tech.pdf'),                                                           -- Music City Tech
              ( 90, 90, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/How%20to%20be%20a%20Leader%20-%20Nebraska.Code().pdf'),                                                               -- Nebraska.Code
              ( 92, 92, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/How%20to%20be%20a%20Leader%20-%20CodeStock.pdf'),                                                                     -- CodeStock

              -- Intro to Azure Communication Services
              ( 93, 93, 'Available Afterwards', NULL),                                                                                                                                                  -- Columbus App Dev User Group

              -- Building a .NET Application Using Azure Cosmos DB
              ( 94, 94, 'Availalbe Afterwards', NULL),                                                                                                                                                  -- Dallas & Austin Azure Meetup
              ( 95, 95, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/Building%20a%20.NET%20Application%20Using%20Azure%20Cosmos%20DB%20-%20Tulsa%20.NET%20User%20Group.pdf'),              -- Tulsa .NET User Group
              (950, 95, 'Demo COde', 'https://github.com/TaleLearnCode/BuildingDotNetAppUsingCosmosDB/tree/main/Demos/Tutorial'),                                                                       -- Tulsa .NET User Group

              -- Graphing Your Way Through the Cosmos
              ( 96,  96, 'Availalbe Afterwards', NULL),                                                                                                                                                  -- Granite State Code Camp
              ( 97,  97, 'Availalbe Afterwards', NULL),                                                                                                                                                  -- NDC Sydney
              (101, 101, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/Graphing%20Your%20Way%20Through%20the%20Cosmos%20-%20SFSDC.pdf'),                                                     -- South Florida Developers Conference
              (102, 102, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/The%20Hitchhicker%27s%20Guide%20to%20the%20Cosmos%20-%20Ignite%20Government.pptx'),                                   -- Microsoft Ignite the Tour Government
              (103, 103, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/Graphing%20Your%20Way%20Through%20the%20Cosmos%20-%20CodeMash%202020.pdf'),                                           -- CodeMash
              (104, 104, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/Graphing%20Your%20Way%20Through%20the%20Cosmos%20-%20TechBash.pdf'),                                                  -- TechBash
              (105, 105, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/Graphing%20Your%20Way%20Through%20the%20Cosmos%20-%20DogFoodCon.pdf'),                                                -- DogFoodCon

              -- Which Microsoft Framework Am I Supposed to Use
              (106, 106, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/Which%20Microsoft%20Framework%20Am%20I%20Supposed%20to%20Use%20-%20KCDC.pdf'),                                        -- KCDC
              (107, 107, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/Which%20Microsoft%20Framework%20Am%20I%20Supposed%20to%20Use%20-%20Louisville%20NET%20Meetup.pdf'),                   -- Louisville .NET Meetup
              (108, 108, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/Which%20Microsoft%20Framework%20Am%20I%20Supposed%20to%20Use%20-%20Evansville%20Technology%20Group.pdf'),             -- Evansville Technology Group

              -- Building Great Libraries with .NET Standard
              (111, 111, 'Slides', 'https://web.archive.org/web/20220119173323/https://chadgreen.blob.core.windows.net/slides/Building%20Great%20Libraries%20with%20.NET%20Standard%20-%20Nebraska.Code.pdf'),  -- Nebraska.Code() 2019
              (112, 112, 'Slides', 'https://web.archive.org/web/20220119171613/https://chadgreen.blob.core.windows.net/slides/Building%20Great%20Libraries%20with%20.NET%20Standard%20-%20Nebraska.Code.pdf'),  -- Music City Tech 2019
              (113, 113, 'Slides', 'https://web.archive.org/web/20220119155951/https://chadgreen.blob.core.windows.net/slides/Building%20Great%20Libraries%20with%20.NET%20Standard%20-%20Prairie.Code().pdf'), -- Prairie.Code() 2019

              -- Building an Ultra-Scalable API Using Azure Functions
              (115, 115, 'Slides', 'https://web.archive.org/web/20220119160221/https://chadgreen.blob.core.windows.net/slides/Building%20an%20Ultra-Scalable%20API%20Using%20Azure%20Functions%20Without%20Too%20Much%20Worry.pdf'),  -- DogFoodCon 2018

              -- Delivering Real-Time Data with Azure
              (116, 116, 'Slides', 'https://web.archive.org/web/20220119175412/https://chadgreen.blob.core.windows.net/slides/Delivering%20Real-Time%20Data%20with%20Azure%20-%20DevUp.pdf'),                                         -- DevUp 2019
              (117, 117, 'Slides', 'https://web.archive.org/web/20220119174236/https://chadgreen.blob.core.windows.net/slides/Delivering%20Real-Time%20Data%20with%20Azure%20-%20SFSDC.pdf'),                                         -- South Florida Developers Conference 2020

              -- Azure Durable Functions for Serverless .NET Orchestration
              (119, 119, 'Slides', 'https://web.archive.org/web/20220119170643/https://chadgreen.blob.core.windows.net/slides/Azure%20Services%20Every%20Developer%20Needs%20to%20Know%20-%20Louisville%20.NET%20Meetup%20(January%202019).pdf'),   -- Stir Trek 2019

              -- Building Hyper-Scaled Event-Processing Solutions in Azure
              (122, 122, 'Slides', 'https://web.archive.org/web/20220119175412/https://chadgreen.blob.core.windows.net/slides/Getting%20Started%20with%20Azure%20Event%20Hubs%20-%20DevUp.pdf'),                                                    -- dev up 2019

              -- Getting Gremlins to Improve Your Data
              (123, 123, 'Slides', 'https://web.archive.org/web/20220119170326/https://chadgreen.blob.core.windows.net/slides/Getting%20Gremlins%20to%20Improve%20Your%20Data%20-%20Beer%20City%20Code.pdf'),                                       -- Beer City Code 2019
              (124, 124, 'Slides', 'https://web.archive.org/web/20220119171613/https://chadgreen.blob.core.windows.net/slides/Getting%20Gremlins%20to%20Improve%20Your%20Data%20-%20Music%20City%20Tech.pdf'),                                      -- Music City Tech 2019
              (125, 124, 'Labs',   'https://web.archive.org/web/20220119171613/http://bit.ly/2lXiKEZ'),                                                                                                                                             -- Music CIty Tech 2019

              -- Getting Started with Azure SQL Database
              (126, 126, 'Slides', 'https://web.archive.org/web/20220119172105/https://chadgreen.blob.core.windows.net/slides/Getting%20Started%20with%20Azure%20SQL%20Database%20-%20TechFest.pdf'),                                               -- Pittsburgh TechFest 2018
              (127, 127, 'Slides', 'https://web.archive.org/web/20220119172636/https://chadgreen.blob.core.windows.net/slides/Getting%20Started%20with%20Azure%20SQL%20Database%20-%20CodeStock.pdf'),                                              -- CodeStock 2019
              (128, 128, 'Slides', 'https://web.archive.org/web/20220119173547/https://chadgreen.blob.core.windows.net/slides/Getting%20Started%20with%20Azure%20SQL%20Database%20-%20DotNetSouth.pdf'),                                            -- DotNetSouth 2018
              (129, 129, 'Slides', 'https://web.archive.org/web/20220119172255/https://chadgreen.blob.core.windows.net/slides/Getting%20Started%20with%20Azure%20SQL%20Database%20-%20KCDC.pdf'),                                                   -- KCDC 2019

              -- Getting Started with Azure DevOps
              (130, 130, 'Slides', 'https://web.archive.org/web/20220119160307/https://chadgreen.blob.core.windows.net/slides/Gettings%20Started%20with%20Azure%20DevOps%20-%20Evansville.pdf'),                                                    -- Evansville Technology Group - December 2018
              (131, 131, 'Slides', 'https://web.archive.org/web/20220119174915/https://chadgreen.blob.core.windows.net/slides/Gettings%20Started%20with%20Azure%20DevOps%20-%20Louisville.pdf'),                                                    -- Louisville .NET Meetup - December 2018
              (132, 132, 'Slides', 'https://web.archive.org/web/20220119173547/https://chadgreen.blob.core.windows.net/slides/Gettings%20Started%20with%20Azure%20DevOps%20-%20DotNetSouth.pdf'),                                                   -- DotNetSouth
              (133, 133, 'Slides', 'https://web.archive.org/web/20220119170522/https://chadgreen.blob.core.windows.net/slides/Gettings%20Started%20with%20Azure%20DevOps%20-%20CincyDeliver.pdf')                                                   -- Cincy Deliver 2019

              
              )
AS SOURCE (ShindigPresentationDownloadId,
           ShindigPresentationId,
           DownloadName,
           DownloadLink)
ON TARGET.ShindigPresentationDownloadId = SOURCE.ShindigPresentationDownloadId
WHEN MATCHED THEN UPDATE SET TARGET.ShindigPresentationId = SOURCE.ShindigPresentationId,
                             TARGET.DownloadName          = SOURCE.DownloadName,
                             TARGET.DownloadLink          = SOURCE.DownloadLink
WHEN NOT MATCHED THEN INSERT (ShindigPresentationDownloadId,
                              ShindigPresentationId,
                              DownloadName,
                              DownloadLink)
                      VALUES (SOURCE.ShindigPresentationDownloadId,
                              SOURCE.ShindigPresentationId,
                              SOURCE.DownloadName,
                              SOURCE.DownloadLink)
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT dbo.ShindigPresentationDownload OFF
GO