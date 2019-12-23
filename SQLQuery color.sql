-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_FKTrabajador28344]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Persona_Trabajador] DROP CONSTRAINT [FK_FKTrabajador28344];
GO
IF OBJECT_ID(N'[dbo].[FK_FKCompraMate814930]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CompraMateriales] DROP CONSTRAINT [FK_FKCompraMate814930];
GO
IF OBJECT_ID(N'[dbo].[FK_FKOtrosGasto791932]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OtrosGastos] DROP CONSTRAINT [FK_FKOtrosGasto791932];
GO
IF OBJECT_ID(N'[dbo].[FK_FKInvertario965581]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InvertarioMateriales] DROP CONSTRAINT [FK_FKInvertario965581];
GO
IF OBJECT_ID(N'[dbo].[FK_FKSalidaMate497011]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalidaMateriales] DROP CONSTRAINT [FK_FKSalidaMate497011];
GO
IF OBJECT_ID(N'[dbo].[FK_FKInvertario944054]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InvertarioProductos] DROP CONSTRAINT [FK_FKInvertario944054];
GO
IF OBJECT_ID(N'[dbo].[FK_FKVentas49889]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ventas] DROP CONSTRAINT [FK_FKVentas49889];
GO
IF OBJECT_ID(N'[dbo].[FK_FKMaterial596249]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Material] DROP CONSTRAINT [FK_FKMaterial596249];
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
IF OBJECT_ID(N'[dbo].[FK_FKSalario6470]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Salario] DROP CONSTRAINT [FK_FKSalario6470];
GO
IF OBJECT_ID(N'[dbo].[FK_FKVentas365277]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ventas] DROP CONSTRAINT [FK_FKVentas365277];
GO
IF OBJECT_ID(N'[dbo].[FK_MaterialCompraMateriales]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CompraMateriales] DROP CONSTRAINT [FK_MaterialCompraMateriales];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductoEntradaProductos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EntradaProductos] DROP CONSTRAINT [FK_ProductoEntradaProductos];
GO
IF OBJECT_ID(N'[dbo].[FK_ConceptoCostoCostoProduccion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Salario_CostoProduccion] DROP CONSTRAINT [FK_ConceptoCostoCostoProduccion];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductoProductoConfeccionado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductoConfeccionadoSet] DROP CONSTRAINT [FK_ProductoProductoConfeccionado];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductoConfeccionadoCostoProduccion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Salario_CostoProduccion] DROP CONSTRAINT [FK_ProductoConfeccionadoCostoProduccion];
GO
IF OBJECT_ID(N'[dbo].[FK_ColorMaterial]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Material] DROP CONSTRAINT [FK_ColorMaterial];
GO
IF OBJECT_ID(N'[dbo].[FK_OcupacionTrabajador]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Persona_Trabajador] DROP CONSTRAINT [FK_OcupacionTrabajador];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductoConfeccionadoProductoConfeccionadoInventarioMaterial]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductoConfeccionadoInventarioMaterialSet] DROP CONSTRAINT [FK_ProductoConfeccionadoProductoConfeccionadoInventarioMaterial];
GO
IF OBJECT_ID(N'[dbo].[FK_InvertarioMaterialesProductoConfeccionadoInventarioMaterial]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductoConfeccionadoInventarioMaterialSet] DROP CONSTRAINT [FK_InvertarioMaterialesProductoConfeccionadoInventarioMaterial];
GO
IF OBJECT_ID(N'[dbo].[FK_EntradaProductosProductoConfeccionado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductoConfeccionadoSet] DROP CONSTRAINT [FK_EntradaProductosProductoConfeccionado];
GO
IF OBJECT_ID(N'[dbo].[FK_Proveedor_inherits_Persona]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Persona_Proveedor] DROP CONSTRAINT [FK_Proveedor_inherits_Persona];
GO
IF OBJECT_ID(N'[dbo].[FK_Trabajador_inherits_Persona]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Persona_Trabajador] DROP CONSTRAINT [FK_Trabajador_inherits_Persona];
GO
IF OBJECT_ID(N'[dbo].[FK_CostoProduccion_inherits_Salario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Salario_CostoProduccion] DROP CONSTRAINT [FK_CostoProduccion_inherits_Salario];
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
IF OBJECT_ID(N'[dbo].[Persona_Proveedor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Persona_Proveedor];
GO
IF OBJECT_ID(N'[dbo].[Salario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Salario];
GO
IF OBJECT_ID(N'[dbo].[SalidaMateriales]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalidaMateriales];
GO
IF OBJECT_ID(N'[dbo].[Persona_Trabajador]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Persona_Trabajador];
GO
IF OBJECT_ID(N'[dbo].[UnidadMedida]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UnidadMedida];
GO
IF OBJECT_ID(N'[dbo].[Ventas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ventas];
GO
IF OBJECT_ID(N'[dbo].[ConceptoCostoSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ConceptoCostoSet];
GO
IF OBJECT_ID(N'[dbo].[ProductoConfeccionadoSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductoConfeccionadoSet];
GO
IF OBJECT_ID(N'[dbo].[ColorSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ColorSet];
GO
IF OBJECT_ID(N'[dbo].[OcupacionSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OcupacionSet];
GO
IF OBJECT_ID(N'[dbo].[ProductoConfeccionadoInventarioMaterialSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductoConfeccionadoInventarioMaterialSet];
GO
IF OBJECT_ID(N'[dbo].[Salario_CostoProduccion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Salario_CostoProduccion];
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
    [ProveedorPersonaId] int  NOT NULL,
    [MaterialId] int  NOT NULL
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
    [ProductoId] int  NOT NULL
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
    [UnidadMedidaId] int  NOT NULL,
    [ColorId] int  NOT NULL
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
    [Modelo] nvarchar(max)  NOT NULL,
    [Talla] int  NOT NULL,
    [ColorId] int  NOT NULL
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
    [OcupacionId] int  NOT NULL,
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

-- Creating table 'ConceptoCosto'
CREATE TABLE [dbo].[ConceptoCosto] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ProductoConfeccionado'
CREATE TABLE [dbo].[ProductoConfeccionado] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime  NOT NULL,
    [Cantidad] int  NOT NULL,
    [ProductoId] int  NOT NULL,
    [EntradaProductos_Id] int  NULL
);
GO

-- Creating table 'Color'
CREATE TABLE [dbo].[Color] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Descripcion] nvarchar(max)  NULL
);
GO

-- Creating table 'Ocupacion'
CREATE TABLE [dbo].[Ocupacion] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ProductoConfeccionadoInventarioMaterial'
CREATE TABLE [dbo].[ProductoConfeccionadoInventarioMaterial] (
    [ProductoConfeccionadoId] int  NOT NULL,
    [InvertarioMaterialesId] int  NOT NULL,
    [Cantidad] int  NOT NULL
);
GO

-- Creating table 'Salario_CostoProduccion'
CREATE TABLE [dbo].[Salario_CostoProduccion] (
    [ConceptoCostoId] int  NOT NULL,
    [ProductoConfeccionadoId] int  NOT NULL,
    [Id] int  NOT NULL
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

-- Creating primary key on [Id] in table 'ConceptoCosto'
ALTER TABLE [dbo].[ConceptoCosto]
ADD CONSTRAINT [PK_ConceptoCosto]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProductoConfeccionado'
ALTER TABLE [dbo].[ProductoConfeccionado]
ADD CONSTRAINT [PK_ProductoConfeccionado]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Color'
ALTER TABLE [dbo].[Color]
ADD CONSTRAINT [PK_Color]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Ocupacion'
ALTER TABLE [dbo].[Ocupacion]
ADD CONSTRAINT [PK_Ocupacion]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ProductoConfeccionadoId], [InvertarioMaterialesId] in table 'ProductoConfeccionadoInventarioMaterial'
ALTER TABLE [dbo].[ProductoConfeccionadoInventarioMaterial]
ADD CONSTRAINT [PK_ProductoConfeccionadoInventarioMaterial]
    PRIMARY KEY CLUSTERED ([ProductoConfeccionadoId], [InvertarioMaterialesId] ASC);
GO

-- Creating primary key on [Id] in table 'Salario_CostoProduccion'
ALTER TABLE [dbo].[Salario_CostoProduccion]
ADD CONSTRAINT [PK_Salario_CostoProduccion]
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

-- Creating non-clustered index for FOREIGN KEY 'FK_FKTrabajador28344'
CREATE INDEX [IX_FK_FKTrabajador28344]
ON [dbo].[Persona_Trabajador]
    ([AreaTrabajoId]);
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

-- Creating foreign key on [MaterialId] in table 'CompraMateriales'
ALTER TABLE [dbo].[CompraMateriales]
ADD CONSTRAINT [FK_MaterialCompraMateriales]
    FOREIGN KEY ([MaterialId])
    REFERENCES [dbo].[Material]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MaterialCompraMateriales'
CREATE INDEX [IX_FK_MaterialCompraMateriales]
ON [dbo].[CompraMateriales]
    ([MaterialId]);
GO

-- Creating foreign key on [ProductoId] in table 'EntradaProductos'
ALTER TABLE [dbo].[EntradaProductos]
ADD CONSTRAINT [FK_ProductoEntradaProductos]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Producto]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoEntradaProductos'
CREATE INDEX [IX_FK_ProductoEntradaProductos]
ON [dbo].[EntradaProductos]
    ([ProductoId]);
GO

-- Creating foreign key on [ConceptoCostoId] in table 'Salario_CostoProduccion'
ALTER TABLE [dbo].[Salario_CostoProduccion]
ADD CONSTRAINT [FK_ConceptoCostoCostoProduccion]
    FOREIGN KEY ([ConceptoCostoId])
    REFERENCES [dbo].[ConceptoCosto]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ConceptoCostoCostoProduccion'
CREATE INDEX [IX_FK_ConceptoCostoCostoProduccion]
ON [dbo].[Salario_CostoProduccion]
    ([ConceptoCostoId]);
GO

-- Creating foreign key on [ProductoId] in table 'ProductoConfeccionado'
ALTER TABLE [dbo].[ProductoConfeccionado]
ADD CONSTRAINT [FK_ProductoProductoConfeccionado]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Producto]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoProductoConfeccionado'
CREATE INDEX [IX_FK_ProductoProductoConfeccionado]
ON [dbo].[ProductoConfeccionado]
    ([ProductoId]);
GO

-- Creating foreign key on [ProductoConfeccionadoId] in table 'Salario_CostoProduccion'
ALTER TABLE [dbo].[Salario_CostoProduccion]
ADD CONSTRAINT [FK_ProductoConfeccionadoCostoProduccion]
    FOREIGN KEY ([ProductoConfeccionadoId])
    REFERENCES [dbo].[ProductoConfeccionado]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoConfeccionadoCostoProduccion'
CREATE INDEX [IX_FK_ProductoConfeccionadoCostoProduccion]
ON [dbo].[Salario_CostoProduccion]
    ([ProductoConfeccionadoId]);
GO

-- Creating foreign key on [ColorId] in table 'Material'
ALTER TABLE [dbo].[Material]
ADD CONSTRAINT [FK_ColorMaterial]
    FOREIGN KEY ([ColorId])
    REFERENCES [dbo].[Color]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ColorMaterial'
CREATE INDEX [IX_FK_ColorMaterial]
ON [dbo].[Material]
    ([ColorId]);
GO

-- Creating foreign key on [OcupacionId] in table 'Persona_Trabajador'
ALTER TABLE [dbo].[Persona_Trabajador]
ADD CONSTRAINT [FK_OcupacionTrabajador]
    FOREIGN KEY ([OcupacionId])
    REFERENCES [dbo].[Ocupacion]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OcupacionTrabajador'
CREATE INDEX [IX_FK_OcupacionTrabajador]
ON [dbo].[Persona_Trabajador]
    ([OcupacionId]);
GO

-- Creating foreign key on [ProductoConfeccionadoId] in table 'ProductoConfeccionadoInventarioMaterial'
ALTER TABLE [dbo].[ProductoConfeccionadoInventarioMaterial]
ADD CONSTRAINT [FK_ProductoConfeccionadoProductoConfeccionadoInventarioMaterial]
    FOREIGN KEY ([ProductoConfeccionadoId])
    REFERENCES [dbo].[ProductoConfeccionado]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [InvertarioMaterialesId] in table 'ProductoConfeccionadoInventarioMaterial'
ALTER TABLE [dbo].[ProductoConfeccionadoInventarioMaterial]
ADD CONSTRAINT [FK_InvertarioMaterialesProductoConfeccionadoInventarioMaterial]
    FOREIGN KEY ([InvertarioMaterialesId])
    REFERENCES [dbo].[InvertarioMateriales]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_InvertarioMaterialesProductoConfeccionadoInventarioMaterial'
CREATE INDEX [IX_FK_InvertarioMaterialesProductoConfeccionadoInventarioMaterial]
ON [dbo].[ProductoConfeccionadoInventarioMaterial]
    ([InvertarioMaterialesId]);
GO

-- Creating foreign key on [EntradaProductos_Id] in table 'ProductoConfeccionado'
ALTER TABLE [dbo].[ProductoConfeccionado]
ADD CONSTRAINT [FK_EntradaProductosProductoConfeccionado]
    FOREIGN KEY ([EntradaProductos_Id])
    REFERENCES [dbo].[EntradaProductos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EntradaProductosProductoConfeccionado'
CREATE INDEX [IX_FK_EntradaProductosProductoConfeccionado]
ON [dbo].[ProductoConfeccionado]
    ([EntradaProductos_Id]);
GO

-- Creating foreign key on [ColorId] in table 'Producto'
ALTER TABLE [dbo].[Producto]
ADD CONSTRAINT [FK_ProductoColor]
    FOREIGN KEY ([ColorId])
    REFERENCES [dbo].[Color]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoColor'
CREATE INDEX [IX_FK_ProductoColor]
ON [dbo].[Producto]
    ([ColorId]);
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

-- Creating foreign key on [Id] in table 'Salario_CostoProduccion'
ALTER TABLE [dbo].[Salario_CostoProduccion]
ADD CONSTRAINT [FK_CostoProduccion_inherits_Salario]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Salario]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

GO

CREATE TRIGGER [dbo].[Trigger_CompraMaterialesInsert]
    ON [dbo].[CompraMateriales]
    AFTER INSERT
    AS
	IF EXISTS (SELECT * FROM dbo.InvertarioMateriales as inv,inserted as i WHERE inv.MaterialId = i.MaterialId AND inv.Precio = i.Importe/i.Cantidad)
    BEGIN
        UPDATE dbo.InvertarioMateriales SET Existencia = (Existencia + (SELECT Cantidad FROM inserted)) WHERE  MaterialId = (SELECT MaterialId FROM inserted) AND Precio =((SELECT Importe FROM inserted)/(SELECT Cantidad FROM inserted));
    END
	IF NOT EXISTS (SELECT * FROM dbo.InvertarioMateriales as inv,inserted as i WHERE inv.MaterialId = i.MaterialId AND inv.Precio = i.Importe/i.Cantidad)
    BEGIN
		INSERT INTO InvertarioMateriales VALUES((SELECT MaterialId FROM inserted),((SELECT Importe FROM inserted)/(SELECT Cantidad FROM inserted)),0,NULL)
        UPDATE dbo.InvertarioMateriales SET Existencia = (Existencia + (SELECT Cantidad FROM inserted)) WHERE  MaterialId = (SELECT MaterialId FROM inserted) AND Precio =((SELECT Importe FROM inserted)/(SELECT Cantidad FROM inserted));
    END
GO

CREATE TRIGGER [dbo].[Trigger_CompraMaterialesUpdate]
    ON [dbo].[CompraMateriales]
    AFTER UPDATE
    AS
	IF NOT EXISTS (SELECT * FROM dbo.InvertarioMateriales as inv,inserted as i WHERE inv.MaterialId = i.MaterialId AND inv.Precio = i.Importe/i.Cantidad)
    BEGIN
		INSERT INTO InvertarioMateriales VALUES((SELECT MaterialId FROM inserted),((SELECT Importe FROM inserted)/(SELECT Cantidad FROM inserted)),0,NULL)        
    END
    BEGIN
		UPDATE dbo.InvertarioMateriales SET Existencia = (Existencia - (SELECT Cantidad FROM deleted)) WHERE  MaterialId = (SELECT MaterialId FROM deleted) AND Precio =((SELECT Importe FROM deleted)/(SELECT Cantidad FROM deleted));
        UPDATE dbo.InvertarioMateriales SET Existencia = (Existencia + (SELECT Cantidad FROM inserted)) WHERE  MaterialId = (SELECT MaterialId FROM inserted) AND Precio =((SELECT Importe FROM inserted)/(SELECT Cantidad FROM inserted));
    END
GO

CREATE TRIGGER [dbo].[Trigger_CompraMaterialesDelete]
    ON [dbo].[CompraMateriales]
    FOR DELETE
    AS
	IF (SELECT Existencia FROM dbo.InvertarioMateriales WHERE  MaterialId = (SELECT MaterialId FROM deleted) AND Precio = ((SELECT Importe FROM deleted)/(SELECT Cantidad FROM deleted))) >= (SELECT Cantidad FROM deleted)
    BEGIN
		UPDATE dbo.InvertarioMateriales SET Existencia = (Existencia - (SELECT Cantidad FROM deleted)) WHERE  MaterialId = (SELECT MaterialId FROM deleted) AND Precio =((SELECT Importe FROM deleted)/(SELECT Cantidad FROM deleted));        
    END
	ELSE
	BEGIN
		RAISERROR('No se puede eliminar',16,10)
		ROLLBACK TRANSACTION
	END
	
	GO

CREATE TRIGGER [dbo].[Trigger_EntradaProductosInsert]
    ON [dbo].[EntradaProductos]
    AFTER INSERT
    AS
	IF EXISTS (SELECT * FROM dbo.InvertarioProductos as inv,inserted as i WHERE inv.ProductoId = i.ProductoId AND inv.CostoUnitario = i.Importe/i.Cantidad)
    BEGIN
        UPDATE dbo.InvertarioProductos SET Existencia = (Existencia + (SELECT Cantidad FROM inserted)) WHERE  ProductoId = (SELECT ProductoId FROM inserted) AND CostoUnitario =((SELECT Importe FROM inserted)/(SELECT Cantidad FROM inserted));
    END
	IF NOT EXISTS (SELECT * FROM dbo.InvertarioProductos as inv,inserted as i WHERE inv.ProductoId = i.ProductoId AND inv.CostoUnitario = i.Importe/i.Cantidad)
    BEGIN
		INSERT INTO InvertarioProductos VALUES((SELECT ProductoId FROM inserted),((SELECT Importe FROM inserted)/(SELECT Cantidad FROM inserted)),0)
        UPDATE dbo.InvertarioProductos SET Existencia = (Existencia + (SELECT Cantidad FROM inserted)) WHERE  ProductoId = (SELECT ProductoId FROM inserted) AND CostoUnitario =((SELECT Importe FROM inserted)/(SELECT Cantidad FROM inserted));
    END
GO

CREATE TRIGGER [dbo].[Trigger_EntradaProductosUpdate]
    ON [dbo].[EntradaProductos]
    AFTER UPDATE
    AS
	IF NOT EXISTS (SELECT * FROM dbo.InvertarioProductos as inv,inserted as i WHERE inv.ProductoId = i.ProductoId AND inv.CostoUnitario = i.Importe/i.Cantidad)
    BEGIN
		INSERT INTO InvertarioProductos VALUES((SELECT ProductoId FROM inserted),((SELECT Importe FROM inserted)/(SELECT Cantidad FROM inserted)),0)        
    END
    BEGIN
		UPDATE dbo.InvertarioProductos SET Existencia = (Existencia - (SELECT Cantidad FROM deleted)) WHERE  ProductoId = (SELECT ProductoId FROM deleted) AND CostoUnitario =((SELECT Importe FROM deleted)/(SELECT Cantidad FROM deleted));
        UPDATE dbo.InvertarioProductos SET Existencia = (Existencia + (SELECT Cantidad FROM inserted)) WHERE  ProductoId = (SELECT ProductoId FROM inserted) AND CostoUnitario =((SELECT Importe FROM inserted)/(SELECT Cantidad FROM inserted));
    END
GO

CREATE TRIGGER [dbo].[Trigger_EntradaProductosDelete]
    ON [dbo].[EntradaProductos]
    FOR DELETE
    AS
	IF (SELECT Existencia FROM dbo.InvertarioProductos WHERE  ProductoId = (SELECT ProductoId FROM deleted) AND CostoUnitario = ((SELECT Importe FROM deleted)/(SELECT Cantidad FROM deleted))) >= (SELECT Cantidad FROM deleted)
    BEGIN
		UPDATE dbo.InvertarioProductos SET Existencia = (Existencia - (SELECT Cantidad FROM deleted)) WHERE  ProductoId = (SELECT ProductoId FROM deleted) AND CostoUnitario =((SELECT Importe FROM deleted)/(SELECT Cantidad FROM deleted));        
    END
	ELSE
	BEGIN
		RAISERROR('No se puede eliminar',16,10)
		ROLLBACK TRANSACTION
	END
	
	GO

CREATE TRIGGER [dbo].[Trigger_VentaDelete]
    ON [dbo].[Ventas]
    AFTER DELETE
    AS	
    BEGIN
		UPDATE dbo.InvertarioProductos SET Existencia = (Existencia + (SELECT Cantidad FROM deleted)) WHERE  Id = (SELECT InvertarioProductosId FROM deleted);        
    END
GO

CREATE TRIGGER [dbo].[Trigger_VentaInsert]
    ON [dbo].[Ventas]
    FOR INSERT
    AS
	IF (SELECT Existencia FROM dbo.InvertarioProductos WHERE  Id = (SELECT InvertarioProductosId FROM inserted)) >= (SELECT Cantidad FROM inserted)
    BEGIN
        UPDATE dbo.InvertarioProductos SET Existencia = (Existencia - (SELECT Cantidad FROM inserted)) WHERE  Id = (SELECT InvertarioProductosId FROM inserted);
    END
	ELSE
    BEGIN
		RAISERROR('La cantidad en inventario es menor que la que va a vender',16,10)
		ROLLBACK TRANSACTION
    END
GO

CREATE TRIGGER [dbo].[Trigger_VentaUpdate]
    ON [dbo].[Ventas]
    FOR UPDATE
    AS 
	IF (SELECT Existencia FROM dbo.InvertarioProductos WHERE  Id = (SELECT InvertarioProductosId FROM inserted)) >= (SELECT Cantidad FROM inserted) OR ((SELECT InvertarioProductosId FROM inserted) = (SELECT InvertarioProductosId FROM deleted) AND  (SELECT Existencia FROM dbo.InvertarioMateriales WHERE  Id = (SELECT InvertarioProductosId FROM inserted)) + (SELECT Cantidad FROM deleted)  >= (SELECT Cantidad FROM inserted))
    BEGIN
		UPDATE dbo.InvertarioProductos SET Existencia = (Existencia + (SELECT Cantidad FROM deleted)) WHERE  Id = (SELECT InvertarioProductosId FROM deleted);
        UPDATE dbo.InvertarioProductos SET Existencia = (Existencia - (SELECT Cantidad FROM inserted)) WHERE  Id = (SELECT InvertarioProductosId FROM inserted);
    END
	ELSE
    BEGIN
		RAISERROR('La cantidad en inventario es menor que la que va a vender',16,10)
		ROLLBACK TRANSACTION
    END
	
	GO

CREATE TRIGGER [dbo].[Trigger_SalidaMaterialesDelete]
    ON [dbo].[SalidaMateriales]
    AFTER DELETE
    AS	
    BEGIN
		UPDATE dbo.InvertarioMateriales SET Existencia = (Existencia + (SELECT Cantidad FROM deleted)) WHERE  Id = (SELECT InvertarioMaterialesId FROM deleted);        
    END
GO

CREATE TRIGGER [dbo].[Trigger_SalidaMaterialesInsert]
    ON [dbo].[SalidaMateriales]
    FOR INSERT
    AS
	IF (SELECT Existencia FROM dbo.InvertarioMateriales WHERE  Id = (SELECT InvertarioMaterialesId FROM inserted)) >= (SELECT Cantidad FROM inserted)
    BEGIN
        UPDATE dbo.InvertarioMateriales SET Existencia = (Existencia - (SELECT Cantidad FROM inserted)) WHERE  Id = (SELECT InvertarioMaterialesId FROM inserted);
    END
	ELSE
    BEGIN
		RAISERROR('La cantidad en inventario es menor que la que quiere sacar',16,10)
		ROLLBACK TRANSACTION
    END
GO

CREATE TRIGGER [dbo].[Trigger_SalidaMaterialesUpdate]
    ON [dbo].[SalidaMateriales]
    FOR UPDATE
    AS 
	IF (SELECT Existencia FROM dbo.InvertarioMateriales WHERE  Id = (SELECT InvertarioMaterialesId FROM inserted)) >= (SELECT Cantidad FROM inserted) OR ((SELECT InvertarioMaterialesId FROM inserted) = (SELECT InvertarioMaterialesId FROM deleted) AND  (SELECT Existencia FROM dbo.InvertarioMateriales WHERE  Id = (SELECT InvertarioMaterialesId FROM inserted)) + (SELECT Cantidad FROM deleted)  >= (SELECT Cantidad FROM inserted))
    BEGIN
		UPDATE dbo.InvertarioMateriales SET Existencia = (Existencia + (SELECT Cantidad FROM deleted)) WHERE  Id = (SELECT InvertarioMaterialesId FROM deleted);
        UPDATE dbo.InvertarioMateriales SET Existencia = (Existencia - (SELECT Cantidad FROM inserted)) WHERE  Id = (SELECT InvertarioMaterialesId FROM inserted);
    END
	ELSE
    BEGIN
		RAISERROR('La cantidad en inventario es menor que la que quiere sacar',16,10)
		ROLLBACK TRANSACTION
    END
-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------