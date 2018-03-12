

SELECT * FROM dbo.KC_Teacher 
SELECT * FROM dbo.US_UserCenter WHERE UserNo='6af84b7d-b2a9-42a7-a4d3-9a3c5a4ff6a4'

SELECT * FROM dbo.US_UserCenter WHERE NickName LIKE '%陌%'   -- 20170501002
SELECT * FROM dbo.KC_Teacher WHERE TeacherNo='042EF61A-09AB-45CF-8773-27E150236165'

SELECT * FROM CmmoocUserCenter.dbo.US_UserCenterRole WHERE UserNo='042EF61A-09AB-45CF-8773-27E150236165'


SELECT * FROM dbo.KC_ForumPosts WHERE UserNo IN('6F6280C1-7B00-4FC0-9DCE-3F827EEFEB9D')
SELECT * FROM dbo.US_UserCenter WHERE NickName='张果果'
SELECT * FROM dbo.KC_ForumPosts WHERE Title='教师'
SELECT * FROM dbo.US_UserCenter WHERE NickName='张果果'
SELECT * FROM CmmoocUserCenter.dbo.US_UserCenterRole WHERE UserNo ='58A8C629-F54F-43D5-8429-1ECC7AB987EF'
SELECT * FROM CmmoocUserCenter.dbo.US_Role

SELECT * FROM dbo.US_UserCenter WHERE NickName='璐璐'


SELECT CR.Id AS CoursewareSourceId ,CR.ResourceType,RC.OriginalName,Child.Title 
FROM [dbo].[KC_CourseResources](NOLOCK) AS CR
INNER JOIN [dbo].[KC_ResourceContent](NOLOCK) AS RC ON RC.ResourceNo=CR.ResourceNo
INNER JOIN [dbo].[KC_CourseCatalog](NOLOCK) AS Child ON Child.Id=CR.CatalogId
INNER JOIN [dbo].[KC_CourseCatalog](NOLOCK) AS Parent ON Parent.Id=Child.ParentId
WHERE CR.IsDel=0 AND Child.IsDel=0 AND Child.CourseId=1123 AND Child.CatalogTypeId=23 AND Parent.IsDel=0 ORDER BY Parent.ID,Child.ID


SELECT * FROM dbo.KC_CourseResources
SELECT * FROM dbo.KC_ResourceContent


SELECT * FROM dbo.KC_KnowledgeInteract

USE CmmoocUserCenter
GO

SELECT * FROM dbo.US_UserCenter WHERE NickName='河北传媒学院'

SELECT * FROM CmmoocCourse.dbo.KC_UserStudyRecord ORDER BY CreateTime DESC


SELECT * FROM dbo.US_AreaRegion


SELECT (
SELECT COUNT(1) FROM [dbo].[KC_ShowCaseLibrary](NOLOCK) AS SC
WHERE SC.CourseMOOC_Id=1123 AND SC.IsDel=0 AND SC.IsOpen=1 AND SC.IsLock=0 AND SC.ShowCaseModule=4059) AS Total,
(SELECT COUNT(1)  FROM [dbo].[KC_ShowCaseLibrary](NOLOCK) AS SC
WHERE SC.CourseMOOC_Id=1123 AND SC.IsDel=0 AND SC.IsOpen=1 
AND SC.IsLock=1 AND SC.ShowCaseModule=4059)AS SealTotal,
(SELECT COUNT(1) FROM  [dbo].[KC_ShowCaseBanOutApply](NOLOCK) AS SA 
INNER JOIN [dbo].[KC_ShowCaseLibrary](NOLOCK) AS SC ON SC.Id=SA.ShowCaseLibrary_Id
WHERE SC.CourseMOOC_Id=1123 AND SA.IsDel=0 AND SC.IsDel=0 AND SC.IsOpen=1 
AND SC.IsLock=1 AND SC.ShowCaseModule=4059) AS ApplySealTotal,
(SELECT COUNT(DISTINCT(SB.ShowCaseLibrary_Id)) 
FROM [dbo].[KC_ShowCaseLibraryBrowse](NOLOCK) AS SB 
INNER JOIN [dbo].[KC_ShowCaseLibrary](NOLOCK) AS SC ON SC.Id=SB.ShowCaseLibrary_Id
WHERE SC.CourseMOOC_Id=1123 AND SC.IsDel=0 AND SC.IsOpen=1 AND SC.IsLock=0 
AND SC.ShowCaseModule=4059 AND SB.UserNo='8d837fec-e466-48e6-ad2d-8586d82e873d')AS HavBrowse,
(SELECT COUNT(DISTINCT(SCC.ShowCaseLibrary_Id)) 
FROM [dbo].[KC_ShowCaseLibraryComment](NOLOCK) AS SCC 
INNER JOIN [dbo].[KC_ShowCaseLibrary](NOLOCK) AS SC ON SC.Id=SCC.ShowCaseLibrary_Id
WHERE SC.CourseMOOC_Id=1123 AND SC.IsDel=0 AND SC.IsOpen=1 AND SC.IsLock=0 
AND SC.ShowCaseModule=4059 AND SCC.UserNo='8d837fec-e466-48e6-ad2d-8586d82e873d' AND SCC.IsTeacherComment=1) AS HavComments



SELECT SL.Id,SL.CourseMOOC_Id,SL.UserNo,SL.ShowCaseCover,SL.Name,UC.NickName,ROW_NUMBER() OVER(ORDER BY SL.CreateTime DESC) AS RowNumber,
(SELECT COUNT(1) FROM [dbo].[KC_ShowCaseLibraryLoveRecord](NOLOCK) AS SLR WHERE SLR.ShowCaseLibrary_Id=SL.Id AND SLR.LoveType=4057 AND SLR.IsDel=0 ) AS LikeCount,
(SELECT COUNT(1) FROM [dbo].[KC_ShowCaseLibraryComment](NOLOCK) AS SLC WHERE SLC.ShowCaseLibrary_Id=SL.Id AND SLC.IsDel=0) AS CommentCount,
(SELECT COUNT(1) FROM [dbo].[KC_ShowCaseLibraryBrowse](NOLOCK) AS SLR WHERE SLR.ShowCaseLibrary_Id=SL.Id AND SLR.IsDel=0) AS ViewCount,
(SELECT COUNT(1) FROM [dbo].[KC_ShowCase](NOLOCK) AS SC WHERE SC.ShowCaseLibrary_Id=SL.Id AND SC.IsDel=0) AS CaseCount
FROM [dbo].[KC_ShowCaseLibrary](NOLOCK) AS SL
INNER JOIN [dbo].[US_UserCenter](NOLOCK) AS UC ON UC.UserNo=SL.UserNo
WHERE SL.CourseMOOC_Id=1123 AND SL.ShowCaseModule=4059 AND SL.IsDel=0 AND SL.IsOpen=1 AND SL.IsLock=1


SELECT COUNT(1)
FROM [dbo].[KC_ShowCaseLibrary](NOLOCK) AS SL
INNER JOIN [dbo].[US_UserCenter](NOLOCK) AS UC ON UC.UserNo=SL.UserNo
WHERE SL.CourseMOOC_Id=1123 AND SL.ShowCaseModule=4059 AND SL.IsDel=0 AND SL.IsOpen=1 AND SL.IsLock=1



SELECT PR.Id,PR.EndTime,PR.Grade,PR.Paper_Id,PR.StartTime,PR.UserNo
FROM [dbo].[KC_ExamPaperRecord](NOLOCK) AS PR
WHERE PR.Paper_Id=71 AND PR.UserNo='59ced3b3-20d8-4d88-bb68-fc155ac4e903' AND PR.IsDel=0

select [Id],[Question_Id],[OptionContent],[IsRightAnswer],[IsDel],[CreateTime] 
FROM [KC_QuestionOptions](NOLOCK) where Question_Id=2099


SELECT 
PRI.Question_Id AS Question_Id,PRI.ProblemType AS QuestionType,PRI.ChoiceAnswer AS UserAnswer,PRI.IsCorrect AS IsCorrect,
CQ.Title AS Title,CQ.Score AS Score,CQ.ScoreMethod AS ScoreMethod,NULL AS Answer,NULL AS IsCaseSensitive,NULL AS IsMutex ,NULL AS SubjectSocre 
FROM [dbo].[KC_ExamPaperRecordItem](NOLOCK) AS PRI
INNER JOIN [dbo].[KC_ChoiceQuestion](NOLOCK) AS CQ ON CQ.Id=PRI.Question_Id
WHERE PRI.Record_Id=1099 AND PRI.ProblemType IN (2031,2032,2030) AND PRI.IsDel=0
UNION ALL
SELECT 
PRI.Question_Id AS Question_Id,PRI.ProblemType AS QuestionType,PRI.FillBlankAnswer AS UserAnswer,PRI.IsCorrect AS IsCorrect,
BQ.Title AS Title,BQ.Score AS Score,NULL AS ScoreMethod,BQ.Answer AS Answer,BQ.IsCaseSensitive AS IsCaseSensitive,BQ.IsMutex AS IsMutex,NULL AS SubjectSocre 
FROM [dbo].[KC_ExamPaperRecordItem](NOLOCK) AS PRI
INNER JOIN [dbo].[KC_FillBlankQuestion](NOLOCK) AS BQ ON BQ.Id=PRI.Question_Id
WHERE PRI.Record_Id=1099 AND PRI.ProblemType=2033 AND PRI.IsDel=0
UNION ALL
SELECT 
PRI.Question_Id AS Question_Id,PRI.ProblemType AS QuestionType,PRI.SubjectiveAnswer AS UserAnswer,PRI.IsCorrect AS IsCorrect,
SQ.Title AS Title,SQ.Score AS Score,NULL AS ScoreMethod,NULL AS Answer,NULL AS IsCaseSensitive,NULL AS IsMutex,PRI.SubjectSocre 
FROM [dbo].[KC_ExamPaperRecordItem](NOLOCK) AS PRI
INNER JOIN KC_SubjectiveQuestion(NOLOCK) AS SQ ON SQ.Id=PRI.Question_Id
WHERE PRI.Record_Id=1099 AND PRI.ProblemType=2034 AND PRI.IsDel=0


SELECT * FROM dbo.KC_ExamPaperRecordItem WHERE Record_Id=1099

UPDATE dbo.KC_ExamPaperRecordItem SET IsCorrect=0 WHERE Id =1278

SELECT * FROM CmmoocUserCenter.dbo.US_AreaRegion WHERE ParentId=0





SELECT * FROM dbo.US_UserCenter WHERE NickName='张果果'
SELECT * FROM dbo.KC_Teacher WHERE TeacherNo='58A8C629-F54F-43D5-8429-1ECC7AB987EF'
SELECT * FROM CmmoocUserCenter.dbo.US_UserCenterRole WHERE UserNo ='58A8C629-F54F-43D5-8429-1ECC7AB987EF'


SELECT * FROM dbo.KC_ProfessionSpecial
SELECT * FROM dbo.KC_ProfessionSpecialRelateCourse

SELECT * FROM dbo.KC_CourseIndex WHERE CourseName='测试而已'
SELECT * FROM dbo.KC_Institution WHERE Id=1016

SELECT * FROM dbo.KC_TeacherCourse 

SELECT * FROM dbo.KC_Course WHERE CourseName='11'


SELECT C.Id,C.CategoryId,C.CourseType,C.CourseCover,C.CourseName,C.Price,CMD.Summary,I.Name AS InstitutionName,I.OrgnizationCode,I.Id AS Institution_Id ,C.CreateTime,CMD.IsRecommand,C.IsDel,C.IsPublished,C.OpenForm,C.CurrentStatus,CMD.ProfessionTag_Id,
(SELECT T.TeacherCode+','+T.Name+'|' FROM [dbo].[KC_TeacherCourse](NOLOCK) AS TC 
INNER JOIN [dbo].[KC_Teacher](NOLOCK) AS T ON T.TeacherNo=TC.TeacherNo 
WHERE TC.Course_Id=C.Id AND TC.CourseTypeId=23 FOR XML PATH('')) AS TeacherInfo,(CMD.StudyNumber+
(SELECT COUNT(1) FROM [dbo].[KC_UserCourse](NOLOCK) WHERE [CourseId]=C.Id AND [IsDel]=0 AND [IsSignOut]=0 AND [CourseTypeId]=23 )) AS StudyNum,
(SELECT COUNT(1) FROM dbo.KC_CourseBrowseRecord(NOLOCK) cb WHERE cb.CourseId=C.Id AND cb.IsDel=0 AND cb.CourseType=23) AS BrosweNum,
(SELECT COUNT(1) FROM [dbo].[KC_UserFavorite] AS UF WHERE UF.IsDel=0 AND UF.CategoryId=2052 AND UF.ReferenceId=C.Id) AS FavoriteNum
FROM [dbo].[KC_Course](NOLOCK) AS C
INNER JOIN [dbo].[KC_Institution](NOLOCK) AS I ON I.Id=C.InstitutionId AND I.IsDel=0 AND I.IsOpen=1
INNER JOIN [dbo].[KC_CourseDetail] (NOLOCK) AS CMD ON  CMD.CourseId=C.Id
WHERE C.IsPublished=1 AND C.IsFiled=0 AND C.IsDel=0 AND C.CurrentStatus=2045


SELECT * FROM [dbo].[KC_CourseIndex] WHERE [CourseNo]='chinesemooc_mooc_32'


SELECT * FROM dbo.KC_CourseIndex


SELECT * FROM dbo.US_UserCenter WHERE UserNo='2cd0e980-06a8-4ecc-85e1-36dec0198002'

SELECT * FROM dbo.KC_UserCourse
SELECT * FROM dbo.KC_UserCourseScore
SELECT * FROM dbo.KC_UserCourseScoreItemRecord WHERE UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903'
SELECT * FROM dbo.KC_CourseScoreItem WHERE Id=1118


SELECT U.UserNo,U.NickName,UCS.[IsPublished],UCS.[FinalScore] AS CourseScore,ROW_NUMBER() OVER(ORDER BY UCS.IsPublished ,UC.CreateTime)AS RowNumber,
(SELECT SUM(USI.Score) 
FROM [dbo].[KC_UserCourseScoreItemRecord](NOLOCK) AS USI 
INNER JOIN [dbo].[KC_CourseScoreItem](NOLOCK) AS CSI ON CSI.Id=USI.CourseScoreItem_Id 
WHERE USI.UserNo=UC.UserNo AND USI.IsDel=0 AND CSI.CourseMOOC_Id=1123  AND CSI.IsJoinFinalScore=1) AS ScoreItemValue
FROM 
(SELECT UC.UserNo,UC.CourseId,UC.CreateTime  FROM  [dbo].[KC_UserCourse](NOLOCK) AS UC 
INNER JOIN [dbo].[US_UserCenter](NOLOCK) AS U ON U.UserNo=UC.UserNo
INNER JOIN [dbo].[US_UserBasicInfo](NOLOCK) AS UB ON UB.[UserNo]=UC.[UserNo]  
WHERE UC.CourseTypeId=23 AND UC.CourseId=1123 AND UC.IsDel=0 AND UC.IsSignOut=0 ) AS UC
INNER JOIN [dbo].[US_UserCenter](NOLOCK) AS U ON U.UserNo=UC.UserNo 
LEFT JOIN [dbo].[KC_UserCourseScore](NOLOCK) AS UCS ON UCS.CourseMOOC_Id=UC.CourseId AND UCS.[UserNo]=UC.UserNo 


select [Id],[CourseMOOC_Id],[TypeId],[Name],[Score],[IsDel],[UpdateTime],[CreateTime] 
FROM [KC_CourseScoreLevel](NOLOCK) where CourseMOOC_Id=1123 and TypeId=2059

select [Id],[CourseMOOC_Id],[TypeId],[Name],[Score],[IsDel],[UpdateTime],[CreateTime] 
FROM [KC_CourseScoreLevel](NOLOCK) where CourseMOOC_Id=0 and TypeId=2059


SELECT Id,UnitTestCatalogue_Id,PaperName,IsPublish,Score,EndSubTime,SubTime,TimeLimit,TypeSummary,IsJoinScoreItem 
FROM dbo.KC_UnitTestPaper(NOLOCK) WHERE IsDel = 0 AND Id=54


SELECT UserName,UserEmail,UserPhone,SchoolName,UnitPosition,Corporation,CorporationOther,Details,CreateTime
FROM dbo.KC_TrialApplication(NOLOCK) WHERE Id=1 AND IsDel=0



SELECT * FROM dbo.KC_UserUnitTestHomeWork WHERE UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903'

DELETE FROM dbo.KC_UserUnitTestHomeWork WHERE Id=1093




SELECT C.Id,C.Name 
FROM [dbo].[KC_UnitTestCatalogue](NOLOCK) AS C 
WHERE C.IsDel=0 AND C.CourseMOOC_Id=1123 
AND (SELECT 
( SELECT COUNT(1) FROM [dbo].[KC_UnitTestPaper](NOLOCK) AS UTP WHERE UTP.UnitTestCatalogue_Id= C.Id AND UTP.IsDel=0 AND UTP.IsPublish=1)+ 
( SELECT COUNT(1) FROM [dbo].[KC_UnitTestHomeWork](NOLOCK) AS UTH WHERE UTH.UnitTestCatalogue_Id=C.Id AND UTH.IsDel=0 AND UTH.IsPublish=1)
) >0


SELECT UTP.Id,UTP.PaperName,UTP.Score,UTP.EndSubTime,UTP.SubTime,UTP.TimeLimit,UTP.TypeSummary,
(SELECT MAX(UTPR.Grade) FROM [dbo].[KC_UserUnitTestPaperRecord](NOLOCK) AS UTPR 
WHERE UTPR.UnitTestPaper_Id=UTP.Id  AND UTPR.UserNo='59ced3b3-20d8-4d88-bb68-fc155ac4e903' AND UTPR.IsDel=0) AS MaxGrade
FROM [dbo].[KC_UnitTestPaper](NOLOCK) AS UTP
WHERE UTP.UnitTestCatalogue_Id=20 AND UTP.IsDel=0 AND UTP.IsPublish=1



SELECT UTH.Id,UTH.WorkName,UTH.EndSubTime,UTH.GradePublishTime,UTH.CorrectWay,UTH.MutualEndTime,UTH.MutualStartTime,UTH.SelfEndTime,UTH.Score,
UUHW.Grade AS MaxGrade, UUHW.Id AS SubmitId,UTH.MutualCommentNum,
(
SELECT COUNT(1) FROM dbo.KC_UserUnitTestHomeWorkMutualComment(NOLOCK) mutal 
WHERE mutal.UserNo='59ced3b3-20d8-4d88-bb68-fc155ac4e903' AND mutal.IsDel=0 AND mutal.UserUnitTestHomeWork_Id<>UUHW.Id
) AS CurrentUserCommentQty,
(
SELECT COUNT(1) FROM [dbo].[KC_UserUnitTestHomeWorkMutualComment](NOLOCK) AS UMC 
WHERE UMC.RoleName='教师批改' AND UMC.UserUnitTestHomeWork_Id=UUHW.Id
)AS TeacherSubTime
FROM [dbo].[KC_UnitTestHomeWork](NOLOCK) AS UTH
LEFT JOIN [dbo].[KC_UserUnitTestHomeWork](NOLOCK) AS UUHW ON UUHW.UnitTestHomeWork_Id=UTH.Id AND UUHW.IsDel=0 AND UUHW.UserNo='59ced3b3-20d8-4d88-bb68-fc155ac4e903'
WHERE UTH.UnitTestCatalogue_Id=20 AND UTH.IsDel=0 AND UTH.IsPublish=1


 -- 20170501002   59ced3b3-20d8-4d88-bb68-fc155ac4e903


-- 查询课程成绩列表
SELECT U.UserNo,U.NickName,UCS.[IsPublished],UCS.[FinalScore] AS CourseScore,ROW_NUMBER() OVER(ORDER BY UCS.IsPublished,UCS.FinalScore DESC,UC.CreateTime)AS RowNumber,
(SELECT SUM(FinalScore) 
FROM [dbo].[KC_UserCourseScoreItemRecord](NOLOCK) AS USI 
INNER JOIN [dbo].[KC_CourseScoreItem](NOLOCK) AS CSI ON CSI.Id=USI.CourseScoreItem_Id 
WHERE USI.UserNo=UC.UserNo AND USI.IsDel=0 AND CSI.CourseMOOC_Id=1123  AND CSI.IsJoinFinalScore=1) AS ScoreItemValue
FROM 
(SELECT UC.UserNo,UC.CourseId,UC.CreateTime  FROM  [dbo].[KC_UserCourse](NOLOCK) AS UC 
INNER JOIN [dbo].[US_UserCenter](NOLOCK) AS U ON U.UserNo=UC.UserNo
INNER JOIN [dbo].[US_UserBasicInfo](NOLOCK) AS UB ON UB.[UserNo]=UC.[UserNo]  
WHERE UC.CourseTypeId=23 AND UC.CourseId=1123 AND UC.IsDel=0 AND UC.IsSignOut=0 ) AS UC
INNER JOIN [dbo].[US_UserCenter](NOLOCK) AS U ON U.UserNo=UC.UserNo 
LEFT JOIN [dbo].[KC_UserCourseScore](NOLOCK) AS UCS ON UCS.CourseMOOC_Id=UC.CourseId AND UCS.[UserNo]=UC.UserNo 



SELECT *
FROM [dbo].[KC_UserCourseScoreItemRecord](NOLOCK) AS USI 
INNER JOIN [dbo].[KC_CourseScoreItem](NOLOCK) AS CSI ON CSI.Id=USI.CourseScoreItem_Id 
WHERE USI.UserNo='59ced3b3-20d8-4d88-bb68-fc155ac4e903' AND USI.IsDel=0 AND CSI.CourseMOOC_Id=1123  AND CSI.IsJoinFinalScore=1

SELECT * FROM [dbo].[KC_CourseScoreItem] 

SELECT * FROM [dbo].[KC_UserCourseScoreItemRecord] WHERE UserNo='59ced3b3-20d8-4d88-bb68-fc155ac4e903'


SELECT	csi.Id,csi.CourseMOOC_Id,csi.Name,csi.Score,csi.IsPublished,csi.IsJoinFinalScore,csi.CreateTime,d.Name AS ScoreItemTypeName
FROM	dbo.KC_CourseScoreItem(NOLOCK) csi
LEFT JOIN	dbo.US_Dictionary(NOLOCK) d ON csi.ScoreItemType=d.Id  AND d.IsDel=0
WHERE	csi.CourseMOOC_Id=1123 and csi.IsDel=0

-- 查询成绩项列表
SELECT	ucsir.CourseScoreItem_Id AS ScoreItemId,u.NickName AS StudentName,ucsir.Id,u.UserNo,ucsir.IsPublished,
ucsir.Score,ucsir.FinalScore,ROW_NUMBER() OVER(ORDER BY uc.CreateTime DESC)AS RowNumber
FROM	
(SELECT uc.UserNo,uc.CourseId,uc.CreateTime FROM dbo.KC_UserCourse(NOLOCK) uc 
WHERE uc.CourseTypeId=23 AND uc.CourseId = 1123 AND uc.IsDel = 0 AND uc.IsSignOut = 0) AS uc
JOIN	dbo.US_UserCenter(NOLOCK) u ON uc.UserNo = u.UserNo AND u.IsDel = 0 
JOIN	dbo.US_UserBasicInfo(NOLOCK) ub ON ub.UserNo = u.UserNo AND ub.IsDel = 0
JOIN	dbo.KC_CourseScoreItem(NOLOCK) csi ON csi.CourseMOOC_Id = uc.CourseId AND csi.IsDel = 0
LEFT JOIN dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucsir ON ucsir.CourseScoreItem_Id = csi.Id AND ucsir.UserNo = u.UserNo
WHERE	csi.Id = 66 

