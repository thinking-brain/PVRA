
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/03/2023 22:26:01
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [pvra];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ColorCompraMateriales]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CompraMateriales] DROP CONSTRAINT [FK_ColorCompraMateriales];
GO
IF OBJECT_ID(N'[dbo].[FK_ColorEntradaProductos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EntradaProductos] DROP CONSTRAINT [FK_ColorEntradaProductos];
GO
IF OBJECT_ID(N'[dbo].[FK_ColorInvertarioMateriales]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InvertarioMateriales] DROP CONSTRAINT [FK_ColorInvertarioMateriales];
GO
IF OBJECT_ID(N'[dbo].[FK_ColorInvertarioProductos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InvertarioProductos] DROP CONSTRAINT [FK_ColorInvertarioProductos];
GO
IF OBJECT_ID(N'[dbo].[FK_ConceptoCostoCostoProduccion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Salario_CostoProduccion] DROP CONSTRAINT [FK_ConceptoCostoCostoProduccion];
GO
IF OBJECT_ID(N'[dbo].[FK_CostoProduccion_inherits_Salario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Salario_CostoProduccion] DROP CONSTRAINT [FK_CostoProduccion_inherits_Salario];
GO
IF OBJECT_ID(N'[dbo].[FK_EntradaProductosCostoProduccion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Salario_CostoProduccion] DROP CONSTRAINT [FK_EntradaProductosCostoProduccion];
GO
IF OBJECT_ID(N'[dbo].[FK_FKCompraMate814930]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CompraMateriales] DROP CONSTRAINT [FK_FKCompraMate814930];
GO
IF OBJECT_ID(N'[dbo].[FK_FKInvertario944054]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InvertarioProductos] DROP CONSTRAINT [FK_FKInvertario944054];
GO
IF OBJECT_ID(N'[dbo].[FK_FKInvertario965581]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InvertarioMateriales] DROP CONSTRAINT [FK_FKInvertario965581];
GO
IF OBJECT_ID(N'[dbo].[FK_FKMaterial596249]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Material] DROP CONSTRAINT [FK_FKMaterial596249];
GO
IF OBJECT_ID(N'[dbo].[FK_FKOtrosGasto791932]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OtrosGastos] DROP CONSTRAINT [FK_FKOtrosGasto791932];
GO
IF OBJECT_ID(N'[dbo].[FK_FKProducto_M10400]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Producto_Material] DROP CONSTRAINT [FK_FKProducto_M10400];
GO
IF OBJECT_ID(N'[dbo].[FK_FKProducto_M71108]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Producto_Material] DROP CONSTRAINT [FK_FKProducto_M71108];
GO
IF OBJECT_ID(N'[dbo].[FK_FKSalario6470]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Salario] DROP CONSTRAINT [FK_FKSalario6470];
GO
IF OBJECT_ID(N'[dbo].[FK_FKSalidaMate497011]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalidaMateriales] DROP CONSTRAINT [FK_FKSalidaMate497011];
GO
IF OBJECT_ID(N'[dbo].[FK_FKTrabajador28344]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Persona_Trabajador] DROP CONSTRAINT [FK_FKTrabajador28344];
GO
IF OBJECT_ID(N'[dbo].[FK_FKVentas365277]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ventas] DROP CONSTRAINT [FK_FKVentas365277];
GO
IF OBJECT_ID(N'[dbo].[FK_FKVentas49889]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ventas] DROP CONSTRAINT [FK_FKVentas49889];
GO
IF OBJECT_ID(N'[dbo].[FK_InvertarioMaterialesProductoConfeccionadoInventarioMaterial]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductoConfeccionadoInventarioMaterial] DROP CONSTRAINT [FK_InvertarioMaterialesProductoConfeccionadoInventarioMaterial];
GO
IF OBJECT_ID(N'[dbo].[FK_MaterialCompraMateriales]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CompraMateriales] DROP CONSTRAINT [FK_MaterialCompraMateriales];
GO
IF OBJECT_ID(N'[dbo].[FK_MateriasPrimasUsadasEntradaProductos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductoConfeccionadoInventarioMaterial] DROP CONSTRAINT [FK_MateriasPrimasUsadasEntradaProductos];
GO
IF OBJECT_ID(N'[dbo].[FK_OcupacionTrabajador]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Persona_Trabajador] DROP CONSTRAINT [FK_OcupacionTrabajador];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductoEntradaProductos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EntradaProductos] DROP CONSTRAINT [FK_ProductoEntradaProductos];
GO
IF OBJECT_ID(N'[dbo].[FK_Proveedor_inherits_Persona]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Persona_Proveedor] DROP CONSTRAINT [FK_Proveedor_inherits_Persona];
GO
IF OBJECT_ID(N'[dbo].[FK_Trabajador_inherits_Persona]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Persona_Trabajador] DROP CONSTRAINT [FK_Trabajador_inherits_Persona];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AreaTrabajo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AreaTrabajo];
GO
IF OBJECT_ID(N'[dbo].[Color]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Color];
GO
IF OBJECT_ID(N'[dbo].[CompraMateriales]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CompraMateriales];
GO
IF OBJECT_ID(N'[dbo].[ConceptoCosto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ConceptoCosto];
GO
IF OBJECT_ID(N'[dbo].[ConceptoGasto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ConceptoGasto];
GO
IF OBJECT_ID(N'[dbo].[EntradaProductos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EntradaProductos];
GO
IF OBJECT_ID(N'[dbo].[InvertarioMateriales]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InvertarioMateriales];
GO
IF OBJECT_ID(N'[dbo].[InvertarioProductos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InvertarioProductos];
GO
IF OBJECT_ID(N'[dbo].[Material]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Material];
GO
IF OBJECT_ID(N'[dbo].[Ocupacion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ocupacion];
GO
IF OBJECT_ID(N'[dbo].[OtrosGastos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OtrosGastos];
GO
IF OBJECT_ID(N'[dbo].[Persona]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Persona];
GO
IF OBJECT_ID(N'[dbo].[Persona_Proveedor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Persona_Proveedor];
GO
IF OBJECT_ID(N'[dbo].[Persona_Trabajador]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Persona_Trabajador];
GO
IF OBJECT_ID(N'[dbo].[Producto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Producto];
GO
IF OBJECT_ID(N'[dbo].[Producto_Material]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Producto_Material];
GO
IF OBJECT_ID(N'[dbo].[ProductoConfeccionadoInventarioMaterial]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductoConfeccionadoInventarioMaterial];
GO
IF OBJECT_ID(N'[dbo].[Salario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Salario];
GO
IF OBJECT_ID(N'[dbo].[Salario_CostoProduccion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Salario_CostoProduccion];
GO
IF OBJECT_ID(N'[dbo].[SalidaMateriales]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalidaMateriales];
GO
IF OBJECT_ID(N'[dbo].[UnidadMedida]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UnidadMedida];
GO
IF OBJECT_ID(N'[dbo].[Ventas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ventas];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- pvra.dbo.[__MigrationHistory] definition
CREATE TABLE pvra.dbo.[__MigrationHistory]
(
    MigrationId nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    ContextKey nvarchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    Model varbinary(MAX) NOT NULL,
    ProductVersion nvarchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY (MigrationId,ContextKey)
);


-- pvra.dbo.AspNetRoles definition
CREATE TABLE pvra.dbo.AspNetRoles
(
    Id nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    Name nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY (Id)
);


-- pvra.dbo.AspNetUsers definition
CREATE TABLE pvra.dbo.AspNetUsers
(
    Id nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    UserName nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    PasswordHash nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    SecurityStamp nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    Active bit NULL,
    Discriminator nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY (Id)
);

-- pvra.dbo.AspNetUserClaims definition
CREATE TABLE pvra.dbo.AspNetUserClaims
(
    Id int IDENTITY(1,1) NOT NULL,
    ClaimType nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    ClaimValue nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    User_Id nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY (Id),
    CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id] FOREIGN KEY (User_Id) REFERENCES pvra.dbo.AspNetUsers(Id) ON DELETE CASCADE
);
CREATE NONCLUSTERED INDEX IX_User_Id ON dbo.AspNetUserClaims (  User_Id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]
;


-- pvra.dbo.AspNetUserLogins definition
CREATE TABLE pvra.dbo.AspNetUserLogins
(
    UserId nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    LoginProvider nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    ProviderKey nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY (UserId,LoginProvider,ProviderKey),
    CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY (UserId) REFERENCES pvra.dbo.AspNetUsers(Id) ON DELETE CASCADE
);
CREATE NONCLUSTERED INDEX IX_UserId ON dbo.AspNetUserLogins (  UserId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]
;


-- pvra.dbo.AspNetUserRoles definition
CREATE TABLE pvra.dbo.AspNetUserRoles
(
    UserId nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    RoleId nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY (UserId,RoleId),
    CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY (RoleId) REFERENCES pvra.dbo.AspNetRoles(Id) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY (UserId) REFERENCES pvra.dbo.AspNetUsers(Id) ON DELETE CASCADE
);
CREATE NONCLUSTERED INDEX IX_RoleId ON dbo.AspNetUserRoles (  RoleId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]
;
CREATE NONCLUSTERED INDEX IX_UserId ON dbo.AspNetUserRoles (  UserId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ]
;

-- Creating table 'AreaTrabajo'
CREATE TABLE [dbo].[AreaTrabajo]
(
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(255) NOT NULL
);
GO

-- Creating table 'Color'
CREATE TABLE [dbo].[Color]
(
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max) NOT NULL,
    [Descripcion] nvarchar(max) NULL
);
GO

-- Creating table 'CompraMateriales'
CREATE TABLE [dbo].[CompraMateriales]
(
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime NOT NULL,
    [MateriaPrimaId] int NOT NULL,
    [ColorId] int NOT NULL,
    [Importe] decimal(19,2) NOT NULL,
    [Cantidad] decimal(18,2) NOT NULL,
    [Observacion] varchar(255) NULL,
    [UsuarioId] varchar(255) NOT NULL,
    [ProveedorPersonaId] int NOT NULL
);
GO

-- Creating table 'ConceptoCosto'
CREATE TABLE [dbo].[ConceptoCosto]
(
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max) NOT NULL
);
GO

-- Creating table 'ConceptoGasto'
CREATE TABLE [dbo].[ConceptoGasto]
(
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(255) NOT NULL,
    [Descripcion] varchar(255) NULL
);
GO

-- Creating table 'EntradaProductos'
CREATE TABLE [dbo].[EntradaProductos]
(
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime NOT NULL,
    [ProductoId] int NOT NULL,
    [ColorId] int NOT NULL,
    [Importe] decimal(19,2) NOT NULL,
    [Cantidad] int NOT NULL,
    [Observacion] varchar(255) NULL,
    [UsuarioId] varchar(255) NOT NULL,
    [Confeccionado] bit NOT NULL
);
GO

-- Creating table 'InvertarioMateriales'
CREATE TABLE [dbo].[InvertarioMateriales]
(
    [Id] int IDENTITY(1,1) NOT NULL,
    [MateriaPrimaId] int NOT NULL,
    [Precio] decimal(19,2) NOT NULL,
    [Existencia] decimal(18,2) NOT NULL,
    [Descripcion] varchar(255) NULL,
    [ColorId] int NOT NULL
);
GO

-- Creating table 'InvertarioProductos'
CREATE TABLE [dbo].[InvertarioProductos]
(
    [Id] int IDENTITY(1,1) NOT NULL,
    [ProductoId] int NOT NULL,
    [ColorId] int NOT NULL,
    [CostoUnitario] decimal(19,2) NOT NULL,
    [Existencia] int NOT NULL,
    [Descripcion] nvarchar(max) NULL
);
GO

-- Creating table 'Material'
CREATE TABLE [dbo].[Material]
(
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(255) NOT NULL,
    [Descripcion] varchar(255) NULL,
    [UnidadMedidaId] int NOT NULL
);
GO

-- Creating table 'Ocupacion'
CREATE TABLE [dbo].[Ocupacion]
(
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max) NOT NULL,
    [Descripcion] nvarchar(max) NULL
);
GO

-- Creating table 'OtrosGastos'
CREATE TABLE [dbo].[OtrosGastos]
(
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime NOT NULL,
    [Importe] decimal(19,2) NOT NULL,
    [UsuarioId] varchar(255) NOT NULL,
    [ConceptoGastoId] int NOT NULL
);
GO

-- Creating table 'Persona'
CREATE TABLE [dbo].[Persona]
(
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombres] varchar(255) NOT NULL,
    [Direccion] varchar(255) NOT NULL,
    [Telefono] varchar(255) NOT NULL,
    [Apellidos] varchar(255) NOT NULL
);
GO

-- Creating table 'Persona_Proveedor'
CREATE TABLE [dbo].[Persona_Proveedor]
(
    [Email] varchar(255) NULL,
    [Id] int NOT NULL
);
GO

-- Creating table 'Persona_Trabajador'
CREATE TABLE [dbo].[Persona_Trabajador]
(
    [AreaTrabajoId] int NOT NULL,
    [OcupacionId] int NOT NULL,
    [Id] int NOT NULL
);
GO

-- Creating table 'Producto'
CREATE TABLE [dbo].[Producto]
(
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(255) NOT NULL,
    [Modelo] nvarchar(max) NOT NULL,
    [Talla] int NOT NULL,
    [Descripcion] varchar(255) NULL
);
GO

-- Creating table 'Producto_Material'
CREATE TABLE [dbo].[Producto_Material]
(
    [ProductoId] int NOT NULL,
    [MateriaPrimaId] int NOT NULL,
    [Cantidad] decimal(18,2) NOT NULL
);
GO

-- Creating table 'ProductoConfeccionadoInventarioMaterial'
CREATE TABLE [dbo].[ProductoConfeccionadoInventarioMaterial]
(
    [InvertarioMateriasPrimasId] int NOT NULL,
    [EntradaProductosId] int NOT NULL,
    [Cantidad] decimal(18,2) NOT NULL
);
GO

-- Creating table 'Salario'
CREATE TABLE [dbo].[Salario]
(
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime NOT NULL,
    [Importe] decimal(19,2) NOT NULL,
    [TrabajadorPersonaId] int NOT NULL
);
GO

-- Creating table 'Salario_CostoProduccion'
CREATE TABLE [dbo].[Salario_CostoProduccion]
(
    [ConceptoCostoId] int NOT NULL,
    [EntradaProductosId] int NULL,
    [Id] int NOT NULL
);
GO

-- Creating table 'SalidaMateriales'
CREATE TABLE [dbo].[SalidaMateriales]
(
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime NOT NULL,
    [Cantidad] decimal(18,2) NOT NULL,
    [Observacion] varchar(255) NULL,
    [UsuarioId] varchar(255) NOT NULL,
    [InvertarioMateriasPrimasId] int NOT NULL
);
GO

-- Creating table 'UnidadMedida'
CREATE TABLE [dbo].[UnidadMedida]
(
    [Id] int IDENTITY(1,1) NOT NULL,
    [Unidad] varchar(255) NOT NULL,
    [Siglas] varchar(5) NOT NULL
);
GO

-- Creating table 'Ventas'
CREATE TABLE [dbo].[Ventas]
(
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime NOT NULL,
    [Importe] decimal(19,2) NOT NULL,
    [Cantidad] int NOT NULL,
    [Observacion] varchar(255) NULL,
    [UsuarioId] varchar(255) NOT NULL,
    [InvertarioProductosId] int NOT NULL,
    [TrabajadorPersonaId] int NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'AreaTrabajo'
ALTER TABLE [dbo].[AreaTrabajo]
ADD CONSTRAINT [PK_AreaTrabajo]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Color'
ALTER TABLE [dbo].[Color]
ADD CONSTRAINT [PK_Color]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CompraMateriales'
ALTER TABLE [dbo].[CompraMateriales]
ADD CONSTRAINT [PK_CompraMateriales]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ConceptoCosto'
ALTER TABLE [dbo].[ConceptoCosto]
ADD CONSTRAINT [PK_ConceptoCosto]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ConceptoGasto'
ALTER TABLE [dbo].[ConceptoGasto]
ADD CONSTRAINT [PK_ConceptoGasto]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EntradaProductos'
ALTER TABLE [dbo].[EntradaProductos]
ADD CONSTRAINT [PK_EntradaProductos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'InvertarioMateriales'
ALTER TABLE [dbo].[InvertarioMateriales]
ADD CONSTRAINT [PK_InvertarioMateriales]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'InvertarioProductos'
ALTER TABLE [dbo].[InvertarioProductos]
ADD CONSTRAINT [PK_InvertarioProductos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Material'
ALTER TABLE [dbo].[Material]
ADD CONSTRAINT [PK_Material]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Ocupacion'
ALTER TABLE [dbo].[Ocupacion]
ADD CONSTRAINT [PK_Ocupacion]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OtrosGastos'
ALTER TABLE [dbo].[OtrosGastos]
ADD CONSTRAINT [PK_OtrosGastos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Persona'
ALTER TABLE [dbo].[Persona]
ADD CONSTRAINT [PK_Persona]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Persona_Proveedor'
ALTER TABLE [dbo].[Persona_Proveedor]
ADD CONSTRAINT [PK_Persona_Proveedor]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Persona_Trabajador'
ALTER TABLE [dbo].[Persona_Trabajador]
ADD CONSTRAINT [PK_Persona_Trabajador]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Producto'
ALTER TABLE [dbo].[Producto]
ADD CONSTRAINT [PK_Producto]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ProductoId], [MateriaPrimaId] in table 'Producto_Material'
ALTER TABLE [dbo].[Producto_Material]
ADD CONSTRAINT [PK_Producto_Material]
    PRIMARY KEY CLUSTERED ([ProductoId], [MateriaPrimaId] ASC);
GO

-- Creating primary key on [InvertarioMateriasPrimasId], [EntradaProductosId] in table 'ProductoConfeccionadoInventarioMaterial'
ALTER TABLE [dbo].[ProductoConfeccionadoInventarioMaterial]
ADD CONSTRAINT [PK_ProductoConfeccionadoInventarioMaterial]
    PRIMARY KEY CLUSTERED ([InvertarioMateriasPrimasId], [EntradaProductosId] ASC);
GO

-- Creating primary key on [Id] in table 'Salario'
ALTER TABLE [dbo].[Salario]
ADD CONSTRAINT [PK_Salario]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Salario_CostoProduccion'
ALTER TABLE [dbo].[Salario_CostoProduccion]
ADD CONSTRAINT [PK_Salario_CostoProduccion]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SalidaMateriales'
ALTER TABLE [dbo].[SalidaMateriales]
ADD CONSTRAINT [PK_SalidaMateriales]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UnidadMedida'
ALTER TABLE [dbo].[UnidadMedida]
ADD CONSTRAINT [PK_UnidadMedida]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Ventas'
ALTER TABLE [dbo].[Ventas]
ADD CONSTRAINT [PK_Ventas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AreaTrabajoId] in table 'Persona_Trabajador'
ALTER TABLE [dbo].[Persona_Trabajador]
ADD CONSTRAINT [FK_FKTrabajador28344]
    FOREIGN KEY ([AreaTrabajoId])
    REFERENCES [dbo].[AreaTrabajo]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKTrabajador28344'
CREATE INDEX [IX_FK_FKTrabajador28344]
ON [dbo].[Persona_Trabajador]
    ([AreaTrabajoId]);
GO

-- Creating foreign key on [ColorId] in table 'CompraMateriales'
ALTER TABLE [dbo].[CompraMateriales]
ADD CONSTRAINT [FK_ColorCompraMateriales]
    FOREIGN KEY ([ColorId])
    REFERENCES [dbo].[Color]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ColorCompraMateriales'
CREATE INDEX [IX_FK_ColorCompraMateriales]
ON [dbo].[CompraMateriales]
    ([ColorId]);
GO

-- Creating foreign key on [ColorId] in table 'EntradaProductos'
ALTER TABLE [dbo].[EntradaProductos]
ADD CONSTRAINT [FK_ColorEntradaProductos]
    FOREIGN KEY ([ColorId])
    REFERENCES [dbo].[Color]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ColorEntradaProductos'
CREATE INDEX [IX_FK_ColorEntradaProductos]
ON [dbo].[EntradaProductos]
    ([ColorId]);
GO

-- Creating foreign key on [ColorId] in table 'InvertarioMateriales'
ALTER TABLE [dbo].[InvertarioMateriales]
ADD CONSTRAINT [FK_ColorInvertarioMateriales]
    FOREIGN KEY ([ColorId])
    REFERENCES [dbo].[Color]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ColorInvertarioMateriales'
CREATE INDEX [IX_FK_ColorInvertarioMateriales]
ON [dbo].[InvertarioMateriales]
    ([ColorId]);
GO

-- Creating foreign key on [ColorId] in table 'InvertarioProductos'
ALTER TABLE [dbo].[InvertarioProductos]
ADD CONSTRAINT [FK_ColorInvertarioProductos]
    FOREIGN KEY ([ColorId])
    REFERENCES [dbo].[Color]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ColorInvertarioProductos'
CREATE INDEX [IX_FK_ColorInvertarioProductos]
ON [dbo].[InvertarioProductos]
    ([ColorId]);
GO

-- Creating foreign key on [ProveedorPersonaId] in table 'CompraMateriales'
ALTER TABLE [dbo].[CompraMateriales]
ADD CONSTRAINT [FK_FKCompraMate814930]
    FOREIGN KEY ([ProveedorPersonaId])
    REFERENCES [dbo].[Persona_Proveedor]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKCompraMate814930'
CREATE INDEX [IX_FK_FKCompraMate814930]
ON [dbo].[CompraMateriales]
    ([ProveedorPersonaId]);
GO

-- Creating foreign key on [MateriaPrimaId] in table 'CompraMateriales'
ALTER TABLE [dbo].[CompraMateriales]
ADD CONSTRAINT [FK_MaterialCompraMateriales]
    FOREIGN KEY ([MateriaPrimaId])
    REFERENCES [dbo].[Material]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MaterialCompraMateriales'
CREATE INDEX [IX_FK_MaterialCompraMateriales]
ON [dbo].[CompraMateriales]
    ([MateriaPrimaId]);
GO

-- Creating foreign key on [ConceptoCostoId] in table 'Salario_CostoProduccion'
ALTER TABLE [dbo].[Salario_CostoProduccion]
ADD CONSTRAINT [FK_ConceptoCostoCostoProduccion]
    FOREIGN KEY ([ConceptoCostoId])
    REFERENCES [dbo].[ConceptoCosto]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ConceptoCostoCostoProduccion'
CREATE INDEX [IX_FK_ConceptoCostoCostoProduccion]
ON [dbo].[Salario_CostoProduccion]
    ([ConceptoCostoId]);
GO

-- Creating foreign key on [ConceptoGastoId] in table 'OtrosGastos'
ALTER TABLE [dbo].[OtrosGastos]
ADD CONSTRAINT [FK_FKOtrosGasto791932]
    FOREIGN KEY ([ConceptoGastoId])
    REFERENCES [dbo].[ConceptoGasto]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKOtrosGasto791932'
CREATE INDEX [IX_FK_FKOtrosGasto791932]
ON [dbo].[OtrosGastos]
    ([ConceptoGastoId]);
GO

-- Creating foreign key on [EntradaProductosId] in table 'Salario_CostoProduccion'
ALTER TABLE [dbo].[Salario_CostoProduccion]
ADD CONSTRAINT [FK_EntradaProductosCostoProduccion]
    FOREIGN KEY ([EntradaProductosId])
    REFERENCES [dbo].[EntradaProductos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EntradaProductosCostoProduccion'
CREATE INDEX [IX_FK_EntradaProductosCostoProduccion]
ON [dbo].[Salario_CostoProduccion]
    ([EntradaProductosId]);
GO

-- Creating foreign key on [EntradaProductosId] in table 'ProductoConfeccionadoInventarioMaterial'
ALTER TABLE [dbo].[ProductoConfeccionadoInventarioMaterial]
ADD CONSTRAINT [FK_MateriasPrimasUsadasEntradaProductos]
    FOREIGN KEY ([EntradaProductosId])
    REFERENCES [dbo].[EntradaProductos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MateriasPrimasUsadasEntradaProductos'
CREATE INDEX [IX_FK_MateriasPrimasUsadasEntradaProductos]
ON [dbo].[ProductoConfeccionadoInventarioMaterial]
    ([EntradaProductosId]);
GO

-- Creating foreign key on [ProductoId] in table 'EntradaProductos'
ALTER TABLE [dbo].[EntradaProductos]
ADD CONSTRAINT [FK_ProductoEntradaProductos]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Producto]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoEntradaProductos'
CREATE INDEX [IX_FK_ProductoEntradaProductos]
ON [dbo].[EntradaProductos]
    ([ProductoId]);
GO

-- Creating foreign key on [MateriaPrimaId] in table 'InvertarioMateriales'
ALTER TABLE [dbo].[InvertarioMateriales]
ADD CONSTRAINT [FK_FKInvertario965581]
    FOREIGN KEY ([MateriaPrimaId])
    REFERENCES [dbo].[Material]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKInvertario965581'
CREATE INDEX [IX_FK_FKInvertario965581]
ON [dbo].[InvertarioMateriales]
    ([MateriaPrimaId]);
GO

-- Creating foreign key on [InvertarioMateriasPrimasId] in table 'SalidaMateriales'
ALTER TABLE [dbo].[SalidaMateriales]
ADD CONSTRAINT [FK_FKSalidaMate497011]
    FOREIGN KEY ([InvertarioMateriasPrimasId])
    REFERENCES [dbo].[InvertarioMateriales]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKSalidaMate497011'
CREATE INDEX [IX_FK_FKSalidaMate497011]
ON [dbo].[SalidaMateriales]
    ([InvertarioMateriasPrimasId]);
GO

-- Creating foreign key on [InvertarioMateriasPrimasId] in table 'ProductoConfeccionadoInventarioMaterial'
ALTER TABLE [dbo].[ProductoConfeccionadoInventarioMaterial]
ADD CONSTRAINT [FK_InvertarioMaterialesProductoConfeccionadoInventarioMaterial]
    FOREIGN KEY ([InvertarioMateriasPrimasId])
    REFERENCES [dbo].[InvertarioMateriales]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProductoId] in table 'InvertarioProductos'
ALTER TABLE [dbo].[InvertarioProductos]
ADD CONSTRAINT [FK_FKInvertario944054]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Producto]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKInvertario944054'
CREATE INDEX [IX_FK_FKInvertario944054]
ON [dbo].[InvertarioProductos]
    ([ProductoId]);
GO

-- Creating foreign key on [InvertarioProductosId] in table 'Ventas'
ALTER TABLE [dbo].[Ventas]
ADD CONSTRAINT [FK_FKVentas49889]
    FOREIGN KEY ([InvertarioProductosId])
    REFERENCES [dbo].[InvertarioProductos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKVentas49889'
CREATE INDEX [IX_FK_FKVentas49889]
ON [dbo].[Ventas]
    ([InvertarioProductosId]);
GO

-- Creating foreign key on [UnidadMedidaId] in table 'Material'
ALTER TABLE [dbo].[Material]
ADD CONSTRAINT [FK_FKMaterial596249]
    FOREIGN KEY ([UnidadMedidaId])
    REFERENCES [dbo].[UnidadMedida]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKMaterial596249'
CREATE INDEX [IX_FK_FKMaterial596249]
ON [dbo].[Material]
    ([UnidadMedidaId]);
GO

-- Creating foreign key on [MateriaPrimaId] in table 'Producto_Material'
ALTER TABLE [dbo].[Producto_Material]
ADD CONSTRAINT [FK_FKProducto_M10400]
    FOREIGN KEY ([MateriaPrimaId])
    REFERENCES [dbo].[Material]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKProducto_M10400'
CREATE INDEX [IX_FK_FKProducto_M10400]
ON [dbo].[Producto_Material]
    ([MateriaPrimaId]);
GO

-- Creating foreign key on [OcupacionId] in table 'Persona_Trabajador'
ALTER TABLE [dbo].[Persona_Trabajador]
ADD CONSTRAINT [FK_OcupacionTrabajador]
    FOREIGN KEY ([OcupacionId])
    REFERENCES [dbo].[Ocupacion]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OcupacionTrabajador'
CREATE INDEX [IX_FK_OcupacionTrabajador]
ON [dbo].[Persona_Trabajador]
    ([OcupacionId]);
GO

-- Creating foreign key on [TrabajadorPersonaId] in table 'Salario'
ALTER TABLE [dbo].[Salario]
ADD CONSTRAINT [FK_FKSalario6470]
    FOREIGN KEY ([TrabajadorPersonaId])
    REFERENCES [dbo].[Persona_Trabajador]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKSalario6470'
CREATE INDEX [IX_FK_FKSalario6470]
ON [dbo].[Salario]
    ([TrabajadorPersonaId]);
GO

-- Creating foreign key on [TrabajadorPersonaId] in table 'Ventas'
ALTER TABLE [dbo].[Ventas]
ADD CONSTRAINT [FK_FKVentas365277]
    FOREIGN KEY ([TrabajadorPersonaId])
    REFERENCES [dbo].[Persona_Trabajador]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKVentas365277'
CREATE INDEX [IX_FK_FKVentas365277]
ON [dbo].[Ventas]
    ([TrabajadorPersonaId]);
GO

-- Creating foreign key on [ProductoId] in table 'Producto_Material'
ALTER TABLE [dbo].[Producto_Material]
ADD CONSTRAINT [FK_FKProducto_M71108]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Producto]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Persona_Proveedor'
ALTER TABLE [dbo].[Persona_Proveedor]
ADD CONSTRAINT [FK_Persona_Proveedor_inherits_Persona]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Persona]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Persona_Trabajador'
ALTER TABLE [dbo].[Persona_Trabajador]
ADD CONSTRAINT [FK_Persona_Trabajador_inherits_Persona]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Persona]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Salario_CostoProduccion'
ALTER TABLE [dbo].[Salario_CostoProduccion]
ADD CONSTRAINT [FK_Salario_CostoProduccion_inherits_Salario]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Salario]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
