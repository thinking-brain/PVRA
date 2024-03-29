
-- Creating triggers

-- Droping triggers
GO
--
--DROP TRIGGER [dbo].[Trigger_CompraMaterialesUpdate]
--
--DROP TRIGGER [dbo].[Trigger_CompraMaterialesInsert]
--
--DROP TRIGGER [dbo].[Trigger_CompraMaterialesDelete]
--
--DROP TRIGGER [dbo].[Trigger_EntradaProductosDelete]
--
--DROP TRIGGER [dbo].[Trigger_EntradaProductosInsert]
--
--DROP TRIGGER [dbo].[Trigger_EntradaProductosUpdate]
--
--DROP TRIGGER [dbo].[Trigger_VentaDelete]
--
--DROP TRIGGER [dbo].[Trigger_VentaInsert]
--
--DROP TRIGGER [dbo].[Trigger_VentaUpdate]
--
--DROP TRIGGER [dbo].[Trigger_SalidaMaterialesDelete]
--
--DROP TRIGGER [dbo].[Trigger_SalidaMaterialesInsert]
--
--DROP TRIGGER [dbo].[Trigger_SalidaMaterialesUpdate]

GO
-- Creating triggers

CREATE TRIGGER [dbo].[Trigger_CompraMaterialesUpdate]
    ON [dbo].[CompraMateriales]
    AFTER UPDATE
    AS
	IF NOT EXISTS (SELECT *
FROM dbo.InvertarioMateriales as inv, inserted as i
WHERE inv.MateriaPrimaId = i.MateriaPrimaId AND inv.Precio = STR(i.Importe/i.Cantidad,18, 2) AND inv.ColorId = i.ColorId)
    BEGIN
    INSERT INTO InvertarioMateriales
    VALUES((SELECT MateriaPrimaId
            FROM inserted), ((SELECT Importe
            FROM inserted)/(SELECT Cantidad
            FROM inserted)), 0, NULL, (SELECT ColorId
            FROM inserted))
END
    BEGIN
    UPDATE dbo.InvertarioMateriales SET Existencia = (Existencia - (SELECT Cantidad
    FROM deleted)) WHERE  MateriaPrimaId = (SELECT MateriaPrimaId
        FROM deleted) AND Precio = STR(((SELECT Importe
        FROM deleted)/(SELECT Cantidad
        FROM deleted)),18,2) AND ColorId = (SELECT ColorId
        FROM deleted)
    UPDATE dbo.InvertarioMateriales SET Existencia = (Existencia + (SELECT Cantidad
    FROM inserted)) WHERE  MateriaPrimaId = (SELECT MateriaPrimaId
        FROM inserted) AND Precio =STR(((SELECT Importe
        FROM inserted)/(SELECT Cantidad
        FROM inserted)),18,2) AND ColorId = (SELECT ColorId
        FROM inserted)
END
GO

CREATE TRIGGER [dbo].[Trigger_CompraMaterialesInsert]
    ON [dbo].[CompraMateriales]
    AFTER INSERT
    AS
	IF EXISTS (SELECT *
FROM dbo.InvertarioMateriales as inv, inserted as i
WHERE inv.MateriaPrimaId = i.MateriaPrimaId AND inv.Precio = STR(i.Importe/i.Cantidad,18,2) AND inv.ColorId = i.ColorId)
    BEGIN
    UPDATE dbo.InvertarioMateriales SET Existencia = (Existencia + (SELECT Cantidad
    FROM inserted)) WHERE  MateriaPrimaId = (SELECT MateriaPrimaId
        FROM inserted) AND Precio =STR(((SELECT Importe
        FROM inserted)/(SELECT Cantidad
        FROM inserted)),18,2) AND ColorId = (SELECT ColorId
        FROM inserted);
END
	ELSE
    BEGIN
    INSERT INTO InvertarioMateriales
    VALUES((SELECT MateriaPrimaId
            FROM inserted), ((SELECT Importe
            FROM inserted)/(SELECT Cantidad
            FROM inserted)), (SELECT Cantidad
            FROM inserted), NULL, (SELECT ColorId
            FROM inserted))
END
GO

