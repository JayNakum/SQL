-- QUERY 1 --
SELECT DEPTNO FROM DEPT
WHERE DEPTNO NOT IN (SELECT DISTINCT DEPTNO FROM EMP);

SELECT DEPT.DEPTNO FROM DEPT 
LEFT JOIN EMP ON DEPT.DEPTNO = EMP.DEPTNO
WHERE EMP_NO IS NULL;

-- QUERY 2 --
SELECT COUNT(DEPTNO), JOB, AVG(SAL) FROM EMP
GROUP BY DEPTNO, JOB;

-- QUERY 3 --
SELECT JOB, MAX(SALARY) MAX_SAL FROM 
(SELECT JOB, AVG(SAL) SALARY FROM EMP 
GROUP BY JOB HAVING JOB <> 'PRESIDENT') AS avg_sal;

-- QUERY 4 --
SELECT * FROM DEPT 
WHERE DEPTNO IN 
(SELECT DEPTNO FROM EMP 
GROUP BY DEPTNO HAVING COUNT(EMP_NO) > 1);

-- QUERY 5 --
SELECT DEPTNO, COUNT(EMP_NO) NO_OF_EMP FROM EMP 
GROUP BY DEPTNO HAVING COUNT(EMP_NO) > 3;

-- QUERY 6 --
SELECT ENAME FROM EMP, 
(SELECT DEPTNO, MAX(SAL) SALARY FROM EMP 
GROUP BY DEPTNO) AS a 
WHERE (EMP.SAL = a.SALARY) AND (EMP.DEPTNO = a.DEPTNO);

-- QUERY 7 --
SELECT DEPTNO, AVG(SAL) FROM EMP 
GROUP BY DEPTNO 
HAVING AVG(SAL) < (SELECT AVG(SAL) FROM EMP);