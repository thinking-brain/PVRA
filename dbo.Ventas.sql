CREATE TABLE [dbo].[Ventas] (
    [Id]                    INT             IDENTITY (1, 1) NOT NULL,
    [Fecha]                 DATETIME        NOT NULL,
    [Importe]               DECIMAL (19, 2) NOT NULL,
    [Cantidad]              INT             NOT NULL,
    [Observacion]           VARCHAR (255)   NULL,
    [UsuarioId]             VARCHAR (255)   NOT NULL,
    [InvertarioProductosId] INT             NOT NULL,
    [TrabajadorPersonaId]   INT             NOT NULL,
    CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_FKVentas49889] FOREIGN KEY ([InvertarioProductosId]) REFERENCES [dbo].[InvertarioProductos] ([Id]),
    CONSTRAINT [FK_FKVentas365277] FOREIGN KEY ([TrabajadorPersonaId]) REFERENCES [dbo].[Persona_Trabajador] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_FK_FKVentas49889]
    ON [dbo].[Ventas]([InvertarioProductosId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FK_FKVentas365277]
    ON [dbo].[Ventas]([TrabajadorPersonaId] ASC);

	
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