CREATE TRIGGER [dbo].[Trigger_CompraMaterialesDelete]
    ON [dbo].[CompraMateriales]
    FOR DELETE
    AS
	IF (SELECT i.Existencia
FROM dbo.InvertarioMateriales AS i
WHERE  i.MateriaPrimaId = (SELECT MateriaPrimaId
    FROM deleted) AND i.Precio = STR(((SELECT Importe
    FROM deleted)/(SELECT Cantidad
    FROM deleted)),18,2) AND i.ColorId = (SELECT ColorId
    FROM deleted)) >= (SELECT Cantidad
FROM deleted)
    BEGIN
    UPDATE dbo.InvertarioMateriales SET Existencia = (Existencia - (SELECT Cantidad
    FROM deleted)) WHERE  MateriaPrimaId = (SELECT MateriaPrimaId
        FROM deleted) AND Precio = STR(((SELECT Importe
        FROM deleted)/(SELECT Cantidad
        FROM deleted)),18,2) AND ColorId = (SELECT ColorId
        FROM deleted);
END
	ELSE
	BEGIN
    RAISERROR('No se puede eliminar',16,10)
    ROLLBACK TRANSACTION
END
	
	GO

CREATE TRIGGER [dbo].[Trigger_EntradaProductosDelete]
    ON [dbo].[EntradaProductos]
    FOR DELETE
    AS
	IF (SELECT Existencia
FROM dbo.InvertarioProductos
WHERE  ProductoId = (SELECT ProductoId
    FROM deleted) AND CostoUnitario = ((SELECT Importe
    FROM deleted)/(SELECT Cantidad
    FROM deleted)) AND ColorId = (SELECT ColorId
    FROM deleted)) >= (SELECT Cantidad
FROM deleted)
    BEGIN
    UPDATE dbo.InvertarioProductos SET Existencia = (Existencia - (SELECT Cantidad
    FROM deleted)) WHERE  ProductoId = (SELECT ProductoId
        FROM deleted) AND CostoUnitario =((SELECT Importe
        FROM deleted)/(SELECT Cantidad
        FROM deleted)) AND ColorId = (SELECT ColorId
        FROM deleted);
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
	IF EXISTS (SELECT *
FROM dbo.InvertarioProductos as inv, inserted as i
WHERE inv.ProductoId = i.ProductoId AND inv.CostoUnitario = i.Importe/i.Cantidad AND inv.ColorId = i.ColorId )
    BEGIN
    UPDATE dbo.InvertarioProductos SET Existencia = (Existencia + (SELECT Cantidad
    FROM inserted)) WHERE  ProductoId = (SELECT ProductoId
        FROM inserted) AND CostoUnitario =((SELECT Importe
        FROM inserted)/(SELECT Cantidad
        FROM inserted)) AND ColorId = (SELECT ColorId
        FROM inserted);
END
	ELSE
    BEGIN
    INSERT INTO InvertarioProductos
    VALUES((SELECT ProductoId
            FROM inserted), (SELECT ColorId
            FROM inserted), ((SELECT Importe
            FROM inserted)/(SELECT Cantidad
            FROM inserted)), 0, NULL)
    UPDATE dbo.InvertarioProductos SET Existencia = (Existencia + (SELECT Cantidad
    FROM inserted)) WHERE  ProductoId = (SELECT ProductoId
        FROM inserted) AND CostoUnitario =((SELECT Importe
        FROM inserted)/(SELECT Cantidad
        FROM inserted)) AND ColorId = (SELECT ColorId
        FROM inserted);
END
GO

CREATE TRIGGER [dbo].[Trigger_EntradaProductosUpdate]
    ON [dbo].[EntradaProductos]
    AFTER UPDATE
    AS
	IF NOT EXISTS (SELECT *
FROM dbo.InvertarioProductos as inv, inserted as i
WHERE inv.ProductoId = i.ProductoId AND inv.CostoUnitario = i.Importe/i.Cantidad AND inv.ColorId = i.ColorId)
    BEGIN
    INSERT INTO InvertarioProductos
    VALUES((SELECT ProductoId
            FROM inserted), (SELECT ColorId
            FROM inserted), ((SELECT Importe
            FROM inserted)/(SELECT Cantidad
            FROM inserted)), 0, NULL)
END
    BEGIN
    UPDATE dbo.InvertarioProductos SET Existencia = (Existencia - (SELECT Cantidad
    FROM deleted)) WHERE  ProductoId = (SELECT ProductoId
        FROM deleted) AND CostoUnitario =((SELECT Importe
        FROM deleted)/(SELECT Cantidad
        FROM deleted)) AND ColorId = (SELECT ColorId
        FROM deleted)
    UPDATE dbo.InvertarioProductos SET Existencia = (Existencia + (SELECT Cantidad
    FROM inserted)) WHERE  ProductoId = (SELECT ProductoId
        FROM inserted) AND CostoUnitario =((SELECT Importe
        FROM inserted)/(SELECT Cantidad
        FROM inserted)) AND ColorId = (SELECT ColorId
        FROM inserted)