SELECT * FROM dbo.KC_UnitTestHomeWork ORDER BY CreateTime DESC


-- 测验与作业的目录
SELECT *
FROM [dbo].[KC_UnitTestCatalogue](NOLOCK) AS C 
WHERE C.IsDel=0 AND C.CourseMOOC_Id=4228

-- 测验列表
SELECT 
UT.Id,UT.PaperName,UT.Score,UT.SubTime,UT.EndSubTime,UT.TimeLimit,UT.IsPublish,UT.UnitTestCatalogue_Id,UT.TypeSummary,UT.IsJoinScoreItem,UT.Score, 
(SELECT COUNT(DISTINCT(UPR.UserNo)) FROM [dbo].[KC_UserUnitTestPaperRecord](NOLOCK) AS UPR WHERE UPR.UnitTestPaper_Id=UT.Id AND UPR.IsDel=0 ) AS SubmitCount 
FROM [dbo].[KC_UnitTestPaper](NOLOCK) AS UT 
WHERE UT.UnitTestCatalogue_Id=20 AND  UT.IsDel=0

-- 作业列表
SELECT UT.Id,UT.UnitTestCatalogue_Id,UT.WorkName,UT.EndSubTime,UT.IsPublish,UT.Score,UT.GradePublishTime,UT.CorrectWay,
	UT.MutualStartTime,UT.MutualEndTime,UT.SelfEndTime,UT.SubTime,UT.WorkContent,UT.Answers,UT.IsSupportAttachment,UT.MutualCommentNum,UT.IsAllowLookMutualComment,UT.IsJoinScoreItem,
(SELECT COUNT(DISTINCT(uuh.UserNo)) FROM dbo.KC_UserUnitTestHomeWork(NOLOCK) uuh WHERE uuh.UnitTestHomeWork_Id = UT.Id AND uuh.IsDel=0) AS SubmitCount
FROM [dbo].[KC_UnitTestHomeWork](NOLOCK) AS UT 
WHERE  UT.UnitTestCatalogue_Id=20 AND UT.IsDel=0

-- 学生可以查看的作业与测试列表
SELECT C.Id,C.Name 
FROM [dbo].[KC_UnitTestCatalogue](NOLOCK) AS C 
WHERE C.IsDel=0 AND C.CourseMOOC_Id=4228 AND C.CatalogTypeId=4067
AND (SELECT 
( SELECT COUNT(1) FROM [dbo].[KC_UnitTestPaper](NOLOCK) AS UTP WHERE UTP.UnitTestCatalogue_Id= C.Id AND UTP.IsDel=0 AND UTP.IsPublish=1)+ 
( SELECT COUNT(1) FROM [dbo].[KC_UnitTestHomeWork](NOLOCK) AS UTH WHERE UTH.UnitTestCatalogue_Id=C.Id AND UTH.IsDel=0 AND UTH.IsPublish=1)
) >0


SELECT C.Id,C.Name 
FROM [dbo].[KC_UnitTestCatalogue](NOLOCK) AS C 
WHERE C.IsDel=0 AND C.CourseMOOC_Id=4228 AND C.CatalogTypeId=4066
AND (SELECT COUNT(1) FROM [dbo].[KC_UnitTestPaper](NOLOCK) AS UTP WHERE UTP.UnitTestCatalogue_Id= C.Id AND UTP.IsDel=0 AND UTP.IsPublish=1)>0

SELECT TOP 3* FROM CmmoocCourse.dbo.US_Dictionary ORDER BY CreateTime DESC
SELECT TOP 3* FROM CmmoocUserCenter.dbo.US_Dictionary ORDER BY CreateTime DESC

SELECT * FROM dbo.KC_CourseModuleRelevance WHERE CourseMOOC_Id=4214

SELECT CM.Id AS CourseId,CM.CourseName,CM.CourseCover,I.LOGO AS SchoolLogo,I.SquareLogo,I.Name AS SchoolName,
I.OrgnizationCode,CM.TeacherNo AS DutyUserNo,I.UserNo AS SchoolUserNo,CMD.StartTime,CM.IsPublished,CM.CurrentStatus,
(SELECT T.TeacherCode+','+T.Name+','+LTRIM( T.TeacherNo)+'|' FROM [dbo].[KC_TeacherCourse](NOLOCK) AS TC 
INNER JOIN [dbo].[KC_Teacher](NOLOCK) AS T ON T.TeacherNo=TC.TeacherNo 
WHERE TC.Course_Id=CM.Id AND TC.CourseTypeId=23 FOR XML PATH('')) AS TeacherInfo
FROM [dbo].[KC_CourseMOOC](NOLOCK) AS CM
INNER JOIN [dbo].[KC_CourseMOOCDetail](NOLOCK) AS CMD ON CMD.CourseMOOC_Id=CM.Id
INNER JOIN [dbo].[KC_Institution](NOLOCK) AS I ON I.Id=CM.Institution_Id
WHERE CM.Id=1123


SELECT m.Id as ModuleId, m.Name as ModuleName,m.IsMust, m.VirtualPath,m.StudentLinkPath,m.AssistantLinkPath,m.IconPath,m.Color,mr.Sort,m.MenuNo,mr.IsShowForStudents,m.ParentId 
FROM KC_CourseModuleRelevance(NOLOCK) mr 
JOIN KC_CourseMOOCModule(NOLOCK) m on  mr.CourseMOOCModule_Id=m.Id --AND m.ParentId<>0
WHERE mr.CourseMOOC_Id=4228 and m.IsDel=0 and mr.IsDel=0 
ORDER by mr.Sort 

-- 查询课件列表
SELECT * FROM
(
WITH CourseWare AS (
SELECT CC.Id,CC.ParentId,CC.Title FROM [dbo].[KC_CourseCatalog](NOLOCK) AS CC where CC.CourseId=1123 AND CC.CatalogTypeId=23 AND CC.IsDel=0 AND CC.ParentId=0 AND CC.IsPublished=1
UNION ALL
SELECT CC.Id,CC.ParentId,CC.Title FROM [dbo].[KC_CourseCatalog](NOLOCK) AS CC 
INNER JOIN CourseWare AS C ON C.Id=CC.ParentId 
where CC.IsDel=0 
)
SELECT C.Id AS CatalogId ,C.ParentId AS ParentId,C.Title AS Title ,CR.Id AS ResourceId,CR.ResourceType,RC.OriginalName--,
--(SELECT (CASE WHEN COUNT(1)>=1 THEN 1 ELSE 0 END) AS ResourceIsStudy  FROM [dbo].[KC_UserStudyRecord](NOLOCK) AS USR WHERE USR.CourseResources_Id=CR.Id AND USR.UserNo=@UserNo) AS ResourceIsStudy
FROM CourseWare AS C 
LEFT JOIN [dbo].[KC_CourseResources](NOLOCK) AS CR ON CR.CatalogId=C.Id AND CR.IsDel=0
LEFT JOIN [dbo].[KC_ResourceContent](NOLOCK) AS RC ON RC.ResourceNo=CR.ResourceNo
) t WHERE t.ParentId=0

WITH CourseWare AS 
(
	SELECT TOP 1 Id,Title FROM dbo.KC_CourseCatalog(NOLOCK) WHERE ParentId IN(
	SELECT TOP 1 Id FROM dbo.KC_CourseCatalog(NOLOCK) 
	WHERE CourseId=1123 AND CatalogTypeId=23 AND IsDel=0 AND IsPublished=1 ORDER BY Id
	) AND IsDel=0 AND IsPublished=1
	ORDER BY Id
)
SELECT c.Id,c.Title,cr.Id AS ResourceId,cr.ResourceType,rc.OriginalName FROM CourseWare AS c
LEFT JOIN dbo.KC_CourseResources(NOLOCK) cr ON cr.CatalogId=c.Id AND cr.IsDel=0
LEFT JOIN dbo.KC_ResourceContent(NOLOCK) rc ON rc.ResourceNo=cr.ResourceNo AND rc.IsDel=0


SELECT * FROM dbo.US_Dictionary
SELECT * FROM dbo.KC_CourseCatalog
SELECT * FROM dbo.KC_CourseResources


SELECT COUNT(1) FROM dbo.KC_CourseScoreItem(NOLOCK) WHERE CourseMOOC_Id=0 AND IsDel=0 

INSERT INTO dbo.KC_CourseScoreItem(CourseMOOC_Id,Name,Score,IsPublished,IsJoinFinalScore,ScoreItemType)
VALUES  (4228,'测验',40,1,1,4066),
(4228,'考试',40,1,1,4068),
(4228,'作业',20,1,1,4067),
(4228,'课堂讨论',10,1,1,4069)

SELECT SUM(Score) FROM dbo.KC_CourseScoreItem WHERE CourseMOOC_Id=4228 AND IsDel=0 AND ScoreItemType<>0

SELECT * FROM dbo.KC_CourseScoreItem WHERE CourseMOOC_Id=4228
INSERT INTO dbo.KC_CourseScoreItem(CourseMOOC_Id,Name,Score,IsPublished,IsJoinFinalScore,ScoreItemType)VALUES(4228,'作业',20,1,1,4067)

SELECT	csi.Id,csi.CourseMOOC_Id,csi.Name,csi.Score,csi.IsPublished,csi.IsJoinFinalScore,csi.CreateTime,d.Name AS ScoreItemTypeName,csi.ScoreItemType
FROM	dbo.KC_CourseScoreItem(NOLOCK) csi
LEFT JOIN	dbo.US_Dictionary(NOLOCK) d ON csi.ScoreItemType=d.Id  AND d.IsDel=0
WHERE	csi.CourseMOOC_Id=4228 and csi.IsDel=0


SELECT * FROM dbo.KC_CourseMOOC
SELECT * FROM dbo.KC_CourseMOOCDetail

SELECT COUNT(1) FROM dbo.KC_CourseScoreItem WHERE Name='' AND CourseMOOC_Id=4228 AND IsDel=0


SELECT * FROM [dbo].[KC_CourseScoreItem](NOLOCK) AS CSI WHERE CSI.[IsDel]=0 AND CSI.[SourceId]=@SourceId AND CSI.[ScoreItemType]=@ScoreItemType

SELECT *,ScoreItemType FROM dbo.KC_CourseScoreItem(NOLOCK) WHERE CourseMOOC_Id=4228 AND IsDel=0 AND ScoreItemType IS NULL


SELECT	ucsir.CourseScoreItem_Id AS ScoreItemId,u.NickName AS StudentName,ucsir.Id,u.UserNo,ucsir.IsPublished,
ucsir.Score,ucsir.FinalScore,
ROW_NUMBER() OVER(ORDER BY uc.CreateTime DESC)AS RowNumber
FROM	(SELECT uc.UserNo,uc.CourseId,uc.CreateTime FROM dbo.KC_UserCourse(NOLOCK) uc 
WHERE uc.CourseTypeId=23 AND uc.CourseId = 1123 AND uc.IsDel = 0 AND uc.IsSignOut = 0) AS uc
JOIN	dbo.US_UserCenter(NOLOCK) u ON uc.UserNo = u.UserNo AND u.IsDel = 0 
JOIN	dbo.US_UserBasicInfo(NOLOCK) ub ON ub.UserNo = u.UserNo AND ub.IsDel = 0
JOIN	dbo.KC_CourseScoreItem(NOLOCK) csi ON csi.CourseMOOC_Id = uc.CourseId AND csi.IsDel = 0
LEFT JOIN dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucsir ON ucsir.CourseScoreItem_Id = csi.Id AND ucsir.UserNo = u.UserNo
WHERE	csi.Id = 64 

SELECT * FROM dbo.KC_UserCourseScoreItemRecord


SELECT * FROM [dbo].[KC_CourseScoreItem](NOLOCK) AS CSI 
WHERE CSI.[IsDel]=0 AND CSI.[SourceId]=1107 AND CSI.[ScoreItemType]=4066

SELECT cs.*,js.Id AS JoinScoreItem_Id FROM KC_JoinScoreItem(NOLOCK) js
JOIN dbo.KC_CourseScoreItem(NOLOCK) cs ON js.CourseScoreItem_Id=cs.Id
WHERE js.SourceId=1107 AND js.IsDel=0 AND cs.IsDel=0 AND cs.ScoreItemType=4066

INSERT INTO dbo.KC_JoinScoreItem(CourseScoreItem_Id,SourceId)VALUES(0,0)
SELECT * FROM dbo.KC_ExamPaper WHERE Id=78

SELECT * FROM dbo.KC_JoinScoreItem WHERE CourseScoreItem_Id=1124 AND SourceId=78
DELETE FROM dbo.KC_JoinScoreItem WHERE CourseScoreItem_Id=1124 AND SourceId=78

SELECT * FROM dbo.KC_CourseScoreItem WHERE CourseMOOC_Id=4228

-- 根据成绩项编号获取单个用户的成绩项得分记录
SELECT * FROM [dbo].[KC_UserCourseScoreItemRecord] AS UCSI 
WHERE UCSI.IsDel=0 AND UCSI.CourseScoreItem_Id=1123 AND UCSI.UserNo='59ced3b3-20d8-4d88-bb68-fc155ac4e903' AND JoinScoreItem_Id=8

SELECT * FROM dbo.KC_UserCourseScoreItemRecord WHERE UserNo='59ced3b3-20d8-4d88-bb68-fc155ac4e903' ORDER BY CreateTime DESC

SELECT * FROM dbo.KC_JoinScoreItem WHERE SourceId=2637 AND CourseScoreItem_Id=1126
SELECT * FROM dbo.KC_UnitTestHomeWork WHERE Id=2078

SELECT * FROM dbo.KC_ForumPosts WHERE Title='加入成绩项'


SELECT * FROM dbo.KC_UserUnitTestPaperRecord
SELECT * FROM dbo.KC_UserUnitTestOptionsRecord

SELECT * FROM dbo.KC_UserUnitTestHomeWork WHERE UserNo='59ced3b3-20d8-4d88-bb68-fc155ac4e903' AND UnitTestHomeWork_Id=2078
SELECT * FROM dbo.KC_UserUnitTestHomeWorkMutualComment ORDER BY CreateTime DESC

SELECT * FROM dbo.KC_UserUnitTestHomeWork ORDER BY CreateTime DESC


-- 学生成绩项评分列表
--SELECT	*
--ROW_NUMBER() OVER(ORDER BY uc.CreateTime DESC)AS RowNumber,
 SELECT csi.Id AS ScoreItemId,u.NickName,u.UserNo,
(
	SELECT AVG(ucsir.Score) FROM dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucsir 
	WHERE ucsir.CourseScoreItem_Id=csi.Id AND ucsir.UserNo=u.UserNo AND ucsir.IsDel=0
) AS AvgScore,ROW_NUMBER() OVER(ORDER BY uc.CreateTime DESC)AS RowNumber
FROM (SELECT uc.UserNo,uc.CourseId,uc.CreateTime FROM dbo.KC_UserCourse(NOLOCK) uc 
WHERE uc.CourseTypeId=23 AND uc.CourseId = 4228 AND uc.IsDel = 0 AND uc.IsSignOut = 0) AS uc
JOIN	dbo.US_UserCenter(NOLOCK) u ON uc.UserNo = u.UserNo AND u.IsDel = 0 
JOIN	dbo.US_UserBasicInfo(NOLOCK) ub ON ub.UserNo = u.UserNo AND ub.IsDel = 0
JOIN	dbo.KC_CourseScoreItem(NOLOCK) csi ON csi.CourseMOOC_Id = uc.CourseId AND csi.IsDel = 0
WHERE	csi.Id = 1123 

SELECT count(1) FROM dbo.KC_UserCourse(NOLOCK) uc 
                                        JOIN	dbo.US_UserCenter(NOLOCK) u ON uc.UserNo = u.UserNo AND u.IsDel = 0 
                                        JOIN	dbo.US_UserBasicInfo(NOLOCK) ub ON ub.UserNo = u.UserNo AND ub.IsDel = 0
                                        WHERE uc.CourseTypeId=23 AND uc.CourseId = 4228 AND uc.IsDel = 0 AND uc.IsSignOut = 0 

-- 单元测试成绩项下的加入项的得分情况
SELECT	ucsi.Id,ucsi.UserNo,ucsi.Score,ucsi.FinalScore,ucsi.IsPublished,ucsi.JoinScoreItem_Id,
		ut.PaperName AS SourceTitle,ucsi.JoinScoreItem_Id AS JoinScoreItemId,
		(
			SELECT MAX(Grade) 
			FROM dbo.KC_UserUnitTestPaperRecord(NOLOCK) utr WHERE utr.UserNo=ucsi.UserNo AND utr.UnitTestPaper_Id =ut.Id AND IsDel=0
		) AS UserGrade,
		(
			SELECT 1
			FROM dbo.KC_UserUnitTestHomeWork(NOLOCK) uth WHERE uth.UserNo=ucsi.UserNo AND uth.UnitTestHomeWork_Id=1
		)
FROM	dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucsi
JOIN	dbo.KC_JoinScoreItem(NOLOCK) js ON ucsi.JoinScoreItem_Id=js.Id AND js.IsDel=0
JOIN	dbo.KC_UnitTestPaper(NOLOCK) ut ON js.SourceId=ut.Id AND ut.IsDel=0
WHERE ucsi.UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903' AND ucsi.CourseScoreItem_Id=1123 AND ucsi.IsDel=0

-- 作业成绩项下的加入项的得分情况
SELECT	ucsi.Id,ucsi.UserNo,ucsi.Score,ucsi.FinalScore,ucsi.IsPublished,ucsi.JoinScoreItem_Id,
		ut.WorkName AS SourceTitle,ucsi.JoinScoreItem_Id AS JoinScoreItemId,
		(
			SELECT MAX(uth.Grade)
			FROM dbo.KC_UserUnitTestHomeWork(NOLOCK) uth WHERE uth.UserNo=ucsi.UserNo AND uth.UnitTestHomeWork_Id=ut.Id AND uth.IsDel=0
		)AS UserGrade
FROM	dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucsi
JOIN	dbo.KC_JoinScoreItem(NOLOCK) js ON ucsi.JoinScoreItem_Id=js.Id AND js.IsDel=0
JOIN	dbo.KC_UnitTestHomeWork(NOLOCK) ut ON js.SourceId=ut.Id AND ut.IsDel=0
WHERE ucsi.UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903' AND ucsi.CourseScoreItem_Id=1127 AND ucsi.IsDel=0

-- 考试成绩项下的加入项的得分情况
SELECT	ucsi.Id,ucsi.UserNo,ucsi.Score,ucsi.FinalScore,ucsi.IsPublished,ucsi.JoinScoreItem_Id,
		ut.Title AS SourceTitle,ucsi.JoinScoreItem_Id AS JoinScoreItemId,
		(
			SELECT MAX(uth.Grade)
			FROM dbo.KC_ExamPaperRecord(NOLOCK) uth WHERE uth.UserNo=ucsi.UserNo AND uth.Paper_Id=ut.Id AND uth.IsDel=0
		)AS UserGrade
FROM	dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucsi
JOIN	dbo.KC_JoinScoreItem(NOLOCK) js ON ucsi.JoinScoreItem_Id=js.Id AND js.IsDel=0
JOIN	dbo.KC_ExamPaper(NOLOCK) ut ON js.SourceId=ut.Id AND ut.IsDel=0
WHERE ucsi.UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903' AND ucsi.CourseScoreItem_Id=1124 AND ucsi.IsDel=0

-- 讨论区成绩项下的加入项的得分情况
SELECT	ucsi.Id,ucsi.UserNo,ucsi.Score,ucsi.FinalScore,ucsi.IsPublished,ucsi.JoinScoreItem_Id,ucsi.Score AS UserGrade,
		fp.Title AS SourceTitle,ucsi.JoinScoreItem_Id AS JoinScoreItemId
FROM	dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucsi
JOIN	dbo.KC_JoinScoreItem(NOLOCK) js ON ucsi.JoinScoreItem_Id=js.Id AND js.IsDel=0
JOIN	dbo.KC_ForumPosts(NOLOCK) fp ON js.SourceId=fp.Id AND fp.IsDel=0
WHERE ucsi.UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903' AND ucsi.CourseScoreItem_Id=1126 AND ucsi.IsDel=0


SELECT * FROM dbo.KC_ForumPosts
SELECT * FROM dbo.KC_UserCourseScoreItemRecord
SELECT * FROM dbo.KC_ExamPaper
SELECT * FROM dbo.KC_ExamPaperRecord
SELECT * FROM dbo.KC_UserUnitTestHomeWork 
SELECT * FROM dbo.KC_UnitTestHomeWork WHERE Id=2077 ORDER BY CreateTime DESC
SELECT * FROM dbo.KC_CourseScoreItem WHERE CourseMOOC_Id=4228
SELECT * FROM dbo.KC_JoinScoreItem WHERE CourseScoreItem_Id=1127

SELECT * FROM dbo.KC_UnitTestPaper WHERE Id IN(1107,1110)
SELECT MAX(Grade) 
FROM dbo.KC_UserUnitTestPaperRecord WHERE UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903' AND UnitTestPaper_Id =1107 AND IsDel=0


SELECT * 
FROM dbo.KC_UserUnitTestHomeWork WHERE UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903' AND UnitTestHomeWork_Id=2078


SELECT * FROM dbo.KC_CourseScoreItem WHERE Id=1123

SELECT * FROM dbo.KC_UnitTestPaper WHERE Id=1107
SELECT * FROM dbo.KC_JoinScoreItem WHERE Id=8

SELECT	 *
FROM	dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucsi
WHERE UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903' AND CourseScoreItem_Id=1123 AND ucsi.IsDel=0

SELECT * FROM dbo.KC_UserCourseScoreItemLog

SELECT	csr.Score,csr.CreateTime,csr.RoleName,u.NickName AS TeacherName
FROM	dbo.KC_UserCourseScoreItemLog(NOLOCK) csr
JOIN	dbo.US_UserCenter(NOLOCK) u ON csr.TeacherNo=u.UserNo
WHERE CourseScoreItem_Id = 1123 AND csr.UserNo = '59CED3B3-20D8-4D88-BB68-FC155AC4E903' AND csr.JoinScoreItem_Id=0 AND csr.IsDel = 0
ORDER BY csr.CreateTime DESC


SELECT * FROM dbo.KC_UserCourseScoreItemRecord 


SELECT * --Id, Title, CourseId, ParentId,IsPublished
FROM [dbo].[KC_CourseCatalog](NOLOCK)
WHERE [CourseId]=4228  AND [CatalogTypeId]=23 AND [IsDel]=0

SELECT CR.Id,CR.CatalogId,CR.ResourceNo,CR.ResourceType,RC.OriginalName,RC.ResourcePath,RC.ResourceFormat
FROM [dbo].[KC_CourseResources](NOLOCK) AS CR
INNER JOIN [dbo].[KC_ResourceContent](NOLOCK) AS RC ON RC.ResourceNo=CR.ResourceNo
WHERE CR.CatalogId=3668 AND CR.IsDel=0 AND RC.IsDel=0


SELECT * FROM dbo.KC_CourseResources 


-- 课程成绩列表

