CREATE TABLE [dbo].[EntradaProductos] (
    [Id]          INT             IDENTITY (1, 1) NOT NULL,
    [Fecha]       DATETIME        NOT NULL,
    [Importe]     DECIMAL (19, 2) NOT NULL,
    [Cantidad]    INT             NOT NULL,
    [Observacion] VARCHAR (255)   NULL,
    [UsuarioId]   VARCHAR (255)   NOT NULL,
    [ProductoId]  INT             NOT NULL,
    CONSTRAINT [PK_EntradaProductos] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ProductoEntradaProductos] FOREIGN KEY ([ProductoId]) REFERENCES [dbo].[Producto] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_FK_ProductoEntradaProductos]
    ON [dbo].[EntradaProductos]([ProductoId] ASC);

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