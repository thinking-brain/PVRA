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
    [UsuarioId] nvarchar(128)   NOT NULL,
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
    [UsuarioId] nvarchar(128)  NOT NULL,
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
    [UsuarioId] nvarchar(128)   NOT NULL,
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

-- Creating table 'Proveedor'
CREATE TABLE [dbo].[Proveedor] (
    [PersonaId] int  NOT NULL,
    [Email] varchar(255)  NULL
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
    [UsuarioId] nvarchar(128)   NOT NULL,
    [InvertarioMaterialesId] int  NOT NULL
);
GO

-- Creating table 'Trabajador'
CREATE TABLE [dbo].[Trabajador] (
    [PersonaId] int  NOT NULL,
    [AreaTrabajoId] int  NOT NULL
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
    [UsuarioId] nvarchar(128)   NOT NULL,
    [InvertarioProductosId] int  NOT NULL,
    [TrabajadorPersonaId] int  NOT NULL
);
GO

-- Creating table 'Proveedor_Material'
CREATE TABLE [dbo].[Proveedor_Material] (
    [Proveedor_PersonaId] int  NOT NULL,
    [Material_Id] int  NOT NULL
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

-- Creating primary key on [PersonaId] in table 'Proveedor'
ALTER TABLE [dbo].[Proveedor]
ADD CONSTRAINT [PK_Proveedor]
    PRIMARY KEY CLUSTERED ([PersonaId] ASC);
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

-- Creating primary key on [PersonaId] in table 'Trabajador'
ALTER TABLE [dbo].[Trabajador]
ADD CONSTRAINT [PK_Trabajador]
    PRIMARY KEY CLUSTERED ([PersonaId] ASC);
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

-- Creating primary key on [Proveedor_PersonaId], [Material_Id] in table 'Proveedor_Material'
ALTER TABLE [dbo].[Proveedor_Material]
ADD CONSTRAINT [PK_Proveedor_Material]
    PRIMARY KEY CLUSTERED ([Proveedor_PersonaId], [Material_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AreaTrabajoId] in table 'Trabajador'
ALTER TABLE [dbo].[Trabajador]
ADD CONSTRAINT [FK_FKTrabajador28344]
    FOREIGN KEY ([AreaTrabajoId])
    REFERENCES [dbo].[AreaTrabajo]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKTrabajador28344'
CREATE INDEX [IX_FK_FKTrabajador28344]
ON [dbo].[Trabajador]
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

-- Creating foreign key on [UsuarioId] in table 'CompraMateriales'
ALTER TABLE [dbo].[CompraMateriales]
ADD CONSTRAINT [FK_FKCompraMate522193]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKCompraMate522193'
CREATE INDEX [IX_FK_FKCompraMate522193]
ON [dbo].[CompraMateriales]
    ([UsuarioId]);
GO

-- Creating foreign key on [ProveedorPersonaId] in table 'CompraMateriales'
ALTER TABLE [dbo].[CompraMateriales]
ADD CONSTRAINT [FK_FKCompraMate814930]
    FOREIGN KEY ([ProveedorPersonaId])
    REFERENCES [dbo].[Proveedor]
        ([PersonaId])
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

-- Creating foreign key on [UsuarioId] in table 'EntradaProductos'
ALTER TABLE [dbo].[EntradaProductos]
ADD CONSTRAINT [FK_FKEntradaPro774223]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKEntradaPro774223'
CREATE INDEX [IX_FK_FKEntradaPro774223]
ON [dbo].[EntradaProductos]
    ([UsuarioId]);
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

-- Creating foreign key on [UsuarioId] in table 'OtrosGastos'
ALTER TABLE [dbo].[OtrosGastos]
ADD CONSTRAINT [FK_FKOtrosGasto598550]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKOtrosGasto598550'
CREATE INDEX [IX_FK_FKOtrosGasto598550]
ON [dbo].[OtrosGastos]
    ([UsuarioId]);
GO

-- Creating foreign key on [PersonaId] in table 'Proveedor'
ALTER TABLE [dbo].[Proveedor]
ADD CONSTRAINT [FK_FKProveedor135413]
    FOREIGN KEY ([PersonaId])
    REFERENCES [dbo].[Persona]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PersonaId] in table 'Trabajador'
ALTER TABLE [dbo].[Trabajador]
ADD CONSTRAINT [FK_FKTrabajador596797]
    FOREIGN KEY ([PersonaId])
    REFERENCES [dbo].[Persona]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
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
    REFERENCES [dbo].[Trabajador]
        ([PersonaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKSalario6470'
CREATE INDEX [IX_FK_FKSalario6470]
ON [dbo].[Salario]
    ([TrabajadorPersonaId]);
GO

-- Creating foreign key on [UsuarioId] in table 'SalidaMateriales'
ALTER TABLE [dbo].[SalidaMateriales]
ADD CONSTRAINT [FK_FKSalidaMate199871]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKSalidaMate199871'
CREATE INDEX [IX_FK_FKSalidaMate199871]
ON [dbo].[SalidaMateriales]
    ([UsuarioId]);
GO

-- Creating foreign key on [TrabajadorPersonaId] in table 'Ventas'
ALTER TABLE [dbo].[Ventas]
ADD CONSTRAINT [FK_FKVentas365277]
    FOREIGN KEY ([TrabajadorPersonaId])
    REFERENCES [dbo].[Trabajador]
        ([PersonaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKVentas365277'
CREATE INDEX [IX_FK_FKVentas365277]
ON [dbo].[Ventas]
    ([TrabajadorPersonaId]);
GO

-- Creating foreign key on [UsuarioId] in table 'Ventas'
ALTER TABLE [dbo].[Ventas]
ADD CONSTRAINT [FK_FKVentas170181]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKVentas170181'
CREATE INDEX [IX_FK_FKVentas170181]
ON [dbo].[Ventas]
    ([UsuarioId]);
GO

-- Creating foreign key on [Proveedor_PersonaId] in table 'Proveedor_Material'
ALTER TABLE [dbo].[Proveedor_Material]
ADD CONSTRAINT [FK_Proveedor_Material_Proveedor]
    FOREIGN KEY ([Proveedor_PersonaId])
    REFERENCES [dbo].[Proveedor]
        ([PersonaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Material_Id] in table 'Proveedor_Material'
ALTER TABLE [dbo].[Proveedor_Material]
ADD CONSTRAINT [FK_Proveedor_Material_Material]
    FOREIGN KEY ([Material_Id])
    REFERENCES [dbo].[Material]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Proveedor_Material_Material'
CREATE INDEX [IX_FK_Proveedor_Material_Material]
ON [dbo].[Proveedor_Material]
    ([Material_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------