SELECT U.UserNo,U.NickName,UCS.[IsPublished],UCS.[FinalScore] AS CourseScore,ROW_NUMBER() OVER(ORDER BY UCS.IsPublished ,UCS.FinalScore DESC,UC.CreateTime)AS RowNumber,
(SELECT SUM(FinalScore) 
FROM [dbo].[KC_UserCourseScoreItemRecord](NOLOCK) AS USI 
INNER JOIN [dbo].[KC_CourseScoreItem](NOLOCK) AS CSI ON CSI.Id=USI.CourseScoreItem_Id 
WHERE USI.UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903' AND USI.IsDel=0 AND CSI.CourseMOOC_Id=4228  AND CSI.IsJoinFinalScore=1) AS ScoreItemValue
FROM 
(SELECT UC.UserNo,UC.CourseId,UC.CreateTime  FROM  [dbo].[KC_UserCourse](NOLOCK) AS UC 
    INNER JOIN [dbo].[US_UserCenter](NOLOCK) AS U ON U.UserNo=UC.UserNo
INNER JOIN [dbo].[US_UserBasicInfo](NOLOCK) AS UB ON UB.[UserNo]=UC.[UserNo]  
WHERE UC.CourseTypeId=23 AND UC.CourseId=4228 AND UC.IsDel=0 AND UC.IsSignOut=0 ) AS UC
INNER JOIN [dbo].[US_UserCenter](NOLOCK) AS U ON U.UserNo=UC.UserNo 
LEFT JOIN [dbo].[KC_UserCourseScore](NOLOCK) AS UCS ON UCS.CourseMOOC_Id=UC.CourseId AND UCS.[UserNo]=UC.UserNo 


SELECT * FROM dbo.KC_UserCourseScoreItemRecord 
WHERE UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903' AND CourseScoreItem_Id IN(1123,1124,1125,1126,1127)

SELECT * FROM dbo.KC_CourseScoreItem WHERE CourseMOOC_Id=4228
SELECT * FROM dbo.KC_UserCourseScore WHERE CourseMOOC_Id=4228


SELECT * FROM dbo.KC_HelpCenter


SELECT CR.Id,CR.CatalogId,CR.ResourceNo,CR.ResourceType,RC.OriginalName,RC.ResourcePath,RC.ResourceFormat
FROM [dbo].[KC_CourseResources](NOLOCK) AS CR
INNER JOIN [dbo].[KC_ResourceContent](NOLOCK) AS RC ON RC.ResourceNo=CR.ResourceNo
WHERE CR.CatalogId=265 AND CR.IsDel=0 AND RC.IsDel=0

WITH CourseWare AS (
SELECT CC.Id,CC.ParentId,CC.Title FROM [dbo].[KC_CourseCatalog](NOLOCK) AS CC 
WHERE CC.CourseId=4228 AND CC.CatalogTypeId=23 AND CC.IsDel=0 AND CC.ParentId=0 AND CC.IsPublished=1
UNION ALL
SELECT CC.Id,CC.ParentId,CC.Title FROM [dbo].[KC_CourseCatalog](NOLOCK) AS CC 
INNER JOIN CourseWare AS C ON C.Id=CC.ParentId 
where CC.IsDel=0 
)
--SELECT * FROM CourseWare WHERE CourseWare.ParentId=3703

SELECT C.Id AS CatalogId ,C.ParentId AS ParentId,C.Title AS Title ,CR.Id AS ResourceId,CR.ResourceType,RC.OriginalName,
(SELECT (CASE WHEN COUNT(1)>=1 THEN 1 ELSE 0 END) AS ResourceIsStudy  FROM [dbo].[KC_UserStudyRecord](NOLOCK) AS USR 
WHERE USR.CourseResources_Id=CR.Id AND USR.UserNo='59ced3b3-20d8-4d88-bb68-fc155ac4e903') AS ResourceIsStudy
FROM CourseWare AS C 
LEFT JOIN [dbo].[KC_CourseResources](NOLOCK) AS CR ON CR.CatalogId=C.Id AND CR.IsDel=0
LEFT JOIN [dbo].[KC_ResourceContent](NOLOCK) AS RC ON RC.ResourceNo=CR.ResourceNo
WHERE C.Id=3703

-- 查询章下的资源列表
SELECT cr.CatalogId,cc.ParentId,rc.OriginalName AS Title,cr.Id AS ResourceId,cr.ResourceType,rc.OriginalName,
(SELECT (CASE WHEN COUNT(1)>=1 THEN 1 ELSE 0 END) AS ResourceIsStudy  FROM [dbo].[KC_UserStudyRecord](NOLOCK) AS USR 
WHERE USR.CourseResources_Id=cr.Id AND USR.UserNo='59ced3b3-20d8-4d88-bb68-fc155ac4e903') AS ResourceIsStudy
FROM dbo.KC_CourseResources(NOLOCK) cr 
LEFT JOIN dbo.KC_ResourceContent(NOLOCK) rc ON rc.ResourceNo=cr.ResourceNo
JOIN dbo.KC_CourseCatalog(NOLOCK) cc ON cr.CatalogId=cc.Id 
WHERE cr.CatalogId=3703 AND cc.CatalogTypeId=23 AND cr.IsDel=0 AND rc.IsDel=0 AND cc.IsPublished=1 AND cc.IsDel=0
UNION ALL
-- 查询章下的小节列表
SELECT cr.CatalogId,cc.ParentId,cc.Title,cr.Id AS ResourceId,cr.ResourceType,rc.OriginalName,
(SELECT (CASE WHEN COUNT(1)>=1 THEN 1 ELSE 0 END) AS ResourceIsStudy  FROM [dbo].[KC_UserStudyRecord](NOLOCK) AS USR 
WHERE USR.CourseResources_Id=cr.Id AND USR.UserNo='59ced3b3-20d8-4d88-bb68-fc155ac4e903') AS ResourceIsStudy
FROM dbo.KC_CourseCatalog(NOLOCK) cc 
LEFT JOIN dbo.KC_CourseResources(NOLOCK) cr ON cr.CatalogId=cc.Id
LEFT JOIN dbo.KC_ResourceContent(NOLOCK) rc ON rc.ResourceNo=cr.ResourceNo
WHERE cc.ParentId=3703 AND cc.CourseId=4228 AND cc.IsDel=0 AND cc.IsPublished=1 AND cr.IsDel=0 AND rc.IsDel=0

--

SELECT UC.Id,UC.CatalogId,CC.Title,cc.ParentId, CC2.Title AS ParentTitle
FROM [dbo].[KC_UserCourse](NOLOCK) AS UC
INNER JOIN [dbo].[KC_CourseCatalog](NOLOCK) AS CC ON CC.Id=UC.CatalogId
INNER JOIN [dbo].[KC_CourseCatalog](NOLOCK) AS CC2 ON CC2.Id=CC.ParentId
WHERE UC.[UserNo]='59ced3b3-20d8-4d88-bb68-fc155ac4e903' AND 
UC.[CourseId]=4228 AND UC.[CourseTypeId]=23 AND UC.[IsSignOut]=0 AND UC.IsDel=0 AND CC.IsDel=0 AND CC.IsPublished=1


SELECT * FROM dbo.KC_CourseResources WHERE CatalogId IN(3703)



SELECT Id,Title,CourseId,ParentId,IsPublished FROM dbo.KC_CourseCatalog(NOLOCK) 
WHERE CourseId=4228 AND CatalogTypeId=0 AND ParentId=0 AND IsDel=0 AND IsPublished=1



SELECT Id, Title, CourseId, ParentId,IsPublished
FROM [dbo].[KC_CourseCatalog](NOLOCK)
WHERE [CourseId]=4228  AND [CatalogTypeId]=23 AND [IsDel]=0


SELECT CR.Id,CR.CatalogId,CR.ResourceNo,CR.ResourceType,RC.OriginalName,RC.ResourcePath,RC.ResourceFormat
FROM [dbo].[KC_CourseResources](NOLOCK) AS CR
INNER JOIN [dbo].[KC_ResourceContent](NOLOCK) AS RC ON RC.ResourceNo=CR.ResourceNo
WHERE CR.CatalogId=3703 AND CR.IsDel=0 AND RC.IsDel=0

SELECT * FROM dbo.KC_UserUnitTestPaperRecord WHERE UnitTestPaper_Id=1107
SELECT * FROM dbo.KC_UserCourseScoreItemRecord ORDER BY Id DESC
SELECT * FROM dbo.KC_CourseScoreItem WHERE IsDel=0 ORDER BY CreateTime DESC


-- 59CED3B3-20D8-4D88-BB68-FC155AC4E903

SELECT * FROM dbo.KC_JoinScoreItem WHERE Id=8


SELECT  ucsi.Id,csi.Id AS ScoreItemId,u.NickName AS StudentName,u.UserNo,csi.ScoreItemType,
(
	SELECT AVG(ucsir.Score) FROM dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucsir 
	WHERE ucsir.CourseScoreItem_Id=csi.Id AND ucsir.UserNo=u.UserNo AND ucsir.IsDel=0
) AS AvgScore,ucsi.FinalScore,ROW_NUMBER() OVER(ORDER BY uc.CreateTime DESC)AS RowNumber
FROM	(SELECT uc.UserNo,uc.CourseId,uc.CreateTime FROM dbo.KC_UserCourse(NOLOCK) uc 
WHERE uc.CourseTypeId=23 AND uc.CourseId = 4228 AND uc.IsDel = 0 AND uc.IsSignOut = 0) AS uc
JOIN	dbo.US_UserCenter(NOLOCK) u ON uc.UserNo = u.UserNo AND u.IsDel = 0 
JOIN	dbo.US_UserBasicInfo(NOLOCK) ub ON ub.UserNo = u.UserNo AND ub.IsDel = 0
JOIN	dbo.KC_CourseScoreItem(NOLOCK) csi ON csi.CourseMOOC_Id = uc.CourseId AND csi.IsDel = 0
LEFT JOIN dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucsi ON ucsi.CourseScoreItem_Id=csi.Id AND ucsi.JoinScoreItem_Id=0 AND ucsi.IsDel=0 AND ucsi.UserNo=u.UserNo
WHERE	csi.Id = 1123

SELECT * FROM dbo.KC_UserCourseScoreItemRecord WHERE CourseScoreItem_Id=1126

SELECT * FROM dbo.KC_UserCourseScoreItemRecord 
WHERE UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903' AND CourseScoreItem_Id=1126

SELECT * FROM dbo.KC_UserCourseScoreItemRecord WHERE JoinScoreItem_Id=0 AND CourseScoreItem_Id=1123
SELECT * FROM dbo.KC_CourseScoreItem WHERE CourseMOOC_Id=4228

SELECT cs.*,js.Id AS JoinScoreItem_Id FROM KC_JoinScoreItem(NOLOCK) js
JOIN dbo.KC_CourseScoreItem(NOLOCK) cs ON js.CourseScoreItem_Id=cs.Id
WHERE js.SourceId=2639 AND js.IsDel=0 AND cs.IsDel=0 AND cs.ScoreItemType=4069


SELECT * FROM [dbo].[KC_UserCourseScoreItemRecord] AS UCSI 
WHERE UCSI.IsDel=0 AND UCSI.CourseScoreItem_Id=1123 
AND UCSI.UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903' AND JoinScoreItem_Id=8


SELECT U.UserNo,U.NickName,UCS.[IsPublished],UCS.[FinalScore] AS CourseScore,ROW_NUMBER() OVER(ORDER BY UCS.IsPublished ,UCS.FinalScore DESC,UC.CreateTime)AS RowNumber,
(SELECT SUM(FinalScore) 
FROM [dbo].[KC_UserCourseScoreItemRecord](NOLOCK) AS USI 
INNER JOIN [dbo].[KC_CourseScoreItem](NOLOCK) AS CSI ON CSI.Id=USI.CourseScoreItem_Id 
WHERE USI.UserNo=UC.UserNo AND USI.IsDel=0 AND CSI.CourseMOOC_Id=4228  AND CSI.IsJoinFinalScore=1 AND USI.JoinScoreItem_Id=0) AS ScoreItemValue
FROM 
(SELECT UC.UserNo,UC.CourseId,UC.CreateTime  FROM  [dbo].[KC_UserCourse](NOLOCK) AS UC 
INNER JOIN [dbo].[US_UserCenter](NOLOCK) AS U ON U.UserNo=UC.UserNo
INNER JOIN [dbo].[US_UserBasicInfo](NOLOCK) AS UB ON UB.[UserNo]=UC.[UserNo]  
WHERE UC.CourseTypeId=23 AND UC.CourseId=4228 AND UC.IsDel=0 AND UC.IsSignOut=0 ) AS UC
INNER JOIN [dbo].[US_UserCenter](NOLOCK) AS U ON U.UserNo=UC.UserNo 
LEFT JOIN [dbo].[KC_UserCourseScore](NOLOCK) AS UCS ON UCS.CourseMOOC_Id=UC.CourseId AND UCS.[UserNo]=UC.UserNo 


SELECT * FROM dbo.KC_UserCourseScore WHERE UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903'

SELECT COUNT(1) FROM dbo.KC_UserCourseScoreItemRecord(NOLOCK) 
WHERE CourseScoreItem_Id=1123 AND UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903' AND JoinScoreItem_Id=0


SELECT * FROM dbo.KC_UserUnitTestHomeWork WHERE UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903'


-- 教师查看学生作业列表
SELECT	uuh.Id,uuh.UnitTestHomeWork_Id,uuh.UserNo,uc.NickName,uuh.CreateTime,uh.CorrectWay,
uuh.Grade,uh.EndSubTime,uh.GradePublishTime,uh.MutualStartTime,uh.MutualEndTime,uh.SelfEndTime,uh.MutualCommentNum,
(
SELECT COUNT(1) FROM dbo.KC_UserUnitTestHomeWorkMutualComment(NOLOCK) mutal 
WHERE mutal.UserNo=uuh.UserNo AND mutal.IsDel=0 AND mutal.UserUnitTestHomeWork_Id<>uuh.Id
) AS CurrentUserCommentQty,
(SELECT MAX(CreateTime) FROM [dbo].[KC_UserUnitTestHomeWorkMutualComment](NOLOCK) AS UMC 
WHERE UMC.RoleName='教师批改' AND UMC.UserUnitTestHomeWork_Id=uuh.Id )AS TeacherSubTime,
ROW_NUMBER()OVER(ORDER BY uuh.CreateTime DESC) AS RowNumber 
FROM	dbo.KC_UserUnitTestHomeWork(NOLOCK) uuh
JOIN	dbo.KC_UnitTestHomeWork(NOLOCK) uh ON uuh.UnitTestHomeWork_Id=uh.Id
JOIN	dbo.US_UserCenter(NOLOCK) uc ON uuh.UserNo = uc.UserNo
JOIN	dbo.US_UserBasicInfo(NOLOCK) ub ON ub.UserNo=uc.UserNo AND ub.IsDel=0	
WHERE	 uuh.IsDel=0 AND uh.IsDel=0   AND uh.Id =2078 


SELECT	 ROW_NUMBER()OVER(ORDER BY tt.CreateTime DESC ) AS RowNumber,*
FROM 
(
SELECT	fp.Id,fp.Title,fp.UserNo,fp.Content,fp.IsAnonymous,fp.CreateTime,uc.NickName,fp.PosterRoleName,
    (SELECT COUNT(1) FROM dbo.KC_ForumPostLoveRecord(NOLOCK) love WHERE love.ForumPosts_Id=fp.Id AND love.IsDel=0 AND love.LoveType=0) AS TopCount,
    (SELECT COUNT(1) FROM dbo.KC_ForumPostLoveRecord(NOLOCK) love WHERE love.ForumPosts_Id=fp.Id AND love.IsDel=0 AND love.LoveType=1) AS TreadCount,
    (SELECT COUNT(1) FROM dbo.KC_ForumPostLoveRecord(NOLOCK) love WHERE love.LoveType=0 AND love.UserNo='8d837fec-e466-48e6-ad2d-8586d82e873d' AND love.ForumPosts_Id=fp.Id AND love.IsDel=0) AS IsTop,
    (SELECT COUNT(1) FROM dbo.KC_ForumPostLoveRecord(NOLOCK) love WHERE love.LoveType=1 AND love.UserNo='8d837fec-e466-48e6-ad2d-8586d82e873d' AND love.ForumPosts_Id=fp.Id AND love.IsDel=0) AS IsTread,
    (SELECT COUNT(1) FROM dbo.KC_ForumSilence(NOLOCK) fs WHERE fs.CourseMOOC_Id=4228 AND fs.UserNo=fp.UserNo AND fs.IsSilence=1 AND fs.IsDel=0) AS IsSilence,
    csi.Score AS ScoreItemScore,csi.Id AS ScoreItemId,
    (
		SELECT TOP 1 ucr.Score FROM dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucr 
		WHERE ucr.CourseScoreItem_Id=csi.Id AND ucr.UserNo=fp.UserNo AND ucr.IsDel=0
		ORDER BY ucr.CreateTime DESC
	) AS Score
FROM	dbo.KC_ForumPosts(NOLOCK) fp
JOIN	dbo.US_UserCenter(NOLOCK) uc ON fp.UserNo = uc.UserNo 
LEFT JOIN dbo.KC_JoinScoreItem(NOLOCK) js ON js.SourceId=fp.ParentId AND js.IsDel=0
LEFT JOIN	dbo.KC_CourseScoreItem(NOLOCK) csi ON csi.Id=js.CourseScoreItem_Id AND csi.CourseMOOC_Id=4228 AND csi.IsDel=0
WHERE	 fp.ParentId =2639 AND fp.IsDel = 0 AND fp.PostState=4062 
) AS tt

SELECT * FROM dbo.KC_UserCourseScoreItemRecord WHERE Id=196
DELETE FROM dbo.KC_UserCourseScoreItemRecord WHERE Id=200


SELECT * FROM [dbo].[KC_UserCourseScoreItemRecord](NOLOCK) AS UCSI  WHERE UCSI.Id=202 AND UCSI.IsDel=0 

SELECT * FROM dbo.KC_UserCourseScoreItemRecord WHERE CourseScoreItem_Id=1123 AND IsDel=0


 SELECT  ucsi.Id,csi.Id AS ScoreItemId,u.NickName AS StudentName,u.UserNo,csi.ScoreItemType,
(
	SELECT AVG(ucsir.Score) FROM dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucsir 
	WHERE ucsir.CourseScoreItem_Id=csi.Id AND ucsir.UserNo=u.UserNo AND ucsir.IsDel=0
) AS AvgScore,ucsi.FinalScore,ucsi.IsPublished,ROW_NUMBER() OVER(ORDER BY uc.CreateTime DESC)AS RowNumber
FROM	(SELECT uc.UserNo,uc.CourseId,uc.CreateTime FROM dbo.KC_UserCourse(NOLOCK) uc 
WHERE uc.CourseTypeId=23 AND uc.CourseId = 4228 AND uc.IsDel = 0 AND uc.IsSignOut = 0) AS uc
JOIN	dbo.US_UserCenter(NOLOCK) u ON uc.UserNo = u.UserNo AND u.IsDel = 0 
JOIN	dbo.US_UserBasicInfo(NOLOCK) ub ON ub.UserNo = u.UserNo AND ub.IsDel = 0
JOIN	dbo.KC_CourseScoreItem(NOLOCK) csi ON csi.CourseMOOC_Id = uc.CourseId AND csi.IsDel = 0
LEFT JOIN dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucsi ON ucsi.CourseScoreItem_Id=csi.Id AND ucsi.JoinScoreItem_Id=0  AND ucsi.UserNo=u.UserNo AND ucsi.IsDel=0
WHERE	csi.Id = 1123  

-- 学生端成绩项信息
SELECT UCS.Id,UCS.FinalScore,UCS.IsPublished 
FROM [dbo].[KC_UserCourseScore](NOLOCK) AS UCS 
WHERE UCS.CourseMOOC_Id=4228 AND UCS.[UserNo]='59CED3B3-20D8-4D88-BB68-FC155AC4E903' AND UCS.IsDel=0  AND UCS.IsPublished=1


SELECT CSI.Id,CSI.Name AS ScoreItemName,CSI.Score,UCSI.FinalScore
FROM [dbo].[KC_CourseScoreItem] AS CSI 
LEFT JOIN [dbo].[KC_UserCourseScoreItemRecord] AS UCSI ON UCSI.CourseScoreItem_Id=CSI.Id AND UCSI.IsDel=0 
	AND UCSI.IsPublished=1 AND UCSI.UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903'
WHERE CSI.CourseMOOC_Id=4228 AND CSI.IsDel=0 AND CSI.IsPublished=1


SELECT ucs.CourseScoreItem_Id AS CourseScoreItemId,cs.ScoreItemType,cs.Name,cs.Score,ucs.FinalScore,ucs.IsPublished
FROM  dbo.KC_CourseScoreItem(NOLOCK) cs
JOIN dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucs ON ucs.CourseScoreItem_Id=cs.Id AND ucs.IsDel=0
WHERE cs.CourseMOOC_Id=4228 AND cs.IsDel=0 AND cs.IsPublished=1 AND ucs.JoinScoreItem_Id=0 AND ucs.UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903'

SELECT * FROM dbo.KC_CourseScoreItem WHERE CourseMOOC_Id=4228 AND IsDel=0

WITH CourseScoreItem AS 
(
	SELECT	ucs.CourseScoreItem_Id,js.SourceId,ucs.FinalScore,ucs.IsPublished
	FROM	dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucs
	JOIN	dbo.KC_JoinScoreItem(NOLOCK) js ON js.Id=ucs.JoinScoreItem_Id AND js.IsDel=0
	WHERE   ucs.UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903' AND ucs.IsDel=0 
)
-- 测验
SELECT	cs.Name AS ScoreItemName,cs.Score,ucs.FinalScore,ucs.IsPublished,0 AS ScoreType
FROM	dbo.KC_CourseScoreItem(NOLOCK) cs
JOIN	dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucs ON ucs.CourseScoreItem_Id=cs.Id AND ucs.IsDel=0
WHERE cs.CourseMOOC_Id=4228 AND cs.IsDel=0 AND cs.IsPublished=1 AND ucs.JoinScoreItem_Id=0 AND cs.ScoreItemType=4066
UNION ALL
SELECT utp.PaperName AS ScoreItemName,utp.Score,cs.FinalScore,cs.IsPublished,1 AS ScoreType
FROM  CourseScoreItem AS cs
JOIN  dbo.KC_UnitTestPaper(NOLOCK) AS utp ON utp.Id=cs.SourceId
WHERE cs.CourseScoreItem_Id=(SELECT Id FROM dbo.KC_CourseScoreItem WHERE CourseMOOC_Id=4228 AND IsDel=0 AND ScoreItemType=4066) AND utp.IsDel=0
UNION ALL
-- 作业
SELECT cs.Name AS ScoreItemName,cs.Score,ucs.FinalScore,ucs.IsPublished,0 AS ScoreType
FROM  dbo.KC_CourseScoreItem(NOLOCK) cs
JOIN dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucs ON ucs.CourseScoreItem_Id=cs.Id AND ucs.IsDel=0
WHERE cs.CourseMOOC_Id=4228 AND cs.IsDel=0 AND cs.IsPublished=1 AND ucs.JoinScoreItem_Id=0 AND cs.ScoreItemType=4067
UNION ALL
SELECT utp.WorkName AS ScoreItemName,utp.Score,cs.FinalScore,cs.IsPublished,1 AS ScoreType
FROM  CourseScoreItem AS cs
LEFT JOIN  dbo.KC_UnitTestHomeWork(NOLOCK) AS utp ON utp.Id=cs.SourceId
WHERE cs.CourseScoreItem_Id=(SELECT Id FROM dbo.KC_CourseScoreItem WHERE CourseMOOC_Id=4228 AND IsDel=0 AND ScoreItemType=4067) AND utp.IsDel=0
UNION ALL
-- 考试
SELECT cs.Name AS ScoreItemName,cs.Score,ucs.FinalScore,ucs.IsPublished,0 AS ScoreType
FROM  dbo.KC_CourseScoreItem(NOLOCK) cs
JOIN dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucs ON ucs.CourseScoreItem_Id=cs.Id AND ucs.IsDel=0
WHERE cs.CourseMOOC_Id=4228 AND cs.IsDel=0 AND cs.IsPublished=1 AND ucs.JoinScoreItem_Id=0 AND cs.ScoreItemType=4068
UNION ALL
SELECT utp.Title AS ScoreItemName,utp.TotalScore AS Score,cs.FinalScore,cs.IsPublished,1 AS ScoreType
FROM  CourseScoreItem AS cs
LEFT JOIN  dbo.KC_ExamPaper(NOLOCK) AS utp ON utp.Id=cs.SourceId
WHERE cs.CourseScoreItem_Id=(SELECT Id FROM dbo.KC_CourseScoreItem WHERE CourseMOOC_Id=4228 AND IsDel=0 AND ScoreItemType=4068) AND utp.IsDel=0
UNION ALL
-- 讨论区
SELECT cs.Name AS ScoreItemName,cs.Score,ucs.FinalScore,ucs.IsPublished,0 AS ScoreType
FROM  dbo.KC_CourseScoreItem(NOLOCK) cs
JOIN dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucs ON ucs.CourseScoreItem_Id=cs.Id AND ucs.IsDel=0
WHERE cs.CourseMOOC_Id=4228 AND cs.IsDel=0 AND cs.IsPublished=1 AND ucs.JoinScoreItem_Id=0 AND cs.ScoreItemType=4069
UNION ALL
SELECT utp.Title AS ScoreItemName,c.Score,cs.FinalScore,cs.IsPublished,1 AS ScoreType
FROM  CourseScoreItem AS cs
JOIN  dbo.KC_CourseScoreItem(NOLOCK) c ON cs.CourseScoreItem_Id=c.Id AND c.ScoreItemType=4069
LEFT JOIN  dbo.KC_ForumPosts(NOLOCK) AS utp ON utp.Id=cs.SourceId
WHERE cs.CourseScoreItem_Id=(SELECT Id FROM dbo.KC_CourseScoreItem WHERE CourseMOOC_Id=4228 AND IsDel=0 AND ScoreItemType=4069) AND utp.IsDel=0




SELECT * FROM dbo.KC_UserCourseScoreItemRecord WHERE UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903' AND CourseScoreItem_Id=1123
SELECT Id FROM dbo.KC_CourseScoreItem WHERE CourseMOOC_Id=4228 AND IsDel=0 AND ScoreItemType=4066 AND IsPublished=1

SELECT * 
FROM dbo.KC_UserCourseScoreItemRecord(NOLOCK) us
JOIN  dbo.KC_JoinScoreItem(NOLOCK) js ON js.Id=us.JoinScoreItem_Id AND js.IsDel=0
LEFT JOIN dbo.KC_UnitTestPaper(NOLOCK) utp ON utp.Id =js.SourceId
WHERE us.CourseScoreItem_Id=1123 AND us.UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903'



SELECT * FROM dbo.KC_CourseScoreItem WHERE CourseMOOC_Id=4228
SELECT * FROM dbo.US_Dictionary


SELECT * FROM dbo.KC_UserCourseScoreItemRecord WHERE CourseScoreItem_Id=1123 
SELECT * FROM dbo.KC_UserCourseScoreItemLog WHERE CourseScoreItem_Id=1123


SELECT CM.Id AS CourseId,CM.CourseName,CM.CourseCover,I.LOGO AS SchoolLogo,I.SquareLogo,I.Name AS SchoolName,
	I.OrgnizationCode,CM.TeacherNo AS DutyUserNo,I.UserNo AS SchoolUserNo,CMD.StartTime,CM.IsPublished,CM.CurrentStatus,
(SELECT T.TeacherCode+','+T.Name+','+LTRIM( T.TeacherNo)+'|' 
	FROM [dbo].[KC_TeacherCourse](NOLOCK) AS TC INNER JOIN [dbo].[KC_Teacher](NOLOCK) AS T ON T.TeacherNo=TC.TeacherNo 
	WHERE TC.Course_Id=CM.Id AND TC.CourseTypeId=23 FOR XML PATH('')) AS TeacherInfo
FROM [dbo].[KC_CourseMOOC](NOLOCK) AS CM
INNER JOIN [dbo].[KC_CourseMOOCDetail](NOLOCK) AS CMD ON CMD.CourseMOOC_Id=CM.Id
INNER JOIN [dbo].[KC_Institution](NOLOCK) AS I ON I.Id=CM.Institution_Id
WHERE CM.Id=1123


SELECT m.Id as ModuleId, m.Name as ModuleName,m.IsMust, m.VirtualPath,m.StudentLinkPath,m.AssistantLinkPath,m.IconPath,m.Color,
		mr.Sort,m.MenuNo,mr.IsShowForStudents,m.ParentId  
FROM KC_CourseModuleRelevance(NOLOCK) mr 
JOIN KC_CourseMOOCModule(NOLOCK) m on  mr.CourseMOOCModule_Id=m.Id --AND m.ParentId=0
WHERE mr.CourseMOOC_Id=1123 and m.IsDel=0 and mr.IsDel=0 
ORDER by mr.Sort 


SELECT * FROM dbo.KC_CourseCatalog WHERE Id=265


SELECT CI.CourseId,CI.CourseType, I.Name AS InstitutionName,I.OrgnizationCode AS InstitutionCode,  
		CI.CourseName, CI.CourseCover,  CI.CourseIntro, CI.StudyNum, CI.CourseOnLineTime, CI.MoocEndTime, 
		CI.MoocTotalCycle, CI.MoocProcessCycle, CI.TeachersInfo,ROW_NUMBER() OVER(ORDER BY  CI.Id ) AS RowNumber
FROM [dbo].[KC_CourseIndex] (NOLOCK) AS CI 
INNER JOIN  [dbo].[KC_CourseCategory] (NOLOCK) AS C ON C.Id=CI.CourseCatalogId
INNER JOIN [dbo].[KC_Institution] (NOLOCK) AS I ON I.Id=CI.Institution_Id 
                                

SELECT * FROM dbo.KC_CourseIndex WHERE CourseName LIKE '%720%'
SELECT * FROM dbo.KC_CourseMOOC WHERE CourseName LIKE '%720%'

SELECT CM.Id,CM.Category_Id,CM.CourseType,CM.CourseCover,CM.CourseName,CM.Price,CMD.Summary,CMD.StartTime,CMD.EndTime,
		I.Name AS InstitutionName,I.OrgnizationCode,I.Id AS Institution_Id,CMD.IsRecommand,CM.IsDel,CM.IsPublished,CM.OpenForm,CM.CurrentStatus,CM.IsFiled,
(SELECT T.TeacherCode+','+T.Name+'|' FROM [dbo].[KC_TeacherCourse](NOLOCK) AS TC 
INNER JOIN [dbo].[KC_Teacher](NOLOCK) AS T ON T.TeacherNo=TC.TeacherNo 
WHERE TC.Course_Id=CM.Id AND TC.CourseTypeId=23 FOR XML PATH('')) AS TeacherInfo,(CMD.StudyNumber+
(SELECT COUNT(1) FROM [dbo].[KC_UserCourse](NOLOCK) WHERE [CourseId]=CM.Id AND [IsDel]=0 AND [IsSignOut]=0 AND [CourseTypeId]=23 )) AS StudyNum,
(SELECT COUNT(1) FROM dbo.KC_CourseBrowseRecord(NOLOCK) cb WHERE cb.CourseId=CM.Id AND cb.IsDel=0 AND cb.CourseType=23) AS BrowseNum,
(SELECT COUNT(1) FROM [dbo].[KC_UserFavorite] AS UF WHERE UF.IsDel=0 AND UF.CategoryId=2052 AND UF.ReferenceId=CM.Id) AS FavoriteNum                                
FROM [dbo].[KC_CourseMOOC](NOLOCK) AS CM
INNER JOIN [dbo].[KC_Institution](NOLOCK) AS I ON I.Id=CM.Institution_Id AND I.IsDel=0 AND I.IsOpen=1
INNER JOIN [dbo].[KC_CourseMOOCDetail](NOLOCK) AS CMD ON  CMD.CourseMOOC_Id=CM.Id
WHERE CM.IsDel=0 AND CM.IsPublished=1 AND CM.IsFiled=0 AND CM.CurrentStatus=2045
                                 

SELECT * FROM [dbo].[KC_CourseIndex] WHERE [CourseNo]='chinesemooc_mooc_4238'

SELECT *,ROW_NUMBER()OVER(ORDER BY t.Id DESC) AS RowNumber
FROM (
	SELECT Id,Question,Answer,CreateTime FROM dbo.KC_HelpCenter(NOLOCK) 
	WHERE IsDel=0 
) AS t


SELECT * FROM dbo.KC_Institution
SELECT * FROM dbo.KC_Partners

SELECT Id,Question,Answer,CreateTime FROM dbo.KC_HelpCenter WHERE Id=0 AND IsDel=0


UPDATE dbo.KC_HelpCenter SET IsDel=1,UpdateTime=GETDATE() WHERE Id=0

UPDATE dbo.KC_HelpCenter SET Question='',Answer='',UpdateTime=GETDATE() WHERE Id=0


INSERT dbo.KC_HelpCenter(Question,Answer,CategoryId)
VALUES(@Question,@Answer,@CategoryId)

SELECT * FROM dbo.US_UserCenter
SELECT * FROM dbo.KC_HelpCenter
DELETE FROM dbo.KC_HelpCenter WHERE Id=5


SELECT	ucsi.Id,ucsi.UserNo,ucsi.Score,ucsi.FinalScore,ucsi.IsPublished,ucsi.JoinScoreItem_Id,
ut.PaperName AS SourceTitle,ucsi.JoinScoreItem_Id AS JoinScoreItemId,
(
	SELECT MAX(Grade) 
	FROM dbo.KC_UserUnitTestPaperRecord(NOLOCK) utr WHERE utr.UserNo=ucsi.UserNo AND utr.UnitTestPaper_Id =ut.Id AND IsDel=0
) AS UserGrade
FROM	dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucsi
JOIN	dbo.KC_JoinScoreItem(NOLOCK) js ON ucsi.JoinScoreItem_Id=js.Id AND js.IsDel=0
JOIN	dbo.KC_UnitTestPaper(NOLOCK) ut ON js.SourceId=ut.Id AND ut.IsDel=0
WHERE ucsi.UserNo='d8762ea7-e007-4db3-94fb-fa659ba11596' AND ucsi.CourseScoreItem_Id=1132 AND ucsi.IsDel=0


SELECT  ucsi.Id,csi.Id AS ScoreItemId,u.NickName AS StudentName,u.UserNo,csi.ScoreItemType,
(
	SELECT AVG(ucsir.Score) FROM dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucsir 
	WHERE ucsir.CourseScoreItem_Id=1132 AND ucsir.UserNo='d8762ea7-e007-4db3-94fb-fa659ba11596' AND ucsir.IsDel=0 AND ucsir.JoinScoreItem_Id<>0
) AS AvgScore,ucsi.FinalScore,ucsi.IsPublished,ROW_NUMBER() OVER(ORDER BY uc.CreateTime DESC)AS RowNumber
FROM	(SELECT uc.UserNo,uc.CourseId,uc.CreateTime FROM dbo.KC_UserCourse(NOLOCK) uc 
WHERE uc.CourseTypeId=23 AND uc.CourseId = 4237 AND uc.IsDel = 0 AND uc.IsSignOut = 0) AS uc
JOIN	dbo.US_UserCenter(NOLOCK) u ON uc.UserNo = u.UserNo AND u.IsDel = 0 
JOIN	dbo.US_UserBasicInfo(NOLOCK) ub ON ub.UserNo = u.UserNo AND ub.IsDel = 0
JOIN	dbo.KC_CourseScoreItem(NOLOCK) csi ON csi.CourseMOOC_Id = uc.CourseId AND csi.IsDel = 0
LEFT JOIN dbo.KC_UserCourseScoreItemRecord(NOLOCK) ucsi ON ucsi.CourseScoreItem_Id=csi.Id AND ucsi.JoinScoreItem_Id=0  AND ucsi.UserNo=u.UserNo AND ucsi.IsDel=0
WHERE	csi.Id = 1132  AND u.UserNo='d8762ea7-e007-4db3-94fb-fa659ba11596'


SELECT * FROM dbo.KC_FeedBack
SELECT * FROM dbo.KC_Partners
SELECT * FROM dbo.KC_Institution

SELECT * FROM dbo.KC_CourseMOOC

(SELECT  t.TeacherCode+','+t.Name+'|' 
FROM dbo.KC_TeacherCourse AS tc INNER JOIN dbo.KC_Teacher AS t ON tc.TeacherNo = t.TeacherNo 
WHERE Course_Id=c.Id  AND tc.CourseTypeId={2} FOR XML PATH('')) AS Teachers

SELECT *,ROW_NUMBER()OVER(ORDER BY t.CreateTime DESC)
FROM 
(
	SELECT cm.Id AS CourseId,cm.CourseName,cm.CourseCover,cm.CourseNo,cm.Price,cd.IsRecommand,
	cm.IsPublished,cm.IsFiled,cm.CurrentStatus,cc.CategoryName,i.Name AS InstitutionName,cm.CreateTime,
	t.Name AS TeacherName,
	(
		SELECT  t.Name+'，' 
		FROM dbo.KC_TeacherCourse AS tc INNER JOIN dbo.KC_Teacher AS t ON tc.TeacherNo = t.TeacherNo 
		WHERE Course_Id=cm.Id  AND tc.CourseTypeId=23 FOR XML PATH('')
	) AS MasterTeachers
	FROM	dbo.KC_CourseMOOC(NOLOCK) cm
	JOIN	dbo.KC_CourseMOOCDetail(NOLOCK) cd ON cd.CourseMOOC_Id=cm.Id AND cd.IsDel=0
	JOIN	dbo.KC_CourseCategory(NOLOCK) cc ON cm.Category_Id=cc.Id AND cc.IsDel=0
	JOIN	dbo.KC_Institution(NOLOCK) i ON cm.Institution_Id=i.Id AND i.IsDel=0 
	JOIN	dbo.KC_Teacher(NOLOCK) t ON cm.TeacherNo=t.TeacherNo AND t.IsDel=0
	WHERE cm.IsDel=0 AND cm.CourseName LIKE '%%' AND cm.CurrentStatus=0
)AS t


SELECT COUNT(1)
FROM	dbo.KC_CourseMOOC(NOLOCK) cm
JOIN	dbo.KC_CourseMOOCDetail(NOLOCK) cd ON cd.CourseMOOC_Id=cm.Id AND cd.IsDel=0
JOIN	dbo.KC_CourseCategory(NOLOCK) cc ON cm.Category_Id=cc.Id AND cc.IsDel=0
JOIN	dbo.KC_Institution(NOLOCK) i ON cm.Institution_Id=i.Id AND i.IsDel=0 
JOIN	dbo.KC_Teacher(NOLOCK) t ON cm.TeacherNo=t.TeacherNo AND t.IsDel=0
WHERE cm.IsDel=0 AND cm.CourseName LIKE '%%' AND cm.CurrentStatus=0


SELECT	Id,CategoryName,ParentId,Sort,CreateTime
FROM	dbo.KC_CourseCategory(NOLOCK)
WHERE	IsDel=0

SELECT * FROM dbo.US_UserCenter WHERE UserNo='1BD5B668-10C1-46CC-AA2D-37897A51D041'

SELECT *,ROW_NUMBER()OVER(ORDER BY t.CreateTime DESC) AS RowNumber
FROM
(
	SELECT t.Id,t.TeacherNo,t.Name AS TeacherName,t.HeadPic,i.Name AS InstitutionName,t.Introduction,
	   t.TeacherPhone,t.Profession,t.IfThisInstitution,t.CreateTime
	FROM dbo.KC_Teacher(NOLOCK) t
	JOIN dbo.KC_Institution(NOLOCK) i ON t.InstitutionId=i.Id AND i.IsDel=0
	WHERE t.IsDel=0
) AS t


SELECT COUNT(1)
FROM dbo.KC_Teacher(NOLOCK) t
JOIN dbo.KC_Institution(NOLOCK) i ON t.InstitutionId=i.Id AND i.IsDel=0
WHERE t.IsDel=0

SELECT *,ROW_NUMBER()OVER(ORDER BY t.CreateTime DESC) AS RowNumber
FROM
(
	SELECT u.Id,u.UserNo,u.NickName,u.StudentID,u.Email,u.Mobile,u.UserStatus,u.CreateTime,u.UpdateTime,
	u.UserFriendTime,ub.UserPic,ub.RealName
	FROM dbo.US_UserCenter(NOLOCK) u
	JOIN CmmoocUserCenter.dbo.US_UserBasicInfo(NOLOCK) ub ON ub.UserNo=u.UserNo
	WHERE u.IsDel=0 AND ub.IsDel=0
) AS t

SELECT COUNT(1)
FROM dbo.US_UserCenter(NOLOCK) u
JOIN CmmoocUserCenter.dbo.US_UserBasicInfo(NOLOCK) ub ON ub.UserNo=u.UserNo
WHERE u.IsDel=0 AND ub.IsDel=0

SELECT * FROM dbo.US_Dictionary WHERE TypeId=18
SELECT * FROM dbo.KC_ShowCase
SELECT * FROM dbo.KC_ShowCaseLibrary WHERE CourseMOOC_Id=0

SELECT * FROM dbo.KC_Course C WHERE IsDel=0 AND c.CurrentStatus=0

SELECT Id,Name,TypeId,Sort 
FROM dbo.US_Dictionary(NOLOCK) WHERE IsDel=0 AND TypeId=0



-------------我的作品（学生端）-----------
SELECT TOP 3 sc.Id,sc.UserNo,sc.ShowCaseCover,sc.Name AS WorkName,sc.IsOpen,sc.IsLock,sc.CreateTime,
	   mw.Name AS CategoryName,u.NickName 
FROM dbo.KC_ShowCaseLibrary(NOLOCK) sc
JOIN KC_MyWorkCategory(NOLOCK) mw ON sc.CategoryId=mw.Id AND mw.IsDel=0
JOIN dbo.US_UserCenter(NOLOCK) u ON sc.UserNo=u.UserNo
WHERE sc.IsDel=0 AND sc.UserNo='C0C40C1C-254E-47D0-B9F9-D36F7841C175' AND sc.CourseMOOC_Id=0 AND sc.ShowCaseModule=4059
ORDER BY sc.CreateTime DESC



SELECT *,ROW_NUMBER()OVER(ORDER BY t.CreateTime DESC) AS RowNumber 
FROM
(
	SELECT sc.Id,sc.UserNo,sc.ShowCaseCover,sc.Name AS WorkName,sc.IsOpen,sc.IsLock,sc.CreateTime,
	   mw.Name AS CategoryName,c.CourseName,i.Name AS InstitutionName,u.NickName,
	   (SELECT COUNT(1) FROM dbo.KC_ShowCaseLibraryLoveRecord(NOLOCK) AS F WHERE F.ShowCaseLibrary_Id=sc.Id AND F.IsDel=0)AS LikeCount  
	FROM dbo.KC_ShowCaseLibrary(NOLOCK) sc
	JOIN dbo.US_UserCenter(NOLOCK) u ON sc.UserNo=u.UserNo
	LEFT JOIN KC_MyWorkCategory(NOLOCK) mw ON sc.CategoryId=mw.Id AND mw.IsDel=0
	LEFT JOIN dbo.KC_CourseMOOC(NOLOCK) c ON sc.CourseMOOC_Id=c.Id AND c.IsDel=0
	LEFT JOIN dbo.KC_Institution(NOLOCK) i ON c.Institution_Id=u.Id AND i.IsDel=0
	WHERE sc.IsDel=0 AND sc.ShowCaseModule=4059 AND sc.IsOpen=1 AND sc.IsLock=0
) AS t


SELECT * FROM dbo.KC_ShowCase WHERE ShowCaseLibrary_Id=3099
SELECT * FROM dbo.KC_ShowCaseLibrary WHERE Id=3099
SELECT * FROM dbo.KC_ShowCaseLibrary WHERE UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903'

SELECT sc.Id,sc.Name,sc.ShowCaseCover,c.CourseName
FROM dbo.KC_ShowCaseLibrary(NOLOCK) sc
LEFT JOIN dbo.KC_CourseMOOC(NOLOCK) c ON sc.CourseMOOC_Id=c.Id AND c.IsDel=0 AND c.IsFiled=0 
WHERE sc.UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903' AND sc.IsDel=0 AND sc.ShowCaseModule=4059
ORDER BY sc.CreateTime DESC

SELECT * FROM dbo.US_UserCenter WHERE UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903'

SELECT *,ROW_NUMBER()OVER(ORDER BY t.ShowCaseModule ASC,t.CreateTime DESC)AS RowNumber
FROM 
(
	SELECT	sc.Id,sc.UserNo,sc.ShowCaseCover,sc.Name AS WorkName,sc.CategoryId,sc.IsOpen,sc.IsLock,
			mw.Name AS CategoryName,cm.CourseName,i.Name AS InstitutionName,i.CreateTime,u.NickName,sc.ShowCaseModule
	FROM	dbo.KC_ShowCaseLibrary(NOLOCK) sc
	JOIN	dbo.US_UserCenter(NOLOCK) u ON sc.UserNo=u.UserNo AND u.IsDel=0
	LEFT JOIN dbo.KC_MyWorkCategory(NOLOCK) mw ON sc.CategoryId=mw.Id AND mw.IsDel=0
	LEFT JOIN dbo.KC_CourseMOOC(NOLOCK) cm ON sc.CourseMOOC_Id=cm.Id AND cm.IsDel=0
	LEFT JOIN dbo.KC_Institution(NOLOCK) i ON i.Id=cm.Institution_Id AND i.IsDel=0
	WHERE	sc.IsDel=0 AND sc.IsLock=1 AND sc.UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903'
) AS t

SELECT	COUNT(1)
FROM	dbo.KC_ShowCaseLibrary(NOLOCK) sc
JOIN	dbo.US_UserCenter(NOLOCK) u ON sc.UserNo=u.UserNo AND u.IsDel=0
LEFT JOIN dbo.KC_MyWorkCategory(NOLOCK) mw ON sc.CategoryId=mw.Id AND mw.IsDel=0
LEFT JOIN dbo.KC_CourseMOOC(NOLOCK) cm ON sc.CourseMOOC_Id=cm.Id AND cm.IsDel=0
LEFT JOIN dbo.KC_Institution(NOLOCK) i ON i.Id=cm.Institution_Id AND i.IsDel=0
WHERE	sc.IsDel=0 AND sc.IsLock=1 AND sc.UserNo='59CED3B3-20D8-4D88-BB68-FC155AC4E903'


SELECT * FROM dbo.US_UserCenter WHERE StudentID IS NOT NULL AND UserStatus <>17

SELECT COUNT(1) FROM dbo.KC_UserCourse(NOLOCK) 
WHERE CourseId=1127 AND CourseTypeId=22 AND IsSignOut=0 AND IsDel=0

SELECT * FROM dbo.KC_FeedBack

SELECT	c.Id,c.CourseName,c.CourseCover,i.Name AS InstitutionName,c.CurrentStatus,c.IsPublished,
		cd.ShortVideoUrl,cd.Summary,cd.Introduction,cd.IsRecommand,cd.StudyUrl,cc.CategoryName,c.CreateTime,c.UpdateTime,
		(
			SELECT COUNT(1) FROM dbo.KC_UserCourse(NOLOCK) 
			WHERE CourseId=c.Id AND CourseTypeId=22 AND IsSignOut=0 AND IsDel=0
		)+cd.StudyNumber AS  StudyNumber
FROM dbo.KC_CourseMOOC(NOLOCK) c 
JOIN dbo.KC_Institution(NOLOCK) i ON c.Institution_Id=i.Id AND i.IsDel=0
JOIN dbo.KC_CourseMOOCDetail(NOLOCK) cd ON cd.CourseMOOC_Id=c.Id AND cd.IsDel=0
JOIN dbo.KC_CourseCategory(NOLOCK) cc ON c.Category_Id=cc.Id AND cc.IsDel=0
WHERE c.Id=1123


SELECT * FROM dbo.KC_CourseDetail WHERE ShortVideoUrl IS NOT NULL AND IsDel=0 

SELECT * FROM dbo.KC_CourseMOOC WHERE Id=2234
SELECT * FROM dbo.KC_Course WHERE Id=2234

SELECT * FROM dbo.KC_Institution 

SELECT * FROM dbo.KC_CourseMOOCDetail WHERE ShortVideoUrl IS NOT NULL

SELECT Id,CatalogueNo,Name,Institution_Id,CourseTypeId,Course_Id,ParentId 
FROM dbo.KC_ResourceCatalogue(NOLOCK) WHERE Course_Id=@Course_Id AND CourseTypeId=@CourseTypeId

SELECT  * FROM dbo.US_UserCenter

UPDATE dbo.KC_CourseMOOC SET CurrentStatus=1 WHERE Id=0
UPDATE dbo.KC_CourseMOOCDetail SET IsRecommand=1 WHERE CourseMOOC_Id=0
UPDATE dbo.KC_CourseMOOC SET IsDel=1 WHERE Id=0

SELECT Id,CategoryName,ParentId,Sort,CreateTime,UpdateTime 
FROM dbo.KC_CourseCategory(NOLOCK) WHERE IsDel=0
UPDATE dbo.KC_CourseCategory SET IsDel=1 WHERE Id=0

UPDATE dbo.KC_CourseCategory SET CategoryName='',ParentId=0,
Sort=0,UpdateTime=GETDATE() WHERE Id=0


SELECT TOP 3* FROM dbo.KC_QuestionRoomCatalog
SELECT TOP 3* FROM dbo.KC_QuestionRoomExercise

SELECT * FROM dbo.US_UserCenter WHERE NickName='张果果'

SELECT * FROM dbo.US_Dictionary

SELECT * FROM dbo.KC_Course WHERE Id=1153
SELECT * FROM dbo.KC_CourseDetail WHERE CourseId=1153



UPDATE dbo.KC_Course SET CourseName='',CourseCover='',IsPublished=0,CurrentStatus=0,
UpdateTime=GETDATE() WHERE Id=0
UPDATE dbo.KC_CourseDetail SET ShortVideoUrl='',Summary='',Introduction='',
IsRecommand=0,StudyNumber=0,UpdateTime=GETDATE() WHERE CourseId=0



SELECT * FROM dbo.KC_CourseMOOC WHERE Id=1123
SELECT * FROM dbo.KC_CourseMOOCDetail WHERE CourseMOOC_Id=1123

UPDATE dbo.KC_CourseMOOC SET CourseName='',CourseCover='',IsPublished=0,
CurrentStatus=0,UpdateTime=GETDATE() WHERE Id=0
UPDATE dbo.KC_CourseMOOCDetail SET Summary='',Introduction='',ShortVideoUrl='',IsRecommand=0,
StudyNumber=0,UpdateTime=GETDATE() WHERE CourseMOOC_Id=0



SELECT Id,UserNo,NickName,Email,Mobile FROM dbo.US_UserCenter(NOLOCK) 
WHERE (Email='' OR Mobile='') AND UserStatus=17 AND IsDel=0


SELECT　* FROM dbo.KC_Institution


SELECT	c.Id,c.CourseName,c.CourseCover,i.Name AS InstitutionName,c.CurrentStatus,c.IsPublished,
		cd.ShortVideoUrl,cd.Summary,cd.Introduction,cd.IsRecommand,cd.StudyUrl,cc.CategoryName,c.CreateTime,c.UpdateTime,
		(
			SELECT COUNT(1) FROM dbo.KC_UserCourse(NOLOCK) 
			WHERE CourseId=c.Id AND CourseTypeId=22 AND IsSignOut=0 AND IsDel=0
		)+cd.StudyNumber AS  StudyNumber
FROM dbo.KC_Course(NOLOCK) c 
JOIN dbo.KC_Institution(NOLOCK) i ON c.InstitutionId=i.Id AND i.IsDel=0
JOIN dbo.KC_CourseDetail(NOLOCK) cd ON cd.CourseId=c.Id AND cd.IsDel=0
LEFT JOIN dbo.KC_CourseCategory(NOLOCK) cc ON c.CategoryId=cc.Id AND cc.IsDel=0
WHERE c.Id=1233


SELECT c.InstitutionId,*
FROM dbo.KC_Course c
JOIN dbo.KC_Institution i ON c.InstitutionId=i.Id AND i.IsDel=0
WHERE c.Id=1233

SELECT * FROM dbo.KC_Institution WHERE Id=1011


SELECT * FROM dbo.KC_ProfessionSpecial
SELECT * FROM dbo.KC_ProfessionSpecialRelateCourse

SELECT *,ROW_NUMBER()OVER(ORDER BY t.CreateTime DESC) AS RowNumber FROM
(
	SELECT psr.Id,ps.Name AS ProfessionName,ps.Id AS ProfessionSpecialId,ps.IsRecommend,
	c.CourseName,c.CourseCover,c.Id AS CourseId,psr.CreateTime 
	FROM dbo.KC_ProfessionSpecialRelateCourse(NOLOCK) psr
	JOIN dbo.KC_ProfessionSpecial(NOLOCK) ps ON psr.ProfessionSpecial_Id=ps.Id
	JOIN dbo.KC_Course(NOLOCK) c ON psr.Course_Id=c.Id
	WHERE psr.IsDel=0 AND ps.IsDel=0 AND c.IsDel=0 AND c.IsPublished=1 AND c.IsFiled=0
	AND ps.Name LIKE '%%' AND c.CourseName LIKE ''
)AS t

SELECT COUNT(1) 
FROM dbo.KC_ProfessionSpecialRelateCourse(NOLOCK) psr
JOIN dbo.KC_ProfessionSpecial(NOLOCK) ps ON psr.ProfessionSpecial_Id=ps.Id
JOIN dbo.KC_Course(NOLOCK) c ON psr.Course_Id=c.Id
WHERE psr.IsDel=0 AND ps.IsDel=0 AND c.IsDel=0 AND c.IsPublished=1 AND c.IsFiled=0
AND ps.Name LIKE '%%' AND c.CourseName LIKE ''


SELECT * FROM dbo.KC_ProfessionTag
SELECT * FROM dbo.KC_CourseIndex

SELECT * FROM dbo.KC_CourseCategory 

SELECT *,ROW_NUMBER()OVER(ORDER BY t.CreateTime DESC) AS RowNumber FROM
(
	SELECT p.Id,p.Name,p.IsRecommend,p.CreateTime 
	FROM dbo.KC_ProfessionSpecial(NOLOCK) p WHERE p.IsDel=0 AND p.Name LIKE '%%'
)t

SELECT COUNT(1)
FROM dbo.KC_ProfessionSpecial(NOLOCK) p WHERE p.IsDel=0

UPDATE dbo.KC_ProfessionSpecial SET Name='' WHERE Id=0

UPDATE dbo.KC_ProfessionSpecial SET IsRecommend=1 WHERE Id=0

UPDATE dbo.KC_ProfessionSpecialRelateCourse SET IsDel=1 WHERE Id=0
INSERT INTO dbo.KC_ProfessionSpecialRelateCourse(ProfessionSpecial_Id,Course_Id)
VALUES(0,0)


SELECT * FROM CmmoocCourse.dbo.KC_HelpCenter
UPDATE CmmoocCourse.dbo.KC_HelpCenter SET IsDel=1 WHERE Id>6


SELECT *,ROW_NUMBER()OVER(ORDER BY t.CreateTime DESC) AS RowNumber FROM
(
	SELECT psr.Id,ps.Name AS ProfessionName,ps.Id AS ProfessionSpecialId,ps.IsRecommend,
	c.CourseName,c.CourseCover,c.Id AS CourseId,psr.CreateTime 
	FROM dbo.KC_ProfessionSpecialRelateCourse(NOLOCK) psr
	JOIN dbo.KC_ProfessionSpecial(NOLOCK) ps ON psr.ProfessionSpecial_Id=ps.Id
	JOIN dbo.KC_Course(NOLOCK) c ON psr.Course_Id=c.Id
	WHERE psr.IsDel=0 AND ps.IsDel=0 AND c.IsDel=0 AND c.IsPublished=1 AND c.IsFiled=0
)AS t

USE CmmoocUserCenter
GO

SELECT * FROM CmmoocUserCenter.dbo.us_admin
SELECT * FROM CmmoocUserCenter.dbo.us_adminrole


SELECT * FROM dbo.US_UserCenter WHERE NickName='河传'



-- 20170501002

--------------------------2017年6月30日 脚本-------------------------------------

-- mooc工具表中增加ParentId字段，增加层级显示问题，针对作业、考试和测验整合的问题
ALTER TABLE dbo.KC_CourseMOOCModule ADD ParentId INT NOT NULL DEFAULT(0)
GO
sp_addextendedproperty N'MS_Description', N'父编号', 'SCHEMA', N'dbo', 'TABLE', N'KC_CourseMOOCModule', 'COLUMN', N'ParentId'
GO

-- 原有的单元测试和作业目录表中增加 类型(CatalogTypeId，字典：单元测试|作业),目的是解决单元测试和作业分开展示的问题
ALTER TABLE dbo.KC_UnitTestCatalogue ADD CatalogTypeId INT NOT NULL DEFAULT(0)
GO
sp_addextendedproperty N'MS_Description', N'目录类型（单元测试或作业）', 'SCHEMA', N'dbo', 'TABLE', N'KC_UnitTestCatalogue', 'COLUMN', N'CatalogTypeId'
GO
-- 同时增加一个所属课件目录的字段，目的是为了以后可能的功能扩展：课件与测试或作业的关联关系
ALTER TABLE dbo.KC_UnitTestCatalogue ADD CourseCatalogId INT 
GO
sp_addextendedproperty N'MS_Description', N'所属课件目录编号', 'SCHEMA', N'dbo', 'TABLE', N'KC_UnitTestCatalogue', 'COLUMN', N'CourseCatalogId'
GO

--------------------2017年7月5日--------------------

-- 一个成绩项下加入项的关联信息表
CREATE TABLE KC_JoinScoreItem
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),				-- 主键（自增）
	CourseScoreItem_Id INT NOT NULL,			-- 成绩项编号
	SourceId INT NOT NULL,						-- 来源编号（与具体哪个作业、考试等进行关联）
	IsDel BIT NOT NULL DEFAULT(0),				-- 是否删除
	CreateTime DATETIME NOT NULL DEFAULT(GETDATE()),-- 创建时间
)

