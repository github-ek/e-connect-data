CREATE PROCEDURE [dbo].[WriteStringToFile]
    @string VARCHAR(MAX),
    @path VARCHAR(255),
    @filename VARCHAR(100)
AS
BEGIN
    --sp_configure 'show advanced options', 1
    --GO
    --RECONFIGURE
    --GO
    --sp_configure 'Ole Automation Procedures', 1
    --GO
    --RECONFIGURE
    --GO
    DECLARE  
        @objFileSystem int,
        @objTextStream int,
		@objErrorObject int,
		@strErrorMessage Varchar(1000),
	    @Command varchar(1000),
	    @hr int,
		@fileAndPath varchar(400)

    SET NOCOUNT ON

    SELECT @strErrorMessage='opening the File System Object'
    EXECUTE @hr = sp_OACreate  'Scripting.FileSystemObject' , @objFileSystem OUT

    SELECT @FileAndPath=@path+'\'+@filename
    IF @HR=0 Select @objErrorObject=@objFileSystem , @strErrorMessage='Creating file "'+@FileAndPath+'"'
    IF @HR=0 execute @hr = sp_OAMethod   @objFileSystem   , 'CreateTextFile', @objTextStream OUT, @FileAndPath,2,True
    
    IF @HR=0 Select @objErrorObject=@objTextStream,@strErrorMessage='writing to the file "'+@FileAndPath+'"'
    IF @HR=0 execute @hr = sp_OAMethod  @objTextStream, 'Write', Null, @string

    IF @HR=0 Select @objErrorObject=@objTextStream, @strErrorMessage='closing the file "'+@FileAndPath+'"'
    IF @HR=0 execute @hr = sp_OAMethod  @objTextStream, 'Close'

    IF @hr<>0
	BEGIN
	    DECLARE 
		    @Source varchar(255),
		    @Description Varchar(255),
		    @Helpfile Varchar(255),
		    @HelpID int
	
        EXECUTE sp_OAGetErrorInfo  @objErrorObject, @source output,@Description output,@Helpfile output,@HelpID output
	    SELECT @strErrorMessage='Error whilst '
			    +COALESCE(@strErrorMessage,'doing something')
			    +', '+COALESCE(@Description,'')
	    RAISERROR (@strErrorMessage,16,1)
	END
    EXECUTE sp_OADestroy @objTextStream
    EXECUTE sp_OADestroy @objTextStream
END
