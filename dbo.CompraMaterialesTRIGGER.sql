﻿CREATE TABLE [dbo].[CompraMateriales] (
    [Id]                 INT             IDENTITY (1, 1) NOT NULL,
    [Fecha]              DATETIME        NOT NULL,
    [Importe]            DECIMAL (19, 2) NOT NULL,
    [Cantidad]           INT             NOT NULL,
    [Observacion]        VARCHAR (255)   NULL,
    [UsuarioId]          VARCHAR (255)   NOT NULL,
    [ProveedorPersonaId] INT             NOT NULL,
    [MaterialId]         INT             NOT NULL,
    CONSTRAINT [PK_CompraMateriales] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_FKCompraMate814930] FOREIGN KEY ([ProveedorPersonaId]) REFERENCES [dbo].[Persona_Proveedor] ([Id]),
    CONSTRAINT [FK_MaterialCompraMateriales] FOREIGN KEY ([MaterialId]) REFERENCES [dbo].[Material] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_FK_FKCompraMate814930]
    ON [dbo].[CompraMateriales]([ProveedorPersonaId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FK_MaterialCompraMateriales]
    ON [dbo].[CompraMateriales]([MaterialId] ASC);


GO

CREATE TRIGGER [dbo].[TriggerInsert_CompraMateriales]
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