-- 添加说明信息
EXECUTE sys.sp_addextendedproperty N'MS_Description','成绩项下加入项的关联信息表',N'SCHEMA',N'dbo',N'table',N'KC_JoinScoreItem',NULL,NULL
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'主键（自增）',N'SCHEMA',N'dbo',N'table',N'KC_JoinScoreItem',N'column',N'Id'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'成绩项编号',N'SCHEMA',N'dbo',N'table',N'KC_JoinScoreItem',N'column',N'CourseScoreItem_Id'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'来源编号（与具体哪个作业、考试等进行关联）',N'SCHEMA',N'dbo',N'table',N'KC_JoinScoreItem',N'column',N'SourceId'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'是否删除',N'SCHEMA',N'dbo',N'table',N'KC_JoinScoreItem',N'column',N'IsDel'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'创建时间',N'SCHEMA',N'dbo',N'table',N'KC_JoinScoreItem',N'column',N'CreateTime'

SELECT * FROM dbo.KC_UserCourseScoreItemLog
SELECT * FROM dbo.KC_UserCourseScoreItemRecord

-- 课程成绩项表和成绩项修改记录表增加KC_JoinScoreItem表的主键

ALTER TABLE dbo.KC_UserCourseScoreItemRecord ADD JoinScoreItem_Id INT NOT NULL DEFAULT(0)
GO
sp_addextendedproperty N'MS_Description', N'成绩项下加入项的主键编号', 'SCHEMA', N'dbo', 'TABLE', N'KC_UserCourseScoreItemRecord', 'COLUMN', N'JoinScoreItem_Id'
GO

