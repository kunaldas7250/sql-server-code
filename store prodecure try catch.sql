
SELECT 
    FORMAT(g.Launched_at, 'dd-MMMM-yyyy') AS [Launch date],
    g.Company_Name,
    string_agg(t.Techuse,',') as [Tech],
   string_agg(gp.name,',')as [name],
    string_agg(rp.Player_position,',')as [postion]
FROM onf.Gamecompany AS g
JOIN onf.Tech_use AS t
    ON g.id = t.Gamecompany_id
JOIN tnf.Game_Player AS gp
    ON t.Player_id = gp.Player_id
JOIN tnf.Rank_Player AS rp
    ON gp.Player_Rank = rp.Player_Rank
GROUP BY 
    FORMAT(g.Launched_at, 'dd-MMMM-yyyy'),
    g.Company_Name
    

   CREATE PROCEDURE Game_Details
AS
BEGIN TRY
    SELECT 
        FORMAT(g.Launched_at, 'dd-MMMM-yyyy') AS [Launch date],
        g.Company_Name,
        STRING_AGG(t.Techuse, ', ') AS [Tech],
        STRING_AGG(gp.name, ', ') AS [Name],
        STRING_AGG(rp.Player_position, ', ') AS [Position]
    FROM onf.Gamecompany AS g
    JOIN onf.Tech_use AS t
        ON g.id = t.Gamecompany_id
    JOIN tnf.Game_Player AS gp
        ON t.Player_id = gp.Player_id
    JOIN tnf.Rank_Player AS rp
        ON gp.Player_Rank = rp.Player_Rank
    GROUP BY 
        FORMAT(g.Launched_at, 'dd-MMMM-yyyy'),
        g.Company_Name;
END TRY
BEGIN CATCH
    PRINT 'Something went wrong!';
    PRINT 'Error Message: ' + ERROR_MESSAGE();
END CATCH;


EXEC Game_Details;
