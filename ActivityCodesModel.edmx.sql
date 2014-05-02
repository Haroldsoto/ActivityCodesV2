
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 04/07/2014 11:47:36
-- Generated from EDMX file: c:\users\opt2968.bpd\documents\visual studio 2010\Projects\ActivityCodesV2\ActivityCodesV2\ActivityCodesModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE ActivityCodesV2;
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ActivityCodes'
CREATE TABLE [dbo].[ActivityCodes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Code] nvarchar(max)  NOT NULL,
    [CallId] int  NOT NULL
);
GO

-- Creating table 'Calls'
CREATE TABLE [dbo].[Calls] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Date] nvarchar(max)  NOT NULL,
    [Agent] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'ActivityCodes'
ALTER TABLE [dbo].[ActivityCodes]
ADD CONSTRAINT [PK_ActivityCodes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Calls'
ALTER TABLE [dbo].[Calls]
ADD CONSTRAINT [PK_Calls]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CallId] in table 'ActivityCodes'
ALTER TABLE [dbo].[ActivityCodes]
ADD CONSTRAINT [FK_CallActivityCode]
    FOREIGN KEY ([CallId])
    REFERENCES [dbo].[Calls]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CallActivityCode'
CREATE INDEX [IX_FK_CallActivityCode]
ON [dbo].[ActivityCodes]
    ([CallId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------