ALTER TABLE dbo.KC_UserCourseScoreItemLog ADD JoinScoreItem_Id INT NOT NULL DEFAULT(0)
GO
sp_addextendedproperty N'MS_Description', N'成绩项下加入项的主键编号', 'SCHEMA', N'dbo', 'TABLE', N'KC_UserCourseScoreItemLog', 'COLUMN', N'JoinScoreItem_Id'
GO


-- 修改课程封面字段为可空类型
ALTER TABLE dbo.KC_CourseIndex ALTER COLUMN CourseCover NVARCHAR(200) NULL

-------------------------------------------2017年8月3日-------------------------------------------------
-- 我的作品的分类信息表
CREATE TABLE KC_MyWorkCategory
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),				-- 主键（自增）
	Name NVARCHAR(20) NOT NULL,					-- 分类名称
	IsDel BIT NOT NULL DEFAULT(0),				-- 是否删除
	CreateTime DATETIME NOT NULL DEFAULT(GETDATE()),-- 创建时间
)

-- 添加说明信息
EXECUTE sys.sp_addextendedproperty N'MS_Description','我的作品的分类信息表',N'SCHEMA',N'dbo',N'table',N'KC_MyWorkCategory',NULL,NULL
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'主键（自增）',N'SCHEMA',N'dbo',N'table',N'KC_MyWorkCategory',N'column',N'Id'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'作品分类名称',N'SCHEMA',N'dbo',N'table',N'KC_MyWorkCategory',N'column',N'Name'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'是否删除',N'SCHEMA',N'dbo',N'table',N'KC_MyWorkCategory',N'column',N'IsDel'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'创建时间',N'SCHEMA',N'dbo',N'table',N'KC_MyWorkCategory',N'column',N'CreateTime'


-- 作品库表增加分类外键

ALTER TABLE dbo.KC_ShowCaseLibrary ADD CategoryId INT NULL


--=============================管理员信息表的创建 9月20日=======================================================

-- 管理员的角色表
CREATE TABLE US_AdminRole
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),		-- 主键（自增）
	RoleName NVARCHAR(50) NOT NULL,					-- 角色名称
	Remark NVARCHAR(200) ,						-- 角色描述
	IsDel BIT NOT NULL DEFAULT(0),				-- 是否删除
	CreateTime DATETIME NOT NULL DEFAULT(GETDATE()),-- 创建时间
)

-- 添加说明信息
EXECUTE sys.sp_addextendedproperty N'MS_Description','管理员的角色表',N'SCHEMA',N'dbo',N'table',N'US_AdminRole',NULL,NULL
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'主键（自增）',N'SCHEMA',N'dbo',N'table',N'US_AdminRole',N'column',N'Id'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'角色名称',N'SCHEMA',N'dbo',N'table',N'US_AdminRole',N'column',N'RoleName'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'角色描述',N'SCHEMA',N'dbo',N'table',N'US_AdminRole',N'column',N'Remark'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'是否删除',N'SCHEMA',N'dbo',N'table',N'US_AdminRole',N'column',N'IsDel'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'创建时间',N'SCHEMA',N'dbo',N'table',N'US_AdminRole',N'column',N'CreateTime'


-- 管理员权限表
CREATE TABLE US_AdminAuth
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),		-- 主键（自增）
	AuthName NVARCHAR(50) NOT NULL,					-- 权限名称
	AuthUrl NVARCHAR(200) NOT NULL ,				-- 链接地址
	Remark NVARCHAR(200),							-- 详细描述
	ParentId INT NOT NULL DEFAULT(0),				-- 父编号
	IsDel BIT NOT NULL DEFAULT(0),					-- 是否删除
	CreateTime DATETIME NOT NULL DEFAULT(GETDATE()),-- 创建时间
	UpdateTime DATETIME NOT NULL DEFAULT(GETDATE()) -- 修改时间
)

-- 添加说明信息
EXECUTE sys.sp_addextendedproperty N'MS_Description','管理员权限表',N'SCHEMA',N'dbo',N'table',N'US_AdminAuth',NULL,NULL
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'主键（自增）',N'SCHEMA',N'dbo',N'table',N'US_AdminAuth',N'column',N'Id'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'权限名称',N'SCHEMA',N'dbo',N'table',N'US_AdminAuth',N'column',N'AuthName'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'链接地址',N'SCHEMA',N'dbo',N'table',N'US_AdminAuth',N'column',N'AuthUrl'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'详细描述',N'SCHEMA',N'dbo',N'table',N'US_AdminAuth',N'column',N'Remark'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'父编号',N'SCHEMA',N'dbo',N'table',N'US_AdminAuth',N'column',N'ParentId'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'是否删除',N'SCHEMA',N'dbo',N'table',N'US_AdminAuth',N'column',N'IsDel'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'创建时间',N'SCHEMA',N'dbo',N'table',N'US_AdminAuth',N'column',N'CreateTime'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'修改时间',N'SCHEMA',N'dbo',N'table',N'US_AdminAuth',N'column',N'UpdateTime'

--DROP TABLE dbo.US_AdminAuth

-- 管理员的角色与权限关联表
CREATE TABLE US_AdminRoleAuth
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),		-- 主键（自增）
	RoleId INT NOT NULL,							-- 角色编号
	AuthId INT NOT NULL ,							-- 权限编号
	IsDel BIT NOT NULL DEFAULT(0),					-- 是否删除
	CreateTime DATETIME NOT NULL DEFAULT(GETDATE()),-- 创建时间
)

-- 添加说明信息
EXECUTE sys.sp_addextendedproperty N'MS_Description','管理员的角色与权限关联表',N'SCHEMA',N'dbo',N'table',N'US_AdminRoleAuth',NULL,NULL
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'主键（自增）',N'SCHEMA',N'dbo',N'table',N'US_AdminRoleAuth',N'column',N'Id'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'角色编号',N'SCHEMA',N'dbo',N'table',N'US_AdminRoleAuth',N'column',N'RoleId'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'权限编号',N'SCHEMA',N'dbo',N'table',N'US_AdminRoleAuth',N'column',N'AuthId'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'是否删除',N'SCHEMA',N'dbo',N'table',N'US_AdminRoleAuth',N'column',N'IsDel'
EXECUTE sys.sp_addextendedproperty N'MS_Description',N'创建时间',N'SCHEMA',N'dbo',N'table',N'US_AdminRoleAuth',N'column',N'CreateTime'

-- 增加与角色关联的字段
ALTER TABLE dbo.US_Admin ADD RoleId INT NOT NULL DEFAULT(0)
GO
sp_addextendedproperty N'MS_Description', N'角色编号', 'SCHEMA', N'dbo', 'TABLE', N'US_Admin', 'COLUMN', N'RoleId'
GO
-- 增加修改时间（修改管理员的类型）
ALTER TABLE dbo.US_Admin ADD UpdateTime DATETIME NOT NULL DEFAULT(GETDATE())
GO
sp_addextendedproperty N'MS_Description', N'修改时间', 'SCHEMA', N'dbo', 'TABLE', N'US_Admin', 'COLUMN', N'UpdateTime'
GO




INSERT INTO dbo.US_AdminAuth(AuthName,AuthUrl,Remark,ParentId)
VALUES()

SELECT Id,AuthName,AuthUrl,Remark,ParentId,CreateTime,UpdateTime 
FROM dbo.US_AdminAuth(NOLOCK) aa
WHERE aa.IsDel=0 AND aa.Id=0


UPDATE dbo.US_AdminAuth SET AuthName='',AuthUrl='',Remark='',
ParentId=0,UpdateTime=GETDATE() WHERE Id=0

UPDATE dbo.US_AdminAuth SET IsDel=1 WHERE Id=0

SELECT * FROM dbo.US_AdminRoleAuth

SELECT Id,RoleName,Remark,CreateTime 
FROM dbo.US_AdminRole(NOLOCK) ar
WHERE ar.Id=0 AND ar.IsDel=0

INSERT INTO dbo.US_Admin(AdminNo,NickName,Pwd,RoleId)
VALUES()

UPDATE dbo.US_Admin SET NickName='',Pwd='',RoleId=0,
UpdateTime=GETDATE() WHERE Id=0

UPDATE dbo.US_Admin SET IsDel=1 WHERE Id=0
UPDATE dbo.US_AdminRole SET IsDel=1 WHERE Id=0
UPDATE dbo.US_AdminRole SET RoleName='',Remark='' WHERE Id=0

SELECT Id,RoleName,Remark,CreateTime
FROM dbo.US_AdminRole WHERE Id=0 AND IsDel=0


INSERT INTO dbo.US_AdminRole(RoleName,Remark)VALUES()

SELECT * FROM dbo.US_Admin
SELECT * FROM dbo.US_UserCenterRole
SELECT * FROM dbo.US_Role
SELECT * FROM dbo.US_RoleAction


SELECT *,ROW_NUMBER()OVER(ORDER BY t.CreateTime DESC) FROM
(
	SELECT  a.Id,a.AdminNo,a.NickName,a.CreateTime,a.UpdateTime,a.RoleId,r.RoleName
	FROM dbo.US_Admin(NOLOCK) a 
	JOIN dbo.US_AdminRole(NOLOCK) r ON a.RoleId=r.Id AND r.IsDel=0
	WHERE a.IsDel=0 AND a.NickName LIKE '%%' AND a.RoleId=0
) AS t

SELECT  COUNT(1)
FROM dbo.US_Admin(NOLOCK) a 
JOIN dbo.US_AdminRole(NOLOCK) r ON a.RoleId=r.Id AND r.IsDel=0
WHERE a.IsDel=0 AND a.NickName LIKE '%%' AND a.RoleId=0xeixie

SELECT * FROM CmmoocCourse.dbo.KC_ProfessionSpecial

INSERT INTO dbo.KC_ProfessionSpecial(Name,IsRecommand)
VALUES(Name,IsRecommand)

SELECT * FROM CmmoocCourse.dbo.KC_ProfessionSpecialRelateCourse



SELECT * FROM [dbo].[ERPUser]
SELECT * FROM [dbo].[ERPJiaoSe]


update dbo.ERPUser set UserPwd='6C3D4C2BA288DB70' where UserName='407640582'

SELECT * FROM ERP.dbo.ERPUser






USE CentralBuild
GO

