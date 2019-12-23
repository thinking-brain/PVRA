-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_FKCompraMate219076]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CompraMateriales] DROP CONSTRAINT [FK_FKCompraMate219076];
GO
IF OBJECT_ID(N'[dbo].[FK_FKCompraMate814930]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CompraMateriales] DROP CONSTRAINT [FK_FKCompraMate814930];
GO
IF OBJECT_ID(N'[dbo].[FK_FKEntradaPro653931]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EntradaProductos] DROP CONSTRAINT [FK_FKEntradaPro653931];
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
IF OBJECT_ID(N'[dbo].[FK_FKProducto766971]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_FKProducto766971];
GO
IF OBJECT_ID(N'[dbo].[FK_FKProveedor135413]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Proveedor] DROP CONSTRAINT [FK_FKProveedor135413];
GO
IF OBJECT_ID(N'[dbo].[FK_FKSalario6470]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Salario] DROP CONSTRAINT [FK_FKSalario6470];
GO
IF OBJECT_ID(N'[dbo].[FK_FKSalidaMate497011]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalidaMateriales] DROP CONSTRAINT [FK_FKSalidaMate497011];
GO
IF OBJECT_ID(N'[dbo].[FK_FKTrabajador28344]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Trabajador] DROP CONSTRAINT [FK_FKTrabajador28344];
GO
IF OBJECT_ID(N'[dbo].[FK_FKTrabajador596797]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Trabajador] DROP CONSTRAINT [FK_FKTrabajador596797];
GO
IF OBJECT_ID(N'[dbo].[FK_FKVentas365277]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ventas] DROP CONSTRAINT [FK_FKVentas365277];
GO
IF OBJECT_ID(N'[dbo].[FK_FKVentas49889]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ventas] DROP CONSTRAINT [FK_FKVentas49889];
GO
IF OBJECT_ID(N'[dbo].[FK_Proveedor_Material_Material]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Proveedor_Material] DROP CONSTRAINT [FK_Proveedor_Material_Material];
GO
IF OBJECT_ID(N'[dbo].[FK_Proveedor_Material_Proveedor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Proveedor_Material] DROP CONSTRAINT [FK_Proveedor_Material_Proveedor];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AreaTrabajo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AreaTrabajo];
GO
IF OBJECT_ID(N'[dbo].[CompraMateriales]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CompraMateriales];
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
IF OBJECT_ID(N'[dbo].[OtrosGastos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OtrosGastos];
GO
IF OBJECT_ID(N'[dbo].[Persona]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Persona];
GO
IF OBJECT_ID(N'[dbo].[Producto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Producto];
GO
IF OBJECT_ID(N'[dbo].[Producto_Material]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Producto_Material];
GO
IF OBJECT_ID(N'[dbo].[Proveedor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Proveedor];
GO
IF OBJECT_ID(N'[dbo].[Proveedor_Material]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Proveedor_Material];
GO
IF OBJECT_ID(N'[dbo].[Salario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Salario];
GO
IF OBJECT_ID(N'[dbo].[SalidaMateriales]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalidaMateriales];
GO
IF OBJECT_ID(N'[dbo].[Trabajador]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Trabajador];
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

-- Creating table 'AreaTrabajo'
CREATE TABLE [dbo].[AreaTrabajo] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(255)  NOT NULL
);
GO

-- Creating table 'CompraMateriales'
CREATE TABLE [dbo].[CompraMateriales] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime  NOT NULL,
    [Importe] decimal(19,2)  NOT NULL,
    [Cantidad] int  NOT NULL,
    [Observacion] varchar(255)  NULL,
    [UsuarioId] varchar(255)  NOT NULL,
    [InvertarioMaterialesId] int  NOT NULL,
    [ProveedorPersonaId] int  NOT NULL
);
GO

-- Creating table 'ConceptoGasto'
CREATE TABLE [dbo].[ConceptoGasto] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(255)  NOT NULL,
    [Descripcion] varchar(255)  NULL
);
GO

-- Creating table 'EntradaProductos'
CREATE TABLE [dbo].[EntradaProductos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime  NOT NULL,
    [Importe] decimal(19,2)  NOT NULL,
    [Cantidad] int  NOT NULL,
    [Observacion] varchar(255)  NULL,
    [UsuarioId] varchar(255)  NOT NULL,
    [InvertarioProductosId] int  NOT NULL
);
GO

-- Creating table 'InvertarioMateriales'
CREATE TABLE [dbo].[InvertarioMateriales] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MaterialId] int  NOT NULL,
    [Precio] decimal(19,2)  NOT NULL,
    [Existencia] int  NOT NULL,
    [Descripcion] varchar(255)  NULL
);
GO

-- Creating table 'InvertarioProductos'
CREATE TABLE [dbo].[InvertarioProductos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ProductoId] int  NOT NULL,
    [CostoUnitario] decimal(19,2)  NOT NULL,
    [Existencia] int  NOT NULL
);
GO

-- Creating table 'Material'
CREATE TABLE [dbo].[Material] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(255)  NOT NULL,
    [Descripcion] varchar(255)  NULL,
    [UnidadMedidaId] int  NOT NULL
);
GO

-- Creating table 'OtrosGastos'
CREATE TABLE [dbo].[OtrosGastos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime  NOT NULL,
    [Importe] decimal(19,2)  NOT NULL,
    [UsuarioId] varchar(255)  NOT NULL,
    [ConceptoGastoId] int  NOT NULL
);
GO

-- Creating table 'Persona'
CREATE TABLE [dbo].[Persona] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NombreApellidos] varchar(255)  NOT NULL,
    [Direccion] varchar(255)  NULL,
    [Telefono] varchar(255)  NULL
);
GO

-- Creating table 'Producto'
CREATE TABLE [dbo].[Producto] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(255)  NOT NULL,
    [Descripcion] varchar(255)  NULL,
    [UnidadMedidaId] int  NOT NULL
);
GO

-- Creating table 'Producto_Material'
CREATE TABLE [dbo].[Producto_Material] (
    [ProductoId] int  NOT NULL,
    [MaterialId] int  NOT NULL,
    [Cantidad] int  NOT NULL
);
GO

-- Creating table 'Persona_Proveedor'
CREATE TABLE [dbo].[Persona_Proveedor] (
    [Email] varchar(255)  NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Salario'
CREATE TABLE [dbo].[Salario] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime  NOT NULL,
    [Importe] decimal(19,2)  NOT NULL,
    [TrabajadorPersonaId] int  NOT NULL
);
GO

-- Creating table 'SalidaMateriales'
CREATE TABLE [dbo].[SalidaMateriales] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime  NOT NULL,
    [Cantidad] int  NOT NULL,
    [Observacion] varchar(255)  NULL,
    [UsuarioId] varchar(255)  NOT NULL,
    [InvertarioMaterialesId] int  NOT NULL
);
GO

-- Creating table 'Persona_Trabajador'
CREATE TABLE [dbo].[Persona_Trabajador] (
    [AreaTrabajoId] int  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'UnidadMedida'
CREATE TABLE [dbo].[UnidadMedida] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Unidad] varchar(255)  NOT NULL,
    [Siglas] varchar(5)  NOT NULL
);
GO

-- Creating table 'Ventas'
CREATE TABLE [dbo].[Ventas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime  NOT NULL,
    [Importe] decimal(19,2)  NOT NULL,
    [Cantidad] int  NOT NULL,
    [Observacion] varchar(255)  NULL,
    [UsuarioId] varchar(255)  NOT NULL,
    [InvertarioProductosId] int  NOT NULL,
    [TrabajadorPersonaId] int  NOT NULL
);
GO

-- Creating table 'Proveedor_Material'
CREATE TABLE [dbo].[Proveedor_Material] (
    [Material_Id] int  NOT NULL,
    [Proveedor_Id] int  NOT NULL
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

-- Creating primary key on [Id] in table 'CompraMateriales'
ALTER TABLE [dbo].[CompraMateriales]
ADD CONSTRAINT [PK_CompraMateriales]
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

-- Creating primary key on [Id] in table 'Producto'
ALTER TABLE [dbo].[Producto]
ADD CONSTRAINT [PK_Producto]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ProductoId], [MaterialId] in table 'Producto_Material'
ALTER TABLE [dbo].[Producto_Material]
ADD CONSTRAINT [PK_Producto_Material]
    PRIMARY KEY CLUSTERED ([ProductoId], [MaterialId] ASC);
GO

-- Creating primary key on [Id] in table 'Persona_Proveedor'
ALTER TABLE [dbo].[Persona_Proveedor]
ADD CONSTRAINT [PK_Persona_Proveedor]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Salario'
ALTER TABLE [dbo].[Salario]
ADD CONSTRAINT [PK_Salario]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SalidaMateriales'
ALTER TABLE [dbo].[SalidaMateriales]
ADD CONSTRAINT [PK_SalidaMateriales]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Persona_Trabajador'
ALTER TABLE [dbo].[Persona_Trabajador]
ADD CONSTRAINT [PK_Persona_Trabajador]
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

-- Creating primary key on [Material_Id], [Proveedor_Id] in table 'Proveedor_Material'
ALTER TABLE [dbo].[Proveedor_Material]
ADD CONSTRAINT [PK_Proveedor_Material]
    PRIMARY KEY CLUSTERED ([Material_Id], [Proveedor_Id] ASC);
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

-- Creating non-clustered index for FOREIGN KEY 'FK_FKTrabajador28344'
CREATE INDEX [IX_FK_FKTrabajador28344]
ON [dbo].[Persona_Trabajador]
    ([AreaTrabajoId]);
GO

-- Creating foreign key on [InvertarioMaterialesId] in table 'CompraMateriales'
ALTER TABLE [dbo].[CompraMateriales]
ADD CONSTRAINT [FK_FKCompraMate219076]
    FOREIGN KEY ([InvertarioMaterialesId])
    REFERENCES [dbo].[InvertarioMateriales]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKCompraMate219076'
CREATE INDEX [IX_FK_FKCompraMate219076]
ON [dbo].[CompraMateriales]
    ([InvertarioMaterialesId]);
GO

-- Creating foreign key on [ProveedorPersonaId] in table 'CompraMateriales'
ALTER TABLE [dbo].[CompraMateriales]
ADD CONSTRAINT [FK_FKCompraMate814930]
    FOREIGN KEY ([ProveedorPersonaId])
    REFERENCES [dbo].[Persona_Proveedor]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKCompraMate814930'
CREATE INDEX [IX_FK_FKCompraMate814930]
ON [dbo].[CompraMateriales]
    ([ProveedorPersonaId]);
GO

-- Creating foreign key on [ConceptoGastoId] in table 'OtrosGastos'
ALTER TABLE [dbo].[OtrosGastos]
ADD CONSTRAINT [FK_FKOtrosGasto791932]
    FOREIGN KEY ([ConceptoGastoId])
    REFERENCES [dbo].[ConceptoGasto]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKOtrosGasto791932'
CREATE INDEX [IX_FK_FKOtrosGasto791932]
ON [dbo].[OtrosGastos]
    ([ConceptoGastoId]);
GO

-- Creating foreign key on [InvertarioProductosId] in table 'EntradaProductos'
ALTER TABLE [dbo].[EntradaProductos]
ADD CONSTRAINT [FK_FKEntradaPro653931]
    FOREIGN KEY ([InvertarioProductosId])
    REFERENCES [dbo].[InvertarioProductos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKEntradaPro653931'
CREATE INDEX [IX_FK_FKEntradaPro653931]
ON [dbo].[EntradaProductos]
    ([InvertarioProductosId]);
GO

-- Creating foreign key on [MaterialId] in table 'InvertarioMateriales'
ALTER TABLE [dbo].[InvertarioMateriales]
ADD CONSTRAINT [FK_FKInvertario965581]
    FOREIGN KEY ([MaterialId])
    REFERENCES [dbo].[Material]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKInvertario965581'
CREATE INDEX [IX_FK_FKInvertario965581]
ON [dbo].[InvertarioMateriales]
    ([MaterialId]);
GO

-- Creating foreign key on [InvertarioMaterialesId] in table 'SalidaMateriales'
ALTER TABLE [dbo].[SalidaMateriales]
ADD CONSTRAINT [FK_FKSalidaMate497011]
    FOREIGN KEY ([InvertarioMaterialesId])
    REFERENCES [dbo].[InvertarioMateriales]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKSalidaMate497011'
CREATE INDEX [IX_FK_FKSalidaMate497011]
ON [dbo].[SalidaMateriales]
    ([InvertarioMaterialesId]);
GO

-- Creating foreign key on [ProductoId] in table 'InvertarioProductos'
ALTER TABLE [dbo].[InvertarioProductos]
ADD CONSTRAINT [FK_FKInvertario944054]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Producto]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

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

-- Creating non-clustered index for FOREIGN KEY 'FK_FKMaterial596249'
CREATE INDEX [IX_FK_FKMaterial596249]
ON [dbo].[Material]
    ([UnidadMedidaId]);
GO

-- Creating foreign key on [MaterialId] in table 'Producto_Material'
ALTER TABLE [dbo].[Producto_Material]
ADD CONSTRAINT [FK_FKProducto_M10400]
    FOREIGN KEY ([MaterialId])
    REFERENCES [dbo].[Material]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKProducto_M10400'
CREATE INDEX [IX_FK_FKProducto_M10400]
ON [dbo].[Producto_Material]
    ([MaterialId]);
GO

-- Creating foreign key on [ProductoId] in table 'Producto_Material'
ALTER TABLE [dbo].[Producto_Material]
ADD CONSTRAINT [FK_FKProducto_M71108]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Producto]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [UnidadMedidaId] in table 'Producto'
ALTER TABLE [dbo].[Producto]
ADD CONSTRAINT [FK_FKProducto766971]
    FOREIGN KEY ([UnidadMedidaId])
    REFERENCES [dbo].[UnidadMedida]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKProducto766971'
CREATE INDEX [IX_FK_FKProducto766971]
ON [dbo].[Producto]
    ([UnidadMedidaId]);
GO

-- Creating foreign key on [TrabajadorPersonaId] in table 'Salario'
ALTER TABLE [dbo].[Salario]
ADD CONSTRAINT [FK_FKSalario6470]
    FOREIGN KEY ([TrabajadorPersonaId])
    REFERENCES [dbo].[Persona_Trabajador]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

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

-- Creating non-clustered index for FOREIGN KEY 'FK_FKVentas365277'
CREATE INDEX [IX_FK_FKVentas365277]
ON [dbo].[Ventas]
    ([TrabajadorPersonaId]);
GO

-- Creating foreign key on [Material_Id] in table 'Proveedor_Material'
ALTER TABLE [dbo].[Proveedor_Material]
ADD CONSTRAINT [FK_Proveedor_Material_Material]
    FOREIGN KEY ([Material_Id])
    REFERENCES [dbo].[Material]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Proveedor_Id] in table 'Proveedor_Material'
ALTER TABLE [dbo].[Proveedor_Material]
ADD CONSTRAINT [FK_Proveedor_Material_Proveedor]
    FOREIGN KEY ([Proveedor_Id])
    REFERENCES [dbo].[Persona_Proveedor]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Proveedor_Material_Proveedor'
CREATE INDEX [IX_FK_Proveedor_Material_Proveedor]
ON [dbo].[Proveedor_Material]
    ([Proveedor_Id]);
GO

-- Creating foreign key on [Id] in table 'Persona_Proveedor'
ALTER TABLE [dbo].[Persona_Proveedor]
ADD CONSTRAINT [FK_Proveedor_inherits_Persona]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Persona]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Persona_Trabajador'
ALTER TABLE [dbo].[Persona_Trabajador]
ADD CONSTRAINT [FK_Trabajador_inherits_Persona]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Persona]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------