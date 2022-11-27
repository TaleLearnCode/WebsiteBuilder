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
              ( 33, 33, 'Slides', 'https://github.com/TaleLearnCode/SecretsOfConflictResolution/blob/main/Presentations/SecretsOfConflictResolution-PDCRegina2022.pdf')                  -- Prairie Dev Con - Regina
              
              ---- Going Schema-less: How to migrate a relational database to a NoSQL database
              --( 34, 34, 'Slides', 'https://github.com/TaleLearnCode/GoingSchemaless/blob/main/presentations/GoingSchemaless_THAT.pdf'),      -- THAT
              --( 35, 35, 'Slides', 'https://github.com/TaleLearnCode/GoingSchemaless/blob/main/presentations/GoingSchemaless_Momentum.pdf'),  -- Momentum Developer Conference
              --( 36, 36, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/GoingSchemaless_AtlantaCodeCamp.pdf'),                     -- Atlanta Code Camp
              --( 37, 37, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/GoingSchemaless_KCDC.pdf'),                                -- KCDC
              --( 38, 38, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/GoingSchemaLess_Tulsa.pdf'),                               -- Tulsa .NET User Group
              --( 39, 39, 'Slides', 'https://chadgreen.blob.core.windows.net/slides/GoingSchemaLess_THAT.pdf'),                                -- THAT
              --( 40, 40, 'Slides', 'https://bit.ly/3ehtuGH')                                                                                  -- Nebraska.Code
              
              
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