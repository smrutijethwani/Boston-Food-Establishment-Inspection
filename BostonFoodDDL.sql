/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      BostonFood.DM1
 *
 * Date Created : Thursday, February 24, 2022 12:20:39
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: business1 
 */

CREATE TABLE business1(
    businesskey     int            NOT NULL,
    businessname    varchar(40)    NULL,
    dbaname         varchar(40)    NULL,
    licenseno       int            NULL,
    property_id     int            NULL,
    CONSTRAINT business PRIMARY KEY CLUSTERED (businesskey)
)

go


IF OBJECT_ID('business1') IS NOT NULL
    PRINT '<<< CREATED TABLE business1 >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE business1 >>>'
go

/* 
 * TABLE: factbusinessdetail 
 */

CREATE TABLE factbusinessdetail(
    location_key         int         NOT NULL,
    businesskey          int         NULL,
    voilation_key        int         NULL,
    license_key          int         NULL,
    ownerkey             int         NULL,
    address_key          int         NULL,
    licenseissuedate     datetime    NULL,
    licenseexpirydate    datetime    NULL,
    resultdt             datetime    NULL,
    voilationdm          datetime    NULL,
    CONSTRAINT factbusiness PRIMARY KEY CLUSTERED (location_key)
)

go


IF OBJECT_ID('factbusinessdetail') IS NOT NULL
    PRINT '<<< CREATED TABLE factbusinessdetail >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE factbusinessdetail >>>'
go

/* 
 * TABLE: licensedetail 
 */

CREATE TABLE licensedetail(
    license_key    int             NOT NULL,
    licstatus      varchar(40)     NULL,
    licensecat     varchar(40)     NULL,
    description    varchar(200)    NULL,
    licenseno      int             NULL,
    CONSTRAINT license PRIMARY KEY CLUSTERED (license_key)
)

go


IF OBJECT_ID('licensedetail') IS NOT NULL
    PRINT '<<< CREATED TABLE licensedetail >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE licensedetail >>>'
go

/* 
 * TABLE: location1 
 */

CREATE TABLE location1(
    address_key    int            NOT NULL,
    state          varchar(40)    NULL,
    city           varchar(40)    NULL,
    zip            int            NULL,
    address        varchar(40)    NULL,
    CONSTRAINT location PRIMARY KEY CLUSTERED (address_key)
)

go


IF OBJECT_ID('location1') IS NOT NULL
    PRINT '<<< CREATED TABLE location1 >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE location1 >>>'
go

/* 
 * TABLE: ownerdetail 
 */

CREATE TABLE ownerdetail(
    ownerkey      int            NOT NULL,
    legalowner    varchar(40)    NULL,
    namelast      varchar(40)    NULL,
    namefirst     varchar(40)    NULL,
    CONSTRAINT ownerdetails PRIMARY KEY CLUSTERED (ownerkey)
)

go


IF OBJECT_ID('ownerdetail') IS NOT NULL
    PRINT '<<< CREATED TABLE ownerdetail >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ownerdetail >>>'
go

/* 
 * TABLE: voilationdata 
 */

CREATE TABLE voilationdata(
    voilation_key      int             NOT NULL,
    voilation          varchar(40)     NULL,
    voilationlevel     varchar(40)     NULL,
    voilationdesc      varchar(200)    NULL,
    voilationdate      datetime        NULL,
    voilationstatus    varchar(10)     NULL,
    comments           varchar(200)    NULL,
    CONSTRAINT voilation PRIMARY KEY CLUSTERED (voilation_key)
)

go


IF OBJECT_ID('voilationdata') IS NOT NULL
    PRINT '<<< CREATED TABLE voilationdata >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE voilationdata >>>'
go

/* 
 * TABLE: factbusinessdetail 
 */

ALTER TABLE factbusinessdetail ADD CONSTRAINT fk_business1 
    FOREIGN KEY (businesskey)
    REFERENCES business1(businesskey)
go

ALTER TABLE factbusinessdetail ADD CONSTRAINT fk_licensedetail 
    FOREIGN KEY (license_key)
    REFERENCES licensedetail(license_key)
go

ALTER TABLE factbusinessdetail ADD CONSTRAINT fk_location1 
    FOREIGN KEY (address_key)
    REFERENCES location1(address_key)
go

ALTER TABLE factbusinessdetail ADD CONSTRAINT fk_ownerdetail 
    FOREIGN KEY (ownerkey)
    REFERENCES ownerdetail(ownerkey)
go

ALTER TABLE factbusinessdetail ADD CONSTRAINT fk_voilationdata 
    FOREIGN KEY (voilation_key)
    REFERENCES voilationdata(voilation_key)
go


