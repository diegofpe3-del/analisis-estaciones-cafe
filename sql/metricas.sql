CREATE DATABASE vm;
USE vm;


--1. Desempeño Financiero y Operativo Global
SELECT SUM(money) AS Ingresos_Totales_Acumulados,
		   COUNT(*) AS Volumen_Total_Transacciones,
		   AVG(money) AS Ticket_Promedio_Global
FROM VENDING_MACHINES;


SELECT month_year,
		   SUM(money) AS Ingresos_Totales,
		   COUNT(*) AS Volumen_Total,
		   AVG(money) AS Ticket_Promedio
FROM VENDING_MACHINES
GROUP BY month_year
ORDER BY month_year ASC;

--2. Análisis de Tendencias Temporales (Estacionalidad)

--Dia de la semana
SELECT 
    day, 
	  SUM(money) AS Total_ingresos,
    COUNT(*) AS Numero_transacciones,
	  AVG(money) AS Ticket_promedio
FROM VENDING_MACHINES
GROUP BY day, DATEPART(WEEKDAY, date) -- Usamos el número del día para ordenar
ORDER BY DATEPART(WEEKDAY, date) ASC;

--Horas del dia
SELECT 
	DATEPART(HOUR,hour) AS Hora,
	SUM(money) AS Total_ingresos,
  COUNT(*) AS Numero_transacciones,
	AVG(money) AS Ticket_promedio
FROM VENDING_MACHINES
GROUP BY DATEPART(HOUR,hour)
ORDER BY Hora ASC;

--Segmentación del dia (mañana, tarde, noche)
SELECT
	CASE
		WHEN DATEPART(HOUR,hour) BETWEEN 6 AND 11 THEN 'Mañana'
		WHEN DATEPART(HOUR,hour) BETWEEN 12 AND 17 THEN 'Tarde'
		WHEN DATEPART(HOUR,hour) BETWEEN 18 AND 23 THEN 'Noche'
		ELSE 'Madrugada'
	END AS Franja_Horaria,
	SUM(money) AS Total_Ingresos,
	COUNT(*) AS Numero_transacciones,
	AVG(money) AS Ticket_promedio
FROM VENDING_MACHINES
GROUP BY
	CASE
		WHEN DATEPART(HOUR,hour) BETWEEN 6 AND 11 THEN 'Mañana'
		WHEN DATEPART(HOUR,hour) BETWEEN 12 AND 17 THEN 'Tarde'
		WHEN DATEPART(HOUR,hour) BETWEEN 18 AND 23 THEN 'Noche'
		ELSE 'Madrugada'
	END
ORDER BY Total_Ingresos DESC;


--Segmentacion de meses (estaciones)
SELECT
	CASE
		WHEN DATEPART(MONTH,date) BETWEEN 3 AND 5 THEN 'Primavera'
		WHEN DATEPART(MONTH,date) BETWEEN 6 AND 8 THEN 'Verano'
		WHEN DATEPART(MONTH,date) BETWEEN 9 AND 11 THEN 'Otoño'
		ELSE 'Invierno'
	END AS Estacion,
	SUM(money) AS Total_ingresos,
    COUNT(*) AS Numero_transacciones,
	AVG(money) AS Ticket_promedio
FROM VENDING_MACHINES
GROUP BY
	CASE
		WHEN DATEPART(MONTH,date) BETWEEN 3 AND 5 THEN 'Primavera'
		WHEN DATEPART(MONTH,date) BETWEEN 6 AND 8 THEN 'Verano'
		WHEN DATEPART(MONTH,date) BETWEEN 9 AND 11 THEN 'Otoño'
		ELSE 'Invierno'
	END
ORDER BY Total_ingresos DESC;


--3. Preferencias de Portafolio y Mix de Productos
SELECT 
	coffee_name,
	SUM(money) AS Total_ingresos,
	COUNT(*) AS Cantidad_vendida,
	CAST(SUM(money) *100.0/SUM(SUM(money)) OVER() AS DECIMAL(10,2)) AS Participacion,
	ROUND(AVG(money), 2) AS Precio_Promedio
FROM VENDING_MACHINES
GROUP BY coffee_name
ORDER BY Total_ingresos DESC;


--4. Evaluación de Métodos de Pago y Digitalización
SELECT 
	cash_type,
	SUM(money) AS Ingresos,
	CAST(SUM(money) *100.0/SUM(SUM(money)) OVER() AS DECIMAL(10,2)) AS Ratio,
	CAST(AVG(money) AS DECIMAL(10,2)) AS Ticket_promedio
FROM VENDING_MACHINES
GROUP BY cash_type
ORDER BY Ingresos DESC;

--Uso de card o cash segun franja horaria
SELECT
	CASE
		WHEN DATEPART(HOUR,hour) BETWEEN 6 AND 11 THEN 'Mañana'
		WHEN DATEPART(HOUR,hour) BETWEEN 12 AND 17 THEN 'Tarde'
		WHEN DATEPART(HOUR,hour) BETWEEN 18 AND 23 THEN 'Noche'
		ELSE 'Madrugada'
	END AS Franja_Horaria,
	cash_type,
	SUM(money) AS Ingresos,
	CAST(SUM(money) *100.0/SUM(SUM(money)) OVER() AS DECIMAL(10,2)) AS Ratio,
	CAST(AVG(money) AS DECIMAL(10,2)) AS Ticket_promedio
FROM VENDING_MACHINES
GROUP BY
	CASE
		WHEN DATEPART(HOUR,hour) BETWEEN 6 AND 11 THEN 'Mañana'
		WHEN DATEPART(HOUR,hour) BETWEEN 12 AND 17 THEN 'Tarde'
		WHEN DATEPART(HOUR,hour) BETWEEN 18 AND 23 THEN 'Noche'
		ELSE 'Madrugada'
	END,
	cash_type
ORDER BY Franja_Horaria, Ticket_promedio DESC;

--5. Diagnóstico Individual por Punto de Venta (El "Extra")
SELECT 
	machine,
	SUM(money) AS Total_ingresos,
	COUNT(DISTINCT date) AS Dias_operativos,
	ROUND(SUM(money) / COUNT(DISTINCT date), 2) AS Ventas_Promedio_Diarias,
	AVG(money) AS Ticket_promedio
FROM VENDING_MACHINES
GROUP BY machine;

--Analisis de recurrencias de tarjeta
SELECT
	card,
	COUNT(*) AS numero_transacciones
FROM VENDING_MACHINES
WHERE card IS NOT NULL
GROUP BY card
HAVING COUNT(*) > 1
ORDER BY numero_transacciones DESC;
