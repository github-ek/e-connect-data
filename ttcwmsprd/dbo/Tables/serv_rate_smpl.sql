CREATE TABLE [dbo].[serv_rate_smpl] (
    [serv_rate_id] NVARCHAR (20) NOT NULL,
    [minqty]       INT           NOT NULL,
    [prob_qty]     INT           NOT NULL,
    [max_prob_qty] INT           NOT NULL,
    [moddte]       DATETIME      NULL,
    [mod_usr_id]   NVARCHAR (40) NULL,
    CONSTRAINT [serv_rate_smpl_pk] PRIMARY KEY CLUSTERED ([serv_rate_id] ASC, [minqty] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Represents Service Rate Sample Quantity', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_rate_smpl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Service Rate ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_rate_smpl', @level2type = N'COLUMN', @level2name = N'serv_rate_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Minimum Quantity - The Minimum quantity of loads, at which this service rate sample configuration should begin to be performed', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_rate_smpl', @level2type = N'COLUMN', @level2name = N'minqty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Probability - the probability or odds that will be used to determine if service is required.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_rate_smpl', @level2type = N'COLUMN', @level2name = N'prob_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Maximum Probability - the max prob value to be used to determine if service is required. Example, if prob_qty is 150 and max_prod_qty is 1000, then odds will be that 150 out of 1000 will be serviced.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_rate_smpl', @level2type = N'COLUMN', @level2name = N'max_prob_qty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified Date', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_rate_smpl', @level2type = N'COLUMN', @level2name = N'moddte';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modified User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'serv_rate_smpl', @level2type = N'COLUMN', @level2name = N'mod_usr_id';

