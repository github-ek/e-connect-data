CREATE TABLE [dbo].[media] (
    [media_id]         NVARCHAR (20)  NOT NULL,
    [wh_id]            NVARCHAR (32)  NOT NULL,
    [client_id]        NVARCHAR (32)  NOT NULL,
    [file_name]        NVARCHAR (512) NOT NULL,
    [orig_file_name]   NVARCHAR (512) NOT NULL,
    [file_typ]         NVARCHAR (10)  NOT NULL,
    [thumb_file_name]  NVARCHAR (512) NOT NULL,
    [media_typ_cod]    NVARCHAR (40)  NULL,
    [tag]              NVARCHAR (300) NULL,
    [hit_count]        INT            DEFAULT ((0)) NOT NULL,
    [last_viewed]      DATETIME       NULL,
    [ins_dt]           DATETIME       NULL,
    [last_upd_dt]      DATETIME       NULL,
    [ins_user_id]      NVARCHAR (40)  NULL,
    [last_upd_user_id] NVARCHAR (40)  NULL,
    [media_file_size]  INT            NULL,
    CONSTRAINT [media_pk] PRIMARY KEY CLUSTERED ([media_id] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The media table is the table that stores the information of the uploaded media', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique key for uploaded file', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media', @level2type = N'COLUMN', @level2name = N'media_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Warehouse ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media', @level2type = N'COLUMN', @level2name = N'wh_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique identifier for the client', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media', @level2type = N'COLUMN', @level2name = N'client_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Filename(URL) of the media stored in the server. It will be media path in the server appended by media_id and the extension', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media', @level2type = N'COLUMN', @level2name = N'file_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Original file name of the media selected', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media', @level2type = N'COLUMN', @level2name = N'orig_file_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type of the file(jpg,bmp,avi etc)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media', @level2type = N'COLUMN', @level2name = N'file_typ';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Filename(URL) of the thumbnail image stored in the server. It will be media path in the server appended by media_id,''_T'' and the extension', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media', @level2type = N'COLUMN', @level2name = N'thumb_file_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Defines the type of document being attached.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media', @level2type = N'COLUMN', @level2name = N'media_typ_cod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A string of tags that can be searched on', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media', @level2type = N'COLUMN', @level2name = N'tag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number times the file has been viewed.Default value will be zero', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media', @level2type = N'COLUMN', @level2name = N'hit_count';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This column will have the date of media being viewed for the last time.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media', @level2type = N'COLUMN', @level2name = N'last_viewed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was inserted', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media', @level2type = N'COLUMN', @level2name = N'ins_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the row was last updated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media', @level2type = N'COLUMN', @level2name = N'last_upd_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who created the row', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media', @level2type = N'COLUMN', @level2name = N'ins_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user id of the person who updated the row most recently', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media', @level2type = N'COLUMN', @level2name = N'last_upd_user_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The size of the media file, in bytes. Default value will be null.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'media', @level2type = N'COLUMN', @level2name = N'media_file_size';