SELECT * FROM dbo.ZHJK_AboutUsCategory(NOLOCK) WHERE ParentId =
(
	SELECT Id FROM dbo.ZHJK_AboutUsCategory(NOLOCK) WHERE CategoryName = '企业介绍'
) AND IsDel = 0

INSERT INTO dbo.ZHJK_AboutUS(Content,CategoryId,Sort)
VALUES(@Content,@CategoryId,@Sort)

SELECT a.Id,Content,CategoryId,a.Sort,c.CategoryName 
FROM dbo.ZHJK_AboutUS(NOLOCK) a
JOIN dbo.ZHJK_AboutUsCategory(NOLOCK) c ON a.CategoryId = c.Id AND c.IsDel = 0
WHERE a.IsDel = 0
ORDER BY a.CreateTime DESC,a.Sort ASC


UPDATE dbo.ZHJK_AboutUS SET Content=@Content,CategoryId=@CategoryId,Sort=@Sort
WHERE Id = 0

SELECT * FROM dbo.ZHJK_AboutUS

DELETE FROM dbo.ZHJK_AboutUS WHERE Id >1

INSERT INTO dbo.ZHJK_News
        ( Title ,
          Summary ,
		  ImgUrl,
          Content ,
          Author ,
          SourceFrom ,
          CategoryId 
        )
VALUES  ( @Title , 
          @Summary ,
		  @ImgUrl,
          @Content , 
          @Author,
          @SourceFrom
          @CategoryId
        )

UPDATE dbo.ZHJK_News SET Title =@Title,Summary=@Summary,ImgUrl=@ImgUrl,Content=@Content,
Author=@Author,SourceFrom=@SourceFrom,CategoryId=@CategoryId
WHERE Id =0

SELECT Id,Title,Summary,ImgUrl,Content,Author,SourceFrom,
CategoryId,ViewNumber,CreateTime,UpdateTime 
FROM dbo.ZHJK_News(NOLOCK)  WHERE Id=0

SELECT * FROM dbo.ZHJK_AboutUsCategory


SELECT COUNT(1)
FROM dbo.ZHJK_News(NOLOCK) n
JOIN dbo.ZHJK_AboutUsCategory(NOLOCK) c ON n.CategoryId=c.Id
WHERE n.CategoryId=0 AND n.IsDel=0

SELECT n.*,c.CategoryName,ROW_NUMBER()OVER(ORDER BY n.CreateTime DESC) AS RowNumber
FROM dbo.ZHJK_News(NOLOCK) n
JOIN dbo.ZHJK_AboutUsCategory(NOLOCK) c ON n.CategoryId=c.Id
WHERE  n.Title LIKE '%voc%' AND n.CategoryId=0 AND n.IsDel= 0 

UPDATE dbo.ZHJK_News SET IsDel = 1,UpdateTime=GETDATE() WHERE Id =1

SELECT * FROM dbo.ZHJK_JoinUS(NOLOCK) WHERE Id=0 AND IsDel=0

INSERT INTO dbo.ZHJK_JoinUS(Content,CategoryId,Sort)
VALUES(@Content,@CategoryId,@Sort)

UPDATE dbo.ZHJK_JoinUS SET Content=@Content,Sort=@Sort
WHERE Id = @Id

SELECT j.Id,j.Content,j.CategoryId,j.Sort,c.CategoryName
FROM dbo.ZHJK_JoinUS(NOLOCK) j
JOIN dbo.ZHJK_AboutUsCategory(NOLOCK) c ON j.CategoryId = c.Id AND c.IsDel=0
WHERE j.IsDel=0

SELECT * FROM dbo.ZHJK_ProductCategory


SELECT * FROM dbo.ZHJK_Products(NOLOCK) WHERE Id=0

UPDATE dbo.ZHJK_Products SET IsDel=1 WHERE Id=0

UPDATE dbo.ZHJK_Products SET CategoryId=@CategoryId,ProductName=@ProductName,Model=@Model,
Manufacturer=@Manufacturer,OriginPlace=@OriginPlace,AirVolumn=@AirVolumn,Pressure=@Pressure,
Powers=@Powers,Purification=@Purification,Options=@Options,Scope=@Scope,UpdateTime=GETDATE()
WHERE Id =@Id

INSERT INTO dbo.ZHJK_Products
        ( CategoryId ,
          ProductName ,
          Model ,
          Manufacturer ,
          OriginPlace ,
          AirVolumn ,
          Pressure ,
          Powers ,
          Purification ,
          Options ,
          Scope 
        )
VALUES  ( @CategoryId,
          @ProductName,
          @Model,
          @Manufacturer,
          @OriginPlace,
          @AirVolumn,
          @Pressure,
          @Powers,
          @Purification,
          @Options,
          @Scope
        )


SELECT * FROM dbo.ZHJK_ProductCategory
SELECT * FROM dbo.ZHJK_Products


SELECT p.Id ,
       p.CategoryId ,
       p.ProductName ,
       p.Model ,
       p.Manufacturer ,
       p.OriginPlace ,
       p.AirVolumn ,
       p.Pressure ,
       p.Powers ,
       p.Purification ,
       p.Options ,
       p.Scope ,
       p.CreateTime ,
       p.UpdateTime ,
       pc.CategoryName,
	   ROW_NUMBER()OVER(ORDER BY p.CreateTime DESC) AS RowNumber
FROM	dbo.ZHJK_Products(NOLOCK) p
JOIN	dbo.ZHJK_ProductCategory(NOLOCK) pc ON p.CategoryId=pc.Id AND pc.IsDel=0

WHERE p.IsDel=0 AND p.CategoryId=0 AND p.ProductName LIKE '%%'


SELECT pd.*,p.ProductName FROM dbo.ZHJK_ProductDetail(NOLOCK) pd
JOIN dbo.ZHJK_Products(NOLOCK) p ON pd.ProductId=p.Id AND p.IsDel=0
WHERE ProductId=0 AND pd.IsDel=0 

UPDATE dbo.ZHJK_ProductDetail SET Content='',UpdateTime=GETDATE()
WHERE Id=0

SELECT pim.Id,pim.ProductId,pim.ImgUrl,pim.Sort,pim.CreateTime,p.ProductName,pim.IsCover 
FROM dbo.ZHJK_ProductImage(NOLOCK) pim
JOIN dbo.ZHJK_Products(NOLOCK) p ON pim.ProductId=p.Id AND p.IsDel=0
WHERE pim.ProductId=1 AND pim.IsDel=0

INSERT INTO dbo.ZHJK_ProductImage(ProductId,ImgUrl,Sort,IsCover)
VALUES(@ProductId,@ImgUrl,@Sort,@IsCover)

UPDATE dbo.ZHJK_ProductImage SET ImgUrl=@ImgUrl,Sort=@Sort,
IsCover=@IsCover WHERE Id=@Id


SELECT pc.Id ,
       pc.ProductId ,
       pc.ImgUrl ,
       pc.Company ,
       pc.CaseName ,
       pc.Sort ,
       pc.CreateTime,p.ProductName 
FROM dbo.ZHJK_ProductCase(NOLOCK) pc
JOIN dbo.ZHJK_Products(NOLOCK) p ON pc.ProductId=p.Id AND p.IsDel=0
WHERE pc.ProductId=0 AND pc.IsDel=0

INSERT  INTO dbo.ZHJK_ProductCase(ProductId,ImgUrl,Company,ProductName,Sort)
VALUES(@ProductId,@ImgUrl,@Company,@ProductName,@Sort)


UPDATE dbo.ZHJK_ProductCase SET ImgUrl=@ImgUrl,Company=@Company,
ProductName=@ProductName,Sort=@Sort,UpdateTime=GETDATE()
WHERE Id=@Id

SELECT * FROM dbo.ZHJK_ProductCase

SELECT ImgUrl,* FROM dbo.ZHJK_TechnologyCategory

INSERT INTO dbo.ZHJK_TechnologyProducts(CategoryId,Summary,Content)
VALUES(@CategoryId,@Summary,@Content)

UPDATE dbo.ZHJK_TechnologyProducts SET CategoryId=@CategoryId,
Summary=@Summary,Content=@Content
WHERE Id=@Id

UPDATE dbo.ZHJK_TechnologyProducts SET IsDel=1
WHERE Id=0

SELECT tp.Id ,tp.CategoryId,tp.Summary,tp.Content ,
       tp.CreateTime,tc.Name AS CategoryName,tc.ImgUrl,
	   ROW_NUMBER()OVER(ORDER BY tp.CreateTime DESC) AS RowNumber 
FROM dbo.ZHJK_TechnologyProducts(NOLOCK) tp
JOIN dbo.ZHJK_TechnologyCategory(NOLOCK) tc ON tp.CategoryId=tc.Id
WHERE tp.IsDel=0


SELECT ti.Id ,
       ti.TechnologyId ,
       ti.ImgUrl,ti.Sort,ti.IsCover,
       ti.CreateTime,tp.ProductName AS TechnologyName
FROM dbo.ZHJK_TechnologyImage(NOLOCK) ti
JOIN dbo.ZHJK_TechnologyProducts(NOLOCK) tp ON ti.TechnologyId=tp.Id
WHERE ti.IsDel=0 AND ti.Id=0

INSERT INTO dbo.ZHJK_TechnologyImage(TechnologyId,ImgUrl,Sort,IsCover)
VALUES(@TechnologyId,@ImgUrl,@Sort,@IsCover)

UPDATE dbo.ZHJK_TechnologyImage SET TechnologyId=@TechnologyId,
ImgUrl=@ImgUrl,Sort=@Sort,IsCover=@IsCover
WHERE Id=@Id

SELECT * FROM dbo.ZHJK_TechLinkedProducts


INSERT INTO dbo.ZHJK_TechLinkedProducts
        ( TechnologyId ,
          ProductId ,
          Sort ,
          IsDel ,
          CreateTime
        )
VALUES  ( 0 , -- TechnologyId - int
          0 , -- ProductId - int
          0 , -- Sort - int
          NULL , -- IsDel - bit
          GETDATE()  -- CreateTime - datetime
        )(TechnologyId,ProductId,Sort)
VALUES(@TechnologyId,@ProductId,@Sort)

DELETE FROM dbo.ZHJK_TechLinkedProducts WHERE Id=0

SELECT	tlp.Id,tlp.TechnologyId,tlp.ProductId,tlp.Sort,tlp.CreateTime,
		tp.TechnologyName,p.ProductName
FROM	dbo.ZHJK_TechLinkedProducts(NOLOCK) tlp
JOIN	dbo.ZHJK_TechnologyProducts(NOLOCK) tp ON tlp.TechnologyId=tp.Id AND tp.IsDel=0
JOIN	dbo.ZHJK_Products(NOLOCK) p ON tlp.ProductId=p.Id AND p.IsDel=0
WHERE   tlp.TechnologyId =0 AND tlp.IsDel=0 
ORDER BY tlp.CreateTime DESC

SELECT * FROM dbo.ZHJK_TechLinkedProducts

SELECT p.Id ,
       p.CategoryId ,
       p.ProductName ,
       p.Models ,
       p.Manufacturer ,
       p.CreateTime ,
       pc.CategoryName,
	   CASE WHEN tlp.Id IS NOT NULL THEN '<span style='"color:red"'>已加入</span>' ELSE '' END AS JoinStatus,
	   ROW_NUMBER()OVER(ORDER BY p.CreateTime DESC) AS RowNumber
FROM	dbo.ZHJK_Products(NOLOCK) p
JOIN	dbo.ZHJK_ProductCategory(NOLOCK) pc ON p.CategoryId=pc.Id AND pc.IsDel=0
LEFT JOIN dbo.ZHJK_TechLinkedProducts(NOLOCK) tlp ON tlp.ProductId =p.Id AND tlp.IsDel=0 AND tlp.TechnologyId=1
WHERE p.IsDel=0 


SELECT	tlp.Id,tlp.TechnologyId,tlp.ProductId,tlp.Sort,tlp.CreateTime,
		tp.TechnologyName,p.ProductName,pm.ImgUrl
FROM	dbo.ZHJK_TechLinkedProducts(NOLOCK) tlp
JOIN	dbo.ZHJK_TechnologyProducts(NOLOCK) tp ON tlp.TechnologyId=tp.Id AND tp.IsDel=0
JOIN	dbo.ZHJK_Products(NOLOCK) p ON tlp.ProductId=p.Id AND p.IsDel=0
JOIN	dbo.ZHJK_ProductImage(NOLOCK) pm ON pm.ProductId=p.Id AND pm.IsDel=0 AND pm.IsCover=1
WHERE   tlp.TechnologyId =1 AND tlp.IsDel=0 
ORDER BY tlp.CreateTime DESC

SELECT * FROM dbo.ZHJK_ProductImage


SELECT * FROM dbo.ZHJK_SolutionCategory

INSERT INTO dbo.ZHJK_SolutionProducts
        ( CategoryId ,
          ProductName ,
          AirVolumn ,
          Temperature ,
          Component ,
          VOCs ,
          Particulate ,
          ProduceCondition ,
          TreatmentProcess ,
          InvoledIndustry 
        )
VALUES  ( @CategoryId,
          @ProductName,
          @AirVolumn,
          @Temperature,
          @Component,
          @VOCs,
          @Particulate,
          @ProduceCondition,
          @TreatmentProcess,
          @InvoledIndustry
        )

UPDATE dbo.ZHJK_SolutionProducts SET CategoryId=@CategoryId,ProductName=@ProductName,
AirVolumn=@AirVolumn,Temperature=@Temperature,Component=@Component,VOCs=@VOCs,
Particulate=@Particulate,ProduceCondition=@ProduceCondition,TreatmentProcess=@TreatmentProcess,
InvoledIndustry=@InvoledIndustry,UpdateTime=GETDATE()
WHERE Id=@Id

SELECT sp.Id ,
       sp.CategoryId ,
       sp.SolutionName ,
       sp.AirVolumn ,
       sp.Temperature ,
       sp.Component ,
       sp.VOCs ,
       sp.Particulate ,
       sp.ProduceCondition ,
       sp.TreatmentProcess ,
       sp.InvoledIndustry ,
       sp.CreateTime ,
       sp.UpdateTime,sc.CategoryName,
	   ROW_NUMBER()OVER(ORDER BY sp.CreateTime DESC) AS RowNumber
FROM dbo.ZHJK_SolutionProducts(NOLOCK) sp
JOIN dbo.ZHJK_SolutionCategory(NOLOCK) sc ON sp.CategoryId=sc.Id AND sc.IsDel=0
WHERE sp.IsDel=0 AND sp.CategoryId=0 AND sp.SolutionName=''

SELECT * FROM dbo.ZHJK_SolutionProducts
SELECT * FROM dbo.ZHJK_SolutionCategory 

SELECT sd.Id,sd.SolutionId,sd.Content,sp.SolutionName 
FROM dbo.ZHJK_SolutionProductDetail(NOLOCK) sd
JOIN dbo.ZHJK_SolutionProducts(NOLOCK) sp ON sd.SolutionId=sp.Id
WHERE sd.SolutionId=0 AND sd.IsDel=0

SELECT sm.Id,sm.SolutionId,sm.ImgUrl,sm.Sort,sm.IsCover,sm.CreateTime,sp.SolutionName 
FROM dbo.ZHJK_SolutionImage(NOLOCK) sm
JOIN dbo.ZHJK_SolutionProducts(NOLOCK) sp ON sm.SolutionId=sp.Id AND sp.IsDel=0
WHERE sm.SolutionId=0 AND sm.IsDel=0

SELECT Id,CategoryName,Sort,RedirectUrl,CreateTime
FROM dbo.ZHJK_CustomerServiceCategory(NOLOCK)
WHERE IsDel=0 AND Id=0

INSERT INTO dbo.ZHJK_CustomerServiceCategory(CategoryName,sort,RedirectUrl)
VALUES(@CategoryName,@sort,@RedirectUrl)


UPDATE dbo.ZHJK_CustomerServiceCategory SET CategoryName=@CategoryName,
Sort=@Sort,RedirectUrl=@RedirectUrl
WHERE Id=@Id


SELECT cs.Id,cs.CategoryId,cs.Content,cs.CreateTime,css.CategoryName
FROM dbo.ZHJK_CustomerService(NOLOCK) cs
JOIN dbo.ZHJK_CustomerServiceCategory(NOLOCK) css ON cs.CategoryId=css.Id 
WHERE cs.IsDel=0 AND cs.Id=0

SELECT * FROM dbo.ZHJK_CustomerService

-- http://www.hirotaku.cn/img/dhlc_31.jpg

SELECT * FROM dbo.ZHJK_Contract
INSERT INTO dbo.ZHJK_Contract
        ( CompanyName ,
          Summary ,
          BuyPhone ,
          ServicePhone ,
          SupportPhone ,
          ComplainPhone ,
          Addres ,
          Tel ,
          Fax ,
          CSH ,
          Email ,
          QQ ,
          HomePage ,
          VisitRoute 
        )
VALUES  ( @CompanyName,
          @Summary,
          @BuyPhone,
          @ServicePhone,
          @SupportPhone,
          @ComplainPhone,
          @Addres,
          @Tel,
          @Fax,
          @CSH,
          @Email,
          @QQ,
          @HomePage,
          @VisitRoute
        )
UPDATE dbo.ZHJK_Contract SET CompanyName=@CompanyName,Summary=@Summary,
BuyPhone=@BuyPhone,ServicePhone=@ServicePhone,SupportPhone=@SupportPhone,
ComplainPhone=@ComplainPhone,Addres=@Addres,Tel=@Tel,Fax=@Fax,CSH=@CSH,
Email=@Email,QQ=@QQ,HomePage=@HomePage,VisitRoute=@VisitRoute
WHERE Id=@Id

SELECT Id ,
       CompanyName ,
       Summary ,
       BuyPhone ,
       ServicePhone ,
       SupportPhone ,
       ComplainPhone ,
       Addres ,
       Tel ,
       Fax ,
       CSH ,
       Email ,
       QQ ,
       HomePage ,
       VisitRoute ,
       CreateTime 
FROM dbo.ZHJK_Contract(NOLOCK) WHERE IsDel=0


SELECT Id,CompanyName,Chargor,Phone,Email,Content,CreateTime,CreateTime
FROM dbo.ZHJK_FeedBack(NOLOCK)
WHERE IsDel=0 AND Id=0

INSERT INTO dbo.ZHJK_FeedBack(CompanyName,Chargor,Phone,Email,Content)
VALUES(@CompanyName,@Chargor,@Phone,@Email,@Content)


UPDATE dbo.ZHJK_FeedBack SET IsDel=1 WHERE Id=0


SELECT Id,FeedbackId,ReplyContent,CreateTime 
FROM dbo.ZHJK_Reply(NOLOCK) 
WHERE FeedbackId =0 AND IsDel=0

INSERT INTO dbo.ZHJK_Reply(FeedbackId,ReplyContent)
VALUES(@FeedbackId,@ReplyContent)

UPDATE dbo.ZHJK_Reply SET IsDel=1 WHERE Id=0


SELECT * FROM dbo.ZHJK_Qulification

INSERT INTO dbo.ZHJK_Qulification(ImgUrl,Sort)
VALUES(@ImgUrl,@Sort)

UPDATE dbo.ZHJK_Qulification SET ImgUrl=@ImgUrl,Sort=Sort
WHERE Id=@Id


SELECT Id,Name,ImgUrl,GrayImgUrl,Sort,CreateTime
FROM dbo.ZHJK_Qulification(NOLOCK)
WHERE IsDel=0 AND Id=0
ORDER BY CreateTime DESC,Sort ASC

SELECT Id,Account,Pass,CreateTime 
FROM dbo.ZHJK_Admin(NOLOCK)
WHERE Account='' AND Pass='' AND IsDel=0

INSERT INTO dbo.ZHJK_Admin(Account,Pass)
VALUES(@Account,@Pass)


SELECT  * FROM dbo.ZHJK_AboutUS
SELECT *  FROM dbo.ZHJK_AboutUsCategory

SELECT * FROM dbo.ZHJK_ProductCategory

SELECT  *--TOP 1 p.Id,p.ProductName,pm.ImgUrl
FROM dbo.ZHJK_Products(NOLOCK) p
LEFT JOIN dbo.ZHJK_ProductImage(NOLOCK) pm ON pm.ProductId=p.Id AND pm.IsCover=1 AND pm.IsDel=0
LEFT JOIN dbo.ZHJK_ProductDetail(NOLOCK) pd ON pd.ProductId=p.Id AND pd.IsDel=0
WHERE p.CategoryId=3 AND p.IsDel=0


SELECT Id,CategoryName,Summary,ImgUrl,ParentId,RedirectUrl,CreateTime 
FROM [dbo].[ZHJK_SolutionCategory](NOLOCK)  WHERE ParentId=0 AND IsDel = 0

SELECT * FROM dbo.ZHJK_FeedBack


SELECT f.Id,f.CompanyName,f.Chargor,f.Phone,f.Email,f.Content,f.CreateTime,r.ReplyContent,
	   ROW_NUMBER()OVER(ORDER BY CreateTime DESC) AS RowNumber 
FROM dbo.ZHJK_FeedBack(NOLOCK) f
LEFT JOIN dbo.ZHJK_Reply(NOLOCK) r ON r.FeedbackId=f.Id AND r.IsDel=0
WHERE f.IsDel=0


SELECT * FROM dbo.ZHJK_AboutUS
SELECT * FROM dbo.ZHJK_AboutUsCategory

SELECT * FROM dbo.ZHJK_CustomerService
SELECT * FROM dbo.ZHJK_CustomerServiceCategory

SELECT * FROM dbo.ZHJK_TechnologyCategory

SELECT TOP 6 tp.Id,tp.TechnologyName,ti.ImgUrl 
FROM dbo.ZHJK_TechnologyProducts(NOLOCK) tp
JOIN dbo.ZHJK_TechnologyImage(NOLOCK) ti ON ti.TechnologyId=tp.Id AND ti.IsCover=1 AND ti.IsDel=0
WHERE tp.IsDel=0
ORDER BY tp.CreateTime DESC

SELECT TOP 4 Id,Title,Summary,CreateTime
FROM dbo.ZHJK_News(NOLOCK)
WHERE IsDel=0 
ORDER BY CreateTime DESC

SELECT a.Id,a.Content,ac.CategoryName 
FROM dbo.ZHJK_AboutUS(NOLOCK) a
JOIN dbo.ZHJK_AboutUsCategory(NOLOCK) ac ON a.CategoryId=ac.Id AND ac.IsDel=0
WHERE ac.CategoryName='企业简介'


SELECT * FROM dbo.ZHJK_ProductImage

SELECT * FROM dbo.ZHJK_TechnologyImage

DELETE FROM dbo.ZHJK_TechnologyImage WHERE Id>1

SELECT Id,Name,RedirectUrl,ImgUrl,Sort,CreateTime 
FROM [dbo].[ZHJK_FriendLink](NOLOCK)
WHERE IsDel=0
ORDER BY CreateTime DESC,Sort ASC

INSERT INTO [dbo].[ZHJK_FriendLink](Name,RedirectUrl,ImgUrl,Sort)
VALUES(@Name,@RedirectUrl,@ImgUrl,@Sort)

UPDATE [dbo].[ZHJK_FriendLink] SET Name=@Name,
RedirectUrl=@RedirectUrl,ImgUrl=@ImgUrl,Sort=@Sort
WHERE Id=@Id


SELECT　* FROM dbo.ZHJK_SolutionProducts
SELECT * FROM dbo.ZHJK_SolutionImage