END
GO

CREATE TRIGGER [dbo].[Trigger_VentaDelete]
    ON [dbo].[Ventas]
    AFTER DELETE
    AS	
    BEGIN
    UPDATE dbo.InvertarioProductos SET Existencia = (Existencia + (SELECT Cantidad
    FROM deleted)) WHERE  Id = (SELECT InvertarioProductosId
    FROM deleted);
END
GO

CREATE TRIGGER [dbo].[Trigger_VentaInsert]
    ON [dbo].[Ventas]
    FOR INSERT
    AS
	IF (SELECT Existencia
FROM dbo.InvertarioProductos
WHERE  Id = (SELECT InvertarioProductosId
FROM inserted)) >= (SELECT Cantidad
FROM inserted)
    BEGIN
    UPDATE dbo.InvertarioProductos SET Existencia = (Existencia - (SELECT Cantidad
    FROM inserted)) WHERE  Id = (SELECT InvertarioProductosId
    FROM inserted);
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
	IF (SELECT Existencia
    FROM dbo.InvertarioProductos
    WHERE  Id = (SELECT InvertarioProductosId
    FROM inserted)) >= (SELECT Cantidad
    FROM inserted) OR ((SELECT InvertarioProductosId
    FROM inserted) = (SELECT InvertarioProductosId
    FROM deleted) AND (SELECT Existencia
    FROM dbo.InvertarioProductos
    WHERE  Id = (SELECT InvertarioProductosId
    FROM inserted)) + (SELECT Cantidad
    FROM deleted)  >= (SELECT Cantidad
    FROM inserted))
    BEGIN
    UPDATE dbo.InvertarioProductos SET Existencia = (Existencia + (SELECT Cantidad
    FROM deleted)) WHERE  Id = (SELECT InvertarioProductosId
    FROM deleted)
    UPDATE dbo.InvertarioProductos SET Existencia = (Existencia - (SELECT Cantidad
    FROM inserted)) WHERE  Id = (SELECT InvertarioProductosId
    FROM inserted);
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
    UPDATE dbo.InvertarioMateriales SET Existencia = (Existencia + (SELECT Cantidad
    FROM deleted)) WHERE  Id = (SELECT InvertarioMateriasPrimasId
    FROM deleted);
END
GO

CREATE TRIGGER [dbo].[Trigger_SalidaMaterialesInsert]
    ON [dbo].[SalidaMateriales]
    FOR INSERT
    AS
	IF (SELECT Existencia
FROM dbo.InvertarioMateriales
WHERE  Id = (SELECT InvertarioMateriasPrimasId
FROM inserted)) >= (SELECT Cantidad
FROM inserted)
    BEGIN
    UPDATE dbo.InvertarioMateriales SET Existencia = (Existencia - (SELECT Cantidad
    FROM inserted)) WHERE  Id = (SELECT InvertarioMateriasPrimasId
    FROM inserted);
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
	IF (SELECT Existencia
    FROM dbo.InvertarioMateriales
    WHERE  Id = (SELECT InvertarioMateriasPrimasId
    FROM inserted)) >= (SELECT Cantidad
    FROM inserted) OR ((SELECT InvertarioMateriasPrimasId
    FROM inserted) = (SELECT InvertarioMateriasPrimasId
    FROM deleted) AND (SELECT Existencia
    FROM dbo.InvertarioMateriales
    WHERE  Id = (SELECT InvertarioMateriasPrimasId
    FROM inserted)) + (SELECT Cantidad
    FROM deleted)  >= (SELECT Cantidad
    FROM inserted))
    BEGIN
    UPDATE dbo.InvertarioMateriales SET Existencia = (Existencia + (SELECT Cantidad
    FROM deleted)) WHERE  Id = (SELECT InvertarioMateriasPrimasId
    FROM deleted)
    UPDATE dbo.InvertarioMateriales SET Existencia = (Existencia - (SELECT Cantidad
    FROM inserted)) WHERE  Id = (SELECT InvertarioMateriasPrimasId
    FROM inserted);
END
	ELSE
    BEGIN
    RAISERROR('La cantidad en inventario es menor que la que quiere sacar',16,10)
    ROLLBACK TRANSACTION
END
