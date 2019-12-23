CREATE TABLE [dbo].[SalidaMateriales] (
    [Id]                     INT           IDENTITY (1, 1) NOT NULL,
    [Fecha]                  DATETIME      NOT NULL,
    [Cantidad]               INT           NOT NULL,
    [Observacion]            VARCHAR (255) NULL,
    [UsuarioId]              VARCHAR (255) NOT NULL,
    [InvertarioMaterialesId] INT           NOT NULL,
    CONSTRAINT [PK_SalidaMateriales] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_FKSalidaMate497011] FOREIGN KEY ([InvertarioMaterialesId]) REFERENCES [dbo].[InvertarioMateriales] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_FK_FKSalidaMate497011]
    ON [dbo].[SalidaMateriales]([InvertarioMaterialesId] ASC);


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