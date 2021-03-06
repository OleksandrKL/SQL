CREATE PROCEDURE CreateBlogPost
               --parameters
@Title nvarchar(255),@Content nvarchar(255),@TagId1 int,@TagId2 int,@Category int,@Status int , @bloggerid int
AS
               --local variable
DECLARE @Sname int, @blogid int
                
BEGIN TRY                
SELECT @Sname=1
END TRY
BEGIN CATCH  
SELECT @Sname=@Status
END CATCH
INSERT INTO dbo.Blog_Post (Title,Content,S_id,B_id)
values(@Title,@Content,@Sname,@bloggerid);
                 
SELECT  @Blogid=(SELECT TOP(1) dbo.Blog_Post.BP_id AS ID FROM DBO.Blog_Post ORDER BY ID DESC);
INSERT INTO dbo.BLOG_TO_CATEGORY values (@blogid,@Category)
INSERT INTO Blog_To_Tag values(@blogid,@TagId1),(@blogid,@TagId2);
