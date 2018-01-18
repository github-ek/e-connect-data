CREATE TABLE [dbo].[media_link] (
    [media_id]         NVARCHAR (20)   NOT NULL,
    [assoc_key]        NVARCHAR (500)  NOT NULL,
    [cmnt]             NVARCHAR (2000) NULL,
    [ins_dt]           DATETIME        NULL,
    [last_upd_dt]      DATETIME        NULL,
    [ins_user_id]      NVARCHAR (40)   NULL,
    [last_upd_user_id] NVARCHAR (40)   NULL,
    [srtseq]           INT             NULL,
    CONSTRAINT [media_link_pk] PRIMARY KEY CLUSTERED ([media_id] ASC, [assoc_key] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Links the association key of an application to media', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media_link';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique key for uploaded file', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media_link', @level2type = N'COLUMN', @level2name = N'media_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key generated for the associated record using the tablename and PK values. It will be an xml string having keys and its values', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media_link', @level2type = N'COLUMN', @level2name = N'assoc_key';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'User comments for an associated file', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media_link', @level2type = N'COLUMN', @level2name = N'cmnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media_link', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media_link', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media_link', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media_link', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determines the display order in Media Maintenance.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media_link', @level2type = N'COLUMN', @level2name = N'srtseq';