SELECT TOP 6 sp.Id,spd.Content,sp.SolutionName,si.ImgUrl
FROM dbo.ZHJK_SolutionProducts(NOLOCK) sp
JOIN dbo.ZHJK_SolutionCategory(NOLOCK) sc ON sp.CategoryId=sc.Id AND sc.IsDel=0
JOIN dbo.ZHJK_SolutionProductDetail(NOLOCK) spd ON spd.SolutionId=sp.Id AND spd.IsDel=0
LEFT JOIN dbo.ZHJK_SolutionImage(NOLOCK) si ON si.SolutionId=sp.Id AND si.IsDel=0 AND si.IsCover=1
WHERE sp.IsDel=0  
ORDER BY sp.CreateTime DESC



SELECT p.Id,p.ProductName,i.ImgUrl 
FROM dbo.ZHJK_Products(NOLOCK) p
LEFT JOIN dbo.ZHJK_ProductImage(NOLOCK) i ON i.ProductId=p.Id AND i.IsCover=1 AND i.IsDel=0 
WHERE p.IsDel=0
ORDER BY p.CreateTime DESC

SELECT * FROM dbo.ZHJK_AboutUS
SELECT * FROM dbo.ZHJK_AboutUsCategory

SELECT a.Id,a.Content,a.CategoryId,a.Sort,
(
	SELECT ac.CategoryName FROM dbo.ZHJK_AboutUsCategory(NOLOCK) ac 
	WHERE ac.Id=11
)AS CategoryName
FROM dbo.ZHJK_AboutUS(NOLOCK) a
WHERE CategoryId = 11 AND a.IsDel = 0


SELECT Id,CategoryName,ImgUrl,RedirectUrl,*
FROM dbo.ZHJK_SolutionCategory(NOLOCK)
WHERE IsDel=0 AND IsMain=1

SELECT * FROM dbo.ZHJK_Qulification

SELECT * FROM dbo.ZHJK_News 

SELECT * FROM dbo.ZHJK_AboutUsCategory

SELECT a.Id,a.Content,a.CategoryId,a.Sort,ac.CategoryName
FROM dbo.ZHJK_AboutUS(NOLOCK) a
JOIN dbo.ZHJK_AboutUsCategory(NOLOCK) ac ON a.CategoryId=ac.Id AND ac.IsDel=0 
WHERE a.CategoryId = 7 AND a.IsDel = 0


SELECT n.Id,n.Title,n.Summary,n.ImgUrl
FROM dbo.ZHJK_News(NOLOCK) n
JOIN dbo.ZHJK_AboutUsCategory(NOLOCK) ac ON n.CategoryId=ac.Id AND ac.IsDel=0
WHERE n.CategoryId=7 AND n.IsDel=0

SELECT n.Id,n.Title,n.Summary,n.ImgUrl,n.Content,n.Author,n.SourceFrom,
n.CategoryId,n.ViewNumber,n.CreateTime,n.UpdateTime,ac.CategoryName 
FROM dbo.ZHJK_News(NOLOCK) n 
JOIN dbo.ZHJK_AboutUsCategory(NOLOCK) ac ON n.CategoryId=ac.Id AND ac.IsDel=0
WHERE n.Id=1

UPDATE dbo.ZHJK_News SET ViewNumber=ViewNumber+1 WHERE Id=0


SELECT TOP 1 Id,Title,'Next' AS TypeName
FROM dbo.ZHJK_News(NOLOCK) WHERE Id>1
UNION ALL
SELECT TOP 1 Id,Title,'Prev' AS TypeName 
FROM dbo.ZHJK_News(NOLOCK) WHERE Id<1

SELECT* FROM dbo.ZHJK_News

SELECT Id,Title,
		LAG(Id,1,0)OVER(ORDER BY CreateTime ) AS preId,
		LAG(Title,1,0)OVER(ORDER BY CreateTime) AS pretitle
FROM dbo.ZHJK_News(NOLOCK) WHERE Id=2

SELECT * FROM dbo.ZHJK_AboutUsCategory

SELECT a.Id,a.Content,a.CategoryId,a.Sort,ac.CategoryName
FROM dbo.ZHJK_AboutUS(NOLOCK) a
JOIN dbo.ZHJK_AboutUsCategory(NOLOCK) ac ON a.CategoryId=ac.Id AND ac.IsDel=0 
WHERE a.CategoryId = 8 AND a.IsDel = 0

SELECT* FROM dbo.ZHJK_AboutUS

SELECT * FROM dbo.ZHJK_JoinUS

SELECT * FROM dbo.ZHJK_CustomerService
SELECT * FROM dbo.ZHJK_CustomerServiceCategory

SELECT Id,CategoryName,Sort,RedirectUrl,CreateTime,ImgUrl,ParentId,Summary
FROM dbo.ZHJK_CustomerServiceCategory(NOLOCK)
WHERE IsDel=0 AND Id=1


SELECT * FROM dbo.ZHJK_Products
SELECT* FROM dbo.ZHJK_TechnologyCategory

SELECT * FROM dbo.ZHJK_TechnologyProducts(NOLOCK) 


SELECT tp.Id ,tp.CategoryId ,tp.TechnologyName,tp.Summary ,
       tp.Content ,tp.CreateTime,tc.Name AS CategoryName ,
	   tm.ImgUrl,tm.Sort,tm.IsCover
FROM dbo.ZHJK_TechnologyProducts(NOLOCK) tp
JOIN dbo.ZHJK_TechnologyCategory(NOLOCK) tc ON tp.CategoryId=tc.Id
LEFT JOIN dbo.ZHJK_TechnologyImage(NOLOCK) tm ON tm.TechnologyId=tp.Id AND tm.IsDel=0
WHERE tp.CategoryId=3 AND tp.IsDel=0


SELECT tp.Id ,
       tp.CategoryId ,
       tp.TechnologyName,
       tp.Summary ,
       tp.Content ,
       tp.CreateTime,tc.Name AS CategoryName 
FROM dbo.ZHJK_TechnologyProducts(NOLOCK) tp
JOIN dbo.ZHJK_TechnologyCategory(NOLOCK) tc ON tp.CategoryId=tc.Id
WHERE tp.CategoryId=3 AND tp.IsDel=0


SELECT Id,Name,Summary,ImgUrl,RedirectUrl,
	   ROW_NUMBER()OVER(ORDER BY CreateTime DESC) AS RowNumber
FROM dbo.ZHJK_TechnologyCategory(NOLOCK) 
WHERE ParentId=4 AND IsDel=0


SELECT Id,ParentId,CategoryName,Summary,ImgUrl,RedirectUrl,
	   ROW_NUMBER()OVER(ORDER BY CreateTime DESC) AS RowNumber 
FROM dbo.ZHJK_SolutionCategory(NOLOCK)
WHERE IsDel=0 AND ParentId=0

SELECT * FROM dbo.ZHJK_SolutionCategory WHERE Id=1 OR ParentId =1



SELECT * FROM dbo.ZHJK_SolutionProducts
SELECT * FROM dbo.ZHJK_SolutionProductDetail


SELECT sp.Id ,
       sp.CategoryId ,
       sp.SolutionName ,
       sp.AirVolumn ,
       sp.Temperature ,
       sp.Component ,
       sp.VOCs ,
       sp.Particulate ,
       sp.ProduceCondition ,
       sp.TreatmentProcess ,
       sp.InvoledIndustry ,
       sp.CreateTime ,spd.Content,
       sp.UpdateTime,sc.CategoryName
FROM dbo.ZHJK_SolutionProducts(NOLOCK) sp
JOIN dbo.ZHJK_SolutionCategory(NOLOCK) sc ON sp.CategoryId=sc.Id AND sc.IsDel=0
JOIN dbo.ZHJK_SolutionProductDetail(NOLOCK) spd ON spd.SolutionId=sp.Id AND spd.IsDel=0
WHERE (sp.CategoryId=13 OR sc.ParentId=13) AND sp.IsDel=0


SELECT * FROM dbo.ZHJK_ProductCategory

WITH category_cte AS
(
	SELECT Id,CategoryName,Summary,ImgUrl,ParentId,Sort,RedirectUrl,CreateTime
	FROM [dbo].[ZHJK_SolutionCategory](NOLOCK)
	WHERE Id = 1 AND IsDel = 0
)
SELECT cte.*,sc.CategoryName AS ParentName 
FROM category_cte AS cte
LEFT JOIN dbo.ZHJK_SolutionCategory(NOLOCK) sc ON sc.Id=cte.ParentId



SELECT * 
FROM dbo.ZHJK_ProductCategory(NOLOCK) pc
WHERE pc.ParentId=0


SELECT TOP 8 p.Id,p.CategoryId,p.ProductName,pm.ImgUrl 
FROM dbo.ZHJK_Products(NOLOCK) p
JOIN dbo.ZHJK_ProductImage(NOLOCK) pm ON pm.ProductId=p.Id AND pm.IsDel=0 AND pm.IsCover=1
WHERE p.CategoryId IN (
	SELECT pc.Id FROM dbo.ZHJK_ProductCategory(NOLOCK) pc 
	WHERE pc.ParentId=1 AND pc.IsDel=0
)
ORDER BY p.CreateTime DESC

SELECT * FROM dbo.ZHJK_ProductCategory WHERE ParentId=1


SELECT p.Id,p.ProductName,p.CategoryId,pm.ImgUrl,pc.CategoryName,
	   ROW_NUMBER()OVER(ORDER BY p.CreateTime DESC) AS RowNumber
FROM dbo.ZHJK_Products(NOLOCK) p
JOIN dbo.ZHJK_ProductImage(NOLOCK) pm ON pm.ProductId=p.Id AND pm.IsCover=1 AND pm.IsDel=0
JOIN dbo.ZHJK_ProductCategory(NOLOCK) pc ON p.CategoryId=pc.Id AND pc.IsDel=0
WHERE p.IsDel=0 AND p.CategoryId = 1 OR pc.ParentId=1

SELECT pc.Id,pc.CategoryName,pc.ParentId,pc.ImgUrl 
FROM dbo.ZHJK_ProductCategory(NOLOCK) pc
WHERE pc.Id IN(
	SELECT p.CategoryId FROM dbo.ZHJK_Products(NOLOCK) p WHERE p.Id=1
)


SELECT	p.*,pd.Content,pm.ImgUrl,pm.Sort,pm.IsCover
FROM	dbo.ZHJK_Products(NOLOCK) p
JOIN	dbo.ZHJK_ProductDetail(NOLOCK) pd ON pd.ProductId=p.Id AND pd.IsDel=0
JOIN	dbo.ZHJK_ProductImage(NOLOCK) pm ON pm.ProductId=p.Id AND pm.IsDel=0 AND pm.IsCover=1
WHERE	p.Id=1 AND p.IsDel=0

SELECT * FROM dbo.ZHJK_ProductCategory


SELECT * FROM dbo.ZHJK_TechnologyCategory WHERE Id=6

SELECT tp.Id ,
       tp.CategoryId ,
       tp.TechnologyName,
       tp.Summary ,
       tp.Content ,
       tp.CreateTime,tc.Name AS CategoryName 
FROM dbo.ZHJK_TechnologyProducts(NOLOCK) tp
JOIN dbo.ZHJK_TechnologyCategory(NOLOCK) tc ON tp.CategoryId=tc.Id
WHERE tp.CategoryId=6 AND tp.IsDel=0


SELECT TOP 2 Id,ImgUrl,Title,Summary 
FROM dbo.ZHJK_News(NOLOCK)
WHERE IsRecommand=1 AND IsDel=0
ORDER BY CreateTime DESC 

SELECT * FROM dbo.ZHJK_TechnologyProducts

SELECT sp.*,sm.ImgUrl 
FROM dbo.ZHJK_SolutionProducts(NOLOCK) sp
JOIN dbo.ZHJK_SolutionImage(NOLOCK) sm ON sm.SolutionId=sp.Id AND sm.IsCover=1 AND sm.IsDel=0
WHERE sp.IsRecommand=1 AND sp.IsDel=0
ORDER BY sp.CreateTime DESC

SELECT * FROM dbo.ZHJK_CustomerService

SELECT * FROM dbo.ZHJK_AboutUsCategory

SELECT *
FROM dbo.ZHJK_News(NOLOCK)
WHERE IsDel=0 
ORDER BY CreateTime DESC

SELECT * FROM dbo.ZHJK_CustomerServiceCategory
SELECT * FROM dbo.ZHJK_CustomerService


SELECT cs.CategoryId,cs.Content,cc.CategoryName,cc.ImgUrl
FROM dbo.ZHJK_CustomerService(NOLOCK) cs
JOIN dbo.ZHJK_CustomerServiceCategory(NOLOCK) cc ON cs.CategoryId=cc.Id AND cc.IsDel=0
WHERE cs.CategoryId IN(
	SELECT csc.Id FROM dbo.ZHJK_CustomerServiceCategory(NOLOCK) csc 
	WHERE csc.ParentId = 2 AND csc.IsDel=0
)


SELECT * FROM dbo.ZHJK_TechnologyCategory

WITH category_cte AS
(
	SELECT Id,Name,Summary,ImgUrl,ParentId,RedirectUrl,CreateTime
	FROM [dbo].ZHJK_TechnologyCategory(NOLOCK)
	WHERE Id = 4 AND IsDel = 0
)
SELECT cte.*,sc.Name AS ParentName 
FROM category_cte AS cte
LEFT JOIN dbo.ZHJK_TechnologyCategory(NOLOCK) sc ON sc.Id=cte.ParentId


SELECT sp.Id ,
       sp.CategoryId ,
       sp.SolutionName ,
       sp.AirVolumn ,
       sp.Temperature ,
       sp.Component ,
       sp.VOCs ,
       sp.Particulate ,
       sp.ProduceCondition ,
       sp.TreatmentProcess ,
       sp.InvoledIndustry ,
       sp.CreateTime,si.ImgUrl ,
       sp.UpdateTime,sc.CategoryName,
	   ROW_NUMBER()OVER(ORDER BY sp.CreateTime DESC) AS RowNumber
FROM dbo.ZHJK_SolutionProducts(NOLOCK) sp
JOIN dbo.ZHJK_SolutionCategory(NOLOCK) sc ON sp.CategoryId=sc.Id AND sc.IsDel=0
LEFT JOIN dbo.ZHJK_SolutionImage(NOLOCK) si ON si.SolutionId=sp.Id AND si.IsDel=0 AND si.IsCover=1
WHERE sp.IsDel=0   AND (sp.CategoryId={0} OR sc.ParentId={0}



SELECT tp.Id ,tp.CategoryId,tp.Summary,tp.Content,ti.ImgUrl ,
       tp.CreateTime,tc.Name AS CategoryName,tc.ImgUrl,tp.TechnologyName,tp.IsRecommand,
	   ROW_NUMBER()OVER(ORDER BY tp.CreateTime DESC) AS RowNumber 
FROM dbo.ZHJK_TechnologyProducts(NOLOCK) tp
JOIN dbo.ZHJK_TechnologyCategory(NOLOCK) tc ON tp.CategoryId=tc.Id
JOIN dbo.ZHJK_TechnologyImage(NOLOCK) ti ON ti.TechnologyId=tp.Id AND ti.IsCover=1 AND ti.IsDel=0
WHERE tp.IsDel=0    AND (tp.CategoryId=4 OR tc.ParentId=4)


SELECT * FROM dbo.ZHJK_TechnologyCategory


SELECT * 
FROM dbo.ZHJK_Dictionary(NOLOCK)
WHERE TypeId=0 AND IsDel=0

INSERT INTO dbo.ZHJK_Dictionary(Name,TypeId,Sort)
VALUES(Name,TypeId,Sort)

UPDATE dbo.ZHJK_Dictionary SET Name=@Name,Sort=@Sort
WHERE Id=@Id

SELECT *	 
FROM [dbo].[ZHJK_ServiceAfter]


SELECT * FROM dbo.ZHJK_TechLinkedProducts



SELECT	tlp.Id,tlp.TechnologyId,tlp.ProductId,tlp.Sort,tlp.CreateTime,
		tp.TechnologyName,p.ProductName,pm.ImgUrl
FROM	dbo.ZHJK_TechLinkedProducts(NOLOCK) tlp
JOIN	dbo.ZHJK_TechnologyProducts(NOLOCK) tp ON tlp.TechnologyId=tp.Id AND tp.IsDel=0
JOIN	dbo.ZHJK_Products(NOLOCK) p ON tlp.ProductId=p.Id AND p.IsDel=0
JOIN	dbo.ZHJK_ProductImage(NOLOCK) pm ON pm.ProductId=p.Id AND pm.IsDel=0 AND pm.IsCover=1
WHERE   tlp.TechnologyId ={0} AND tlp.IsDel=0 
ORDER BY tlp.CreateTime DESC


SELECT ts.Id,ts.TechnologyId,ts.SolutionId,ts.Sort,ts.CreateTime,
		sp.SolutionName,tp.TechnologyName,si.ImgUrl
FROM dbo.ZHJK_TechLinkedSolutions(NOLOCK) ts
JOIN dbo.ZHJK_TechnologyProducts(NOLOCK) tp ON ts.TechnologyId=tp.Id AND tp.IsDel=0
JOIN dbo.ZHJK_SolutionProducts(NOLOCK) sp ON ts.SolutionId=sp.Id AND sp.IsDel=0
JOIN dbo.ZHJK_SolutionImage(NOLOCK) si ON si.SolutionId=sp.Id AND si.IsDel=0 AND si.IsCover=1
WHERE ts.IsDel=0 AND ts.TechnologyId=0 
ORDER BY ts.CreateTime DESC


INSERT INTO dbo.ZHJK_TechLinkedSolutions(SolutionId,TechnologyId,Sort)
VALUES(@SolutionId,@TechnologyId,@Sort)



SELECT	tlp.Id,tlp.TechnologyId,tlp.ProductId,tlp.Sort,tlp.CreateTime,
		tp.TechnologyName,p.ProductName,pm.ImgUrl
FROM	dbo.ZHJK_TechLinkedProducts(NOLOCK) tlp
JOIN	dbo.ZHJK_TechnologyProducts(NOLOCK) tp ON tlp.TechnologyId=tp.Id AND tp.IsDel=0
JOIN	dbo.ZHJK_Products(NOLOCK) p ON tlp.ProductId=p.Id AND p.IsDel=0
JOIN	dbo.ZHJK_ProductImage(NOLOCK) pm ON pm.ProductId=p.Id AND pm.IsDel=0 AND pm.IsCover=1
WHERE   tlp.TechnologyId =1 AND tlp.IsDel=0 
ORDER BY tlp.CreateTime DESC

SELECT * FROM dbo.ZHJK_SolutionCategory


SELECT p.Id ,
       p.CategoryId ,
       p.ProductName ,
       p.Models ,
       p.Manufacturer ,
       p.CreateTime ,
       pc.CategoryName,
	   pm.ImgUrl,
	   CASE WHEN tlp.Id IS NOT NULL THEN '<font color=red>已加入</font>' ELSE '' END AS JoinStatus,
	   ROW_NUMBER()OVER(ORDER BY p.CreateTime DESC) AS RowNumber
FROM	dbo.ZHJK_Products(NOLOCK) p
JOIN	dbo.ZHJK_ProductCategory(NOLOCK) pc ON p.CategoryId=pc.Id AND pc.IsDel=0
JOIN	dbo.ZHJK_ProductImage(NOLOCK) pm ON pm.ProductId=p.Id AND pm.IsDel=0 AND pm.IsCover=1
LEFT JOIN dbo.ZHJK_TechLinkedProducts(NOLOCK) tlp ON tlp.ProductId =p.Id AND tlp.IsDel=0 AND tlp.TechnologyId=1
WHERE p.IsDel=0


SELECT sp.Id,sp.SolutionName,sp.Component,sp.AirVolumn,sp.CreateTime,sp.CategoryId,si.ImgUrl,
	   sc.CategoryName,CASE WHEN tls.Id IS NOT NULL THEN '<font color=red>已加入</font>' ELSE '' END AS JoinStatus,
	   ROW_NUMBER()OVER(ORDER BY sp.CreateTime DESC) AS RowNumber,tls.Id,tls.TechnologyId,tls.SolutionId
FROM dbo.ZHJK_SolutionProducts(NOLOCK) sp
JOIN dbo.ZHJK_SolutionCategory(NOLOCK) sc ON sp.CategoryId=sc.Id AND sc.IsDel=0
JOIN dbo.ZHJK_SolutionImage(NOLOCK) si ON si.SolutionId=sp.Id AND si.IsDel=0 AND si.IsCover=1
LEFT JOIN dbo.ZHJK_TechLinkedSolutions(NOLOCK) tls ON tls.SolutionId=sp.Id AND tls.IsDel=0 AND tls.TechnologyId=1
WHERE sp.IsDel=0 AND sp.CategoryId=0 AND sp.SolutionName LIKE '%%'

SELECT * FROM dbo.ZHJK_TechLinkedSolutions

TRUNCATE TABLE dbo.ZHJK_TechLinkedSolutions

SELECT * FROM dbo.ZHJK_ProductCase

SELECT lt.Id,lt.TechnologyId,lt.ProductId,tp.TechnologyName,p.ProductName,ti.ImgUrl,lt.CreateTime 
FROM dbo.ZHJK_LinkedTechnology(NOLOCK) lt
JOIN dbo.ZHJK_TechnologyProducts(NOLOCK) tp ON lt.TechnologyId=tp.Id AND tp.IsDel=0
JOIN dbo.ZHJK_Products(NOLOCK) p ON lt.ProductId=p.Id AND p.IsDel=0
JOIN dbo.ZHJK_TechnologyImage(NOLOCK) ti ON ti.TechnologyId=tp.Id AND ti.IsDel=0 AND ti.IsCover=1
WHERE lt.ProductId=1 AND lt.IsDel=0
ORDER BY lt.CreateTime DESC

SELECT * FROM dbo.ZHJK_LinkedTechnology

INSERT INTO dbo.ZHJK_LinkedTechnology(ProductId,TechnologyId,Sort)
VALUES(@ProductId,@TechnologyId,@Sort)

SELECT tp.Id,tp.TechnologyName,tc.Name AS CategoryName,tp.CreateTime,tp.CategoryId,
	   ti.ImgUrl,CASE WHEN lt.Id IS NOT NULL THEN '<font color=red>已加入</font>' ELSE '' END AS JoinStatus,
	   ROW_NUMBER()OVER(ORDER BY tp.CreateTime DESC) AS RowNumber,lt.TechnologyId,lt.ProductId
FROM dbo.ZHJK_TechnologyProducts(NOLOCK) tp 
JOIN dbo.ZHJK_TechnologyCategory(NOLOCK) tc ON tp.CategoryId=tc.Id AND tc.IsDel=0
JOIN dbo.ZHJK_TechnologyImage(NOLOCK) ti ON ti.TechnologyId=tp.Id AND ti.IsDel=0 AND ti.IsCover=1
LEFT JOIN dbo.ZHJK_LinkedTechnology(NOLOCK) lt ON lt.TechnologyId=tp.Id AND lt.IsDel=0 AND lt.ProductId=0
WHERE tp.IsDel=0 AND tp.CategoryId=0 AND tp.TechnologyName LIKE '%%'


SELECT ls.Id,ls.ProductId,ls.SolutionId,sp.SolutionName,si.ImgUrl,p.ProductName,ls.CreateTime 
FROM dbo.ZHJK_LinkedSolution(NOLOCK) ls
JOIN dbo.ZHJK_SolutionProducts(NOLOCK) sp ON ls.SolutionId=sp.Id AND sp.IsDel=0
JOIN dbo.ZHJK_Products(NOLOCK) p ON ls.ProductId=p.Id AND p.IsDel=0
JOIN dbo.ZHJK_SolutionImage(NOLOCK) si ON si.SolutionId=sp.Id AND si.IsDel=0 AND si.IsCover=1
WHERE ls.ProductId=0 AND ls.IsDel=0
ORDER BY ls.CreateTime DESC 



SELECT sp.Id,sp.CategoryId,sp.SolutionName,sc.CategoryName,sp.CreateTime,si.ImgUrl,
	   CASE WHEN ls.Id IS NOT NULL THEN '<font color=red>已加入</font>' ELSE '' END AS JoinStatus,
	   ROW_NUMBER()OVER(ORDER BY sp.CreateTime DESC) AS RowNumber,ls.ProductId,ls.SolutionId
FROM dbo.ZHJK_SolutionProducts(NOLOCK) sp 
JOIN dbo.ZHJK_SolutionCategory(NOLOCK) sc ON sp.CategoryId=sc.Id AND sc.IsDel=0
JOIN dbo.ZHJK_SolutionImage(NOLOCK) si ON si.SolutionId=sp.Id AND si.IsDel=0 AND si.IsCover=1
LEFT JOIN dbo.ZHJK_LinkedSolution(NOLOCK) ls ON ls.SolutionId=sp.Id AND ls.IsDel=0 AND ls.ProductId=0
WHERE sp.IsDel=0 AND sp.CategoryId=0 AND sp.SolutionName LIKE ''


INSERT INTO dbo.ZHJK_LinkedSolution(SolutionId,ProductId,Sort)
VALUES(@SolutionId,@ProductId,@Sort)

DELETE FROM dbo.ZHJK_LinkedSolution WHERE Id=0


SELECT slp.Id,slp.SolutionId,slp.ProductId,sp.SolutionName,p.ProductName,pm.ImgUrl 
FROM dbo.ZHJK_SolutionLinkedProducts(NOLOCK) slp
JOIN dbo.ZHJK_SolutionProducts(NOLOCK) sp ON slp.SolutionId=sp.Id AND slp.IsDel=0
JOIN dbo.ZHJK_Products(NOLOCK) p ON slp.ProductId=p.Id AND p.IsDel=0 
JOIN dbo.ZHJK_ProductImage(NOLOCK) pm ON pm.ProductId=p.Id AND pm.IsDel=0 AND pm.IsCover=1
WHERE slp.SolutionId=0 AND slp.IsDel=0


INSERT INTO dbo.ZHJK_SolutionLinkedProducts(SolutionId,ProductId,Sort)
VALUES(@SolutionId,@ProductId,@Sort)

DELETE FROM dbo.ZHJK_SolutionLinkedProducts WHERE Id=0


SELECT p.Id,p.CategoryId,p.ProductName,p.Models,pc.CategoryName,pm.ImgUrl,
	   CASE WHEN slp.Id IS NOT NULL THEN '<font color=red>已加入</font>' ELSE '' END AS JoinStatus,
	   ROW_NUMBER()OVER(ORDER BY p.CreateTime DESC) AS RowNumber
FROM dbo.ZHJK_Products(NOLOCK) p
JOIN dbo.ZHJK_ProductCategory(NOLOCK) pc ON p.CategoryId=pc.Id AND pc.IsDel=0
JOIN dbo.ZHJK_ProductImage(NOLOCK) pm ON pm.ProductId=p.Id AND pm.IsDel=0 AND pm.IsCover=1
LEFT JOIN dbo.ZHJK_SolutionLinkedProducts(NOLOCK) slp ON slp.ProductId=p.Id AND slp.SolutionId=0
WHERE p.IsDel=0 AND p.CategoryId=0 AND p.ProductName LIKE '%%'


SELECT slp.Id,slp.SolutionId,slp.ProductId,sp.SolutionName,p.ProductName,pm.ImgUrl,slp.CreateTime 
FROM dbo.ZHJK_SolutionLinkedProducts(NOLOCK) slp
JOIN dbo.ZHJK_SolutionProducts(NOLOCK) sp ON slp.SolutionId=sp.Id AND slp.IsDel=0
JOIN dbo.ZHJK_Products(NOLOCK) p ON slp.ProductId=p.Id AND p.IsDel=0 
JOIN dbo.ZHJK_ProductImage(NOLOCK) pm ON pm.ProductId=p.Id AND pm.IsDel=0 AND pm.IsCover=1
WHERE slp.SolutionId=1 AND slp.IsDel=0

SELECT * FROM dbo.ZHJK_SolutionLinkedProducts

SELECT * FROM dbo.ZHJK_SolutionLinkedTechnology

INSERT INTO dbo.ZHJK_SolutionLinkedTechnology(SolutionId,TechnologyId,Sort)
VALUES(@SolutionId,@TechnologyId,@Sort)

DELETE FROM dbo.ZHJK_SolutionLinkedTechnology WHERE Id=0


SELECT slt.Id,slt.SolutionId,slt.TechnologyId,slt.CreateTime,sp.SolutionName,tp.TechnologyName,ti.ImgUrl
FROM dbo.ZHJK_SolutionLinkedTechnology(NOLOCK) slt
JOIN dbo.ZHJK_SolutionProducts(NOLOCK) sp ON slt.SolutionId=sp.Id AND sp.IsDel=0
JOIN dbo.ZHJK_TechnologyProducts(NOLOCK) tp ON slt.TechnologyId=tp.Id AND tp.IsDel=0
JOIN dbo.ZHJK_TechnologyImage(NOLOCK) ti ON ti.TechnologyId=tp.Id AND ti.IsDel=0 AND ti.IsCover=1
WHERE slt.SolutionId=1 AND slt.IsDel=0


SELECT tp.Id,tp.CategoryId,tp.TechnologyName,tc.Name AS CategoryName,ti.ImgUrl,
	   CASE WHEN slt.Id IS NOT NULL THEN '' ELSE '' END AS JoinStatus,
	   ROW_NUMBER()OVER(ORDER BY tp.CreateTime DESC) AS RowNumber
FROM dbo.ZHJK_TechnologyProducts(NOLOCK) tp
JOIN dbo.ZHJK_TechnologyCategory(NOLOCK) tc ON tp.CategoryId=tc.Id AND tc.IsDel=0
JOIN dbo.ZHJK_TechnologyImage(NOLOCK) ti ON ti.TechnologyId=tp.Id AND ti.IsDel=0 AND ti.IsCover=1
LEFT JOIN dbo.ZHJK_SolutionLinkedTechnology(NOLOCK) slt ON slt.TechnologyId=tp.Id AND slt.SolutionId=1
WHERE tp.IsDel=0 AND tp.CategoryId=0 AND tp.TechnologyName LIKE '%%'

SELECT * FROM dbo.ZHJK_SolutionLinkedTechnology
SELECT * FROM dbo.ZHJK_TechnologyProducts WHERE Id =7



SELECT tp.Id,tp.CategoryId,tp.TechnologyName,tc.Name AS CategoryName,ti.ImgUrl,
	   CASE WHEN slt.Id IS NOT NULL THEN '<font color=red>已加入</font>' ELSE '' END AS JoinStatus,tp.CreateTime,
	   ROW_NUMBER()OVER(ORDER BY tp.CreateTime DESC) AS RowNumber
FROM dbo.ZHJK_TechnologyProducts(NOLOCK) tp
JOIN dbo.ZHJK_TechnologyCategory(NOLOCK) tc ON tp.CategoryId=tc.Id AND tc.IsDel=0
JOIN dbo.ZHJK_TechnologyImage(NOLOCK) ti ON ti.TechnologyId=tp.Id AND ti.IsDel=0 AND ti.IsCover=1
LEFT JOIN dbo.ZHJK_SolutionLinkedTechnology(NOLOCK) slt ON slt.TechnologyId=tp.Id AND slt.SolutionId=1
WHERE tp.IsDel=0  




SELECT pc.Id,pc.ImgUrl,pc.Company,pc.CaseName
FROM dbo.ZHJK_ProductCase(NOLOCK) pc
WHERE pc.ProductId=1 AND pc.IsDel=0
ORDER BY pc.CreateTime


SELECT * FROM dbo.ZHJK_Qulification
WHERE IsDel=0 AND Category=''


SELECT Id,Name,ImgUrl,GrayImgUrl,Sort,CreateTime,Category
FROM dbo.ZHJK_Qulification(NOLOCK)
WHERE IsDel=0     AND Category='Banner'
ORDER BY CreateTime DESC,Sort ASC


SELECT p.Id,p.ProductName,pm.ImgUrl 
FROM dbo.ZHJK_Products(NOLOCK) p
JOIN dbo.ZHJK_ProductImage(NOLOCK) pm ON pm.ProductId=p.Id AND pm.IsDel=0 AND pm.IsCover=1
WHERE p.CategoryId=0 AND p.IsDel=0


SELECT sa.Id,sa.CompanyName,sa.Chargor,sa.ContactAddress,sa.Email,sa.Mobile,sa.Tel,sa.Fax,
sa.ProductModel,sa.FilePath,sa.Content,sa.ProductId,
( 
	SELECT STUFF(CONVERT(VARCHAR(100),(
		SELECT ',' + d.Name
		FROM dbo.ZHJK_Dictionary(NOLOCK) d 
		JOIN (SELECT Result FROM dbo.Fun_SplitStr(sa.ExceptionId,',')) t ON d.Id=t.Result
		FOR XML PATH('')
	)),1,1,'')
) AS ExceptionName
FROM dbo.ZHJK_ServiceAfter(NOLOCK) sa
WHERE sa.IsDel=0
ORDER BY sa.CreateTime DESC


SELECT ','+Name FROM dbo.ZHJK_Dictionary WHERE Id IN(1,6,9) FOR XML PATH('')


SELECT STUFF(CONVERT(VARCHAR(500), ( SELECT TOP 10
',' + BG_Country
FROM dbo.BS_Budget
FOR XML PATH('')
)), 1, 1, '')


SELECT SUBSTRING(ExceptionId,CHARINDEX(',',ExceptionId),1)
FROM dbo.ZHJK_ServiceAfter

SELECT * 
FROM ZHJK_ServiceAfter

SELECT * FROM dbo.ZHJK_Dictionary d
JOIN (
SELECT Result FROM dbo.Fun_SplitStr('1,6,9',',')
) s ON d.Id=s.Result


USE CmmoocCourse
GO


SELECT * FROM CmmoocUserCenter.dbo.US_UserCenter WHERE NickName ='北演'

SELECT * FROM dbo.KC_UserStudyRecord ORDER BY CreateTime DESC


SELECT * FROM dbo.US_UserCenter WHERE UserNo ='CB29E9D1-1012-4713-A7AE-166EED428309'


SELECT Id,Content,CategoryId,Sort,CreateTime,c.CategoryName
FROM dbo.ZHJK_PartyBuild(NOLOCK) pb
JOIN  dbo.ZHJK_AboutUsCategory(NOLOCK) c ON pb.CategoryId=c.Id AND c.IsDel=0
WHERE Id=0 AND pb.IsDel=0
 
 USE CentralBuild
 GO
 

 SELECT * FROM CentralBuild.dbo.ZHJK_News

 SELECT pb.Id,pb.Content,pb.CategoryId,pb.Sort,c.CategoryName,pb.CreateTime 
 FROM dbo.ZHJK_PartyBuild(NOLOCK) pb
 JOIN dbo.ZHJK_AboutUsCategory(NOLOCK) c ON pb.CategoryId=c.Id AND c.IsDel=0
 WHERE pb.IsDel=0 AND pb.CategoryId=0


 SELECT　* FROM CentralBuild.dbo.ZHJK_AboutUsCategory


 SELECT * FROM [dbo].[ZHJK_MainBusinessCategory]

 SELECT mp.Id,mp.CategoryId,mp.ProductName,mp.AirVolumn,mp.Temperature ,
       mp.Component,mp.VOCs,mp.Particulate,mp.ProduceCondition ,mp.TreatmentProcess ,
       mp.InvoledIndustry ,mp.CreateTime ,md.Content,mp.UpdateTime,mc.CategoryName,mi.ImgUrl
 FROM [dbo].[ZHJK_MainBusinessProducts](NOLOCK) mp
 JOIN [dbo].[ZHJK_MainBusinessCategory](NOLOCK) mc ON mp.CategoryId=mc.Id AND mc.IsDel=0
 JOIN [dbo].[ZHJK_MainBusinessDetail](NOLOCK) md ON md.BusinessId=mp.Id AND md.IsDel=0
 LEFT JOIN [dbo].[ZHJK_MainBusinessImage](NOLOCK) mi ON mi.BusinessId=mp.Id AND mI.IsDel=0 AND mi.IsCover=1
 WHERE mp.IsDel=0 AND mp.Id=0



  SELECT mp.Id,mp.CategoryId,mp.ProductName,mp.AirVolumn,mp.Temperature ,
       mp.Component,mp.VOCs,mp.Particulate,mp.ProduceCondition ,mp.TreatmentProcess ,
       mp.InvoledIndustry ,mp.CreateTime ,md.Content,mp.UpdateTime,mc.CategoryName
 FROM [dbo].[ZHJK_MainBusinessProducts](NOLOCK) mp
 JOIN [dbo].[ZHJK_MainBusinessCategory](NOLOCK) mc ON mp.CategoryId=mc.Id AND mc.IsDel=0
 LEFT JOIN [dbo].[ZHJK_MainBusinessDetail](NOLOCK) md ON md.BusinessId=mp.Id AND md.IsDel=0
 WHERE mp.IsDel=0 AND mp.Id=1

 SELECT Id,CategoryName
FROM dbo.ZHJK_AboutUsCategory(NOLOCK) WHERE ParentId =
(
	SELECT Id FROM dbo.ZHJK_AboutUsCategory(NOLOCK) WHERE CategoryName = '党建工作'
) AND IsDel = 0


SELECT Id,Content,CategoryId FROM dbo.ZHJK_PartyBuild(NOLOCK)
WHERE CategoryId = (
	SELECT TOP 1 ac.Id FROM dbo.ZHJK_AboutUsCategory(NOLOCK) ac WHERE ac.ParentId=(
		SELECT c.Id FROM dbo.ZHJK_AboutUsCategory(NOLOCK) c WHERE c.CategoryName='党建工作' AND c.IsDel=0
	)
)

SELECT * FROM dbo.ZHJK_PartyBuild


SELECT  TOP 1 * FROM dbo.ZHJK_CustomerServiceCategory(NOLOCK) c1
WHERE c1.ParentId =
(
	SELECT 1 FROM dbo.ZHJK_CustomerServiceCategory(NOLOCK) c2 WHERE c2.CategoryName='' 
)

SELECT TOP 1 Id,CategoryName,ImgUrl,Summary,ParentId
FROM dbo.ZHJK_CustomerServiceCategory(NOLOCK)
WHERE IsDel=0


SELECT * FROM dbo.ZHJK_AboutUsCategory

SELECT * FROM dbo.ZHJK_Qulification

SELECT hi.Id,hi.Name,hi.ImgUrl,hi.CategoryId,hi.Sort,ac.CategoryName 
FROM dbo.ZHJK_HonorImage(NOLOCK) hi 
JOIN dbo.ZHJK_AboutUsCategory(NOLOCK) ac ON hi.CategoryId=ac.Id AND ac.IsDel=0
WHERE hi.Id=0 AND hi.IsDel=0

SELECT * FROM ZHJK_HonorImage

SELECT * FROM dbo.ZHJK_News

SELECT Id,CategoryName,ParentId,Sort,RedirectUrl,CreateTime 
FROM [dbo].[ZHJK_AboutUsCategory](NOLOCK)  WHERE Id = 4 AND IsDel = 0



SELECT pb.Id,pb.Content,pb.CategoryId,pb.Sort,pb.CreateTime,c.CategoryName,
pb.Title,pb.Summary,pb.ImgUrl,pb.Author,pb.SourceFrom,pb.ViewNumber,pb.UpdateTime,
ROW_NUMBER()OVER(ORDER BY pb.CreateTime DESC) AS RowNumber 
FROM dbo.ZHJK_PartyBuild(NOLOCK) pb
JOIN  dbo.ZHJK_AboutUsCategory(NOLOCK) c ON pb.CategoryId=c.Id AND c.IsDel=0
WHERE  pb.IsDel=0


SELECT TOP 1 Id,CategoryName,ImgUrl,Summary,ParentId
FROM dbo.ZHJK_CustomerServiceCategory(NOLOCK)
WHERE IsDel=0
ORDER BY Sort ASC


SELECT * FROM dbo.ZHJK_MainBusinessProducts


SELECT * FROM dbo.ZHJK_MainBusinessCategory
SELECT * FROM dbo.ZHJK_SolutionCategory
SELECT * FROM dbo.ZHJK_TechnologyCategory

ALTER TABLE dbo.ZHJK_TechnologyCategory ADD Sort INT NOT NULL DEFAULT(0)


select * from ERPLanEmail
SELECT * FROM ERPRiZhi ORDER BY TimeStr DESC


select * from ERPSystemSetting where FileType like '%|txt|%'


SELECT * FROM ERPCustomInfo


USE [YH.WebSite]
GO 

SELECT Id
FROM dbo.YH_Admin(NOLOCK)

SELECT UpdateTime=GETDATE(),* FROM dbo.YH_AboutUs

SELECT Id,Content,CreateTime,UpdateTime 
FROM dbo.YH_AboutUs(NOLOCK)

SELECT* FROM dbo.YH_Contact


SELECT Id,Email,QQ,JobEmail,FeedbackEmail,Addresss,CreateTime,UpdateTime
FROM dbo.YH_Contact(NOLOCK)


SELECT s.Id,s.CategoryId,d.Name AS CategoryName,s.ImageName,s.ImageUrl,s.Sort,s.IsDel,s.CreateTime,
	   ROW_NUMBER()OVER(ORDER BY s.CreateTime DESC) AS RowNumber 
FROM dbo.YH_SiteImage(NOLOCK) s
JOIN dbo.YH_Dictionary(NOLOCK) d ON s.CategoryId=d.Id AND d.IsDel=0
WHERE s.IsDel=0 AND s.CategoryId=0

INSERT INTO dbo.YH_SiteImage(CategoryId,ImageName,ImageUrl,Sort)
VALUES(@CategoryId,@ImageName,@ImageUrl,@Sort)

UPDATE dbo.YH_SiteImage SET CategoryId=@CategoryId,ImageName=@ImageName,
ImageUrl=@ImageUrl,Sort=@Sort
WHERE Id=@Id

UPDATE dbo.YH_SiteImage SET IsDel=1 WHERE Id=0

SELECT * FROM dbo.YH_SiteImage

SELECT * FROM dbo.YH_Dictionary

INSERT INTO dbo.YH_Dictionary(Name,ParentId,Sort)
VALUES(@Name,@ParentId,@Sort)

UPDATE dbo.YH_Dictionary SET Name=@Name,ParentId=@ParentId,
Sort=@Sort WHERE Id=@Id

UPDATE dbo.YH_Dictionary SET IsDel=0 WHERE Id=0


SELECT Id,Name,ParentId,Sort,CreateTime 
FROM dbo.YH_Dictionary(NOLOCK)
WHERE ParentId=0 AND IsDel=0

SELECT Id,Name,Sort 
FROM dbo.YH_Dictionary(NOLOCK)
WHERE ParentId = (
	SELECT Id FROM dbo.YH_Dictionary(NOLOCK) WHERE Name=''
)


SELECT s.Id,s.CategoryId,d.Name AS CategoryName,s.ImageName,s.ImageUrl,s.Sort,s.IsDel,s.CreateTime,
	   ,s.LinkUrl,s.Description,ROW_NUMBER()OVER(ORDER BY s.CreateTime DESC) AS RowNumber 
FROM dbo.YH_SiteImage(NOLOCK) s
JOIN dbo.YH_Dictionary(NOLOCK) d ON s.CategoryId=d.Id AND d.IsDel=0  WHERE s.IsDel=0 


SELECT s.Id,s.CategoryId,d.Name AS CategoryName,s.ImageName,s.ImageUrl,s.Sort,s.IsDel,s.CreateTime 
,s.LinkUrl,s.Description   
FROM dbo.YH_SiteImage(NOLOCK) s
JOIN dbo.YH_Dictionary(NOLOCK) d ON s.CategoryId=d.Id AND d.IsDel=0
WHERE s.Id=0


SELECT* FROM dbo.YH_Admin

SELECT * FROM dbo.YH_CaseTag
SELECT * FROM dbo.YH_CaseInfo

UPDATE dbo.YH_CaseTag SET TagName='',TagIcon='',
Sort=@Sort  WHERE Id =@Id

UPDATE dbo.YH_CaseTag SET IsDel=1 WHERE Id=0

SELECT Id,TagName,TagIcon,Sort,IsDel,CreateTime
FROM dbo.YH_CaseTag(NOLOCK)
WHERE IsDel=0


SELECT Id,TagId,Summary,Content,IsDel,CreateTime 
FROM dbo.YH_CaseInfo(NOLOCK)
WHERE IsDel=0

UPDATE dbo.YH_CaseInfo SET IsDel=1 WHERE Id=0


SELECT ci.Id,ci.TagId,ct.TagName,ci.Summary,ci.Content,ci.IsDel,ci.CreateTime 
FROM dbo.YH_CaseInfo(NOLOCK) ci
JOIN dbo.YH_CaseTag(NOLOCK) ct ON ci.TagId=ct.Id AND ct.IsDel=0
WHERE ci.IsDel=0 AND ci.TagId=0


SELECT TOP 1 Id,Title,'Prev' AS Tag FROM dbo.YH_News(NOLOCK) WHERE Id<1 AND IsDel=0
UNION ALL
SELECT TOP 1 Id,Title,'Next' AS Tag FROM dbo.YH_News(NOLOCK) WHERE Id>1 AND IsDel=0


SELECT Id,Name,Sort 
FROM dbo.YH_Dictionary(NOLOCK)
WHERE ParentId = (
	SELECT Id FROM dbo.YH_Dictionary(NOLOCK) WHERE Name='Banner图'
)


SELECT TOP 3 Id,Title,ImageUrl,Summary
FROM dbo.YH_News(NOLOCK)
WHERE IsTop=1 AND IsDel=0
ORDER BY CreateTime DESC


SELECT * FROM dbo.YH_CaseTag

SELECT * FROM dbo.YH_AboutUs

SELECT* FROM dbo.YH_News WHERE IsDel=0

SELECT TOP 1 Id,Title,'Prev' AS Tag FROM dbo.YH_News(NOLOCK) WHERE Id<12 AND IsDel=0 ORDER BY Id DESC
UNION ALL
SELECT TOP 1 Id,Title,'Next' AS Tag FROM dbo.YH_News(NOLOCK) WHERE Id>12 AND IsDel=0 ORDER BY Id ASC


WITH t AS 
(
	SELECT Id,Title,ROW_NUMBER()OVER(ORDER BY Id) AS rownumber FROM dbo.YH_News(NOLOCK)WHERE IsDel=0
)
--SELECT * FROM t

SELECT t.Id,t.Title FROM t WHERE t.rownumber=(SELECT t.rownumber+1 FROM t WHERE t.Id=2)
UNION ALL
SELECT t.Id,t.Title FROM t WHERE t.rownumber=(SELECT t.rownumber-1 FROM t WHERE t.Id=2)
