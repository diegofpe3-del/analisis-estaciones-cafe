# Análisis Integral y Optimización: Estaciones Automatizadas de Café 

¡Bienvenido a mi proyecto de portafolio! En este trabajo consolidé la operación de una red de puntos de venta automatizados de café para identificar tendencias de consumo, optimizar el flujo de caja y evaluar el rendimiento de las unidades desde marzo de 2024 hasta marzo de 2025.

---

##  Tecnologías Utilizadas
* **Excel:** Limpieza, consolidación y transformación inicial de los datos.
* **SQL Server:** Consultas avanzadas, segmentación de clientes recurrentes y cálculo de métricas financieras.
* **Power BI:** Modelado de datos, creación de medidas DAX y diseño del dashboard interactivo.

---

##  El Dashboard
Aquí puedes ver una vista general del reporte interactivo diseñado en Power BI:

<img width="960" height="542" alt="image" src="https://github.com/user-attachments/assets/4c8cb357-b06f-4fc8-b6a8-e5901cc39b49" />


---

## 💡 Principales Hallazgos y Conclusiones

* **Conclusión 1 - Desempeño Financiero Global:** El negocio muestra una tendencia favorable con un total de ingresos acumulados de $122,321.58 y 3898       transacciones y un ticket promedio global de $31.38,destacando picos históricos de facturación en octubre de 2024 y febrero de 2025. Se sugiere planificar el stock de insumos con un mes de anticipación (setiembre y enero) para asegurar la disponibilidad de productos y cubrir eficientemente la demanda en temporadas altas. Cabe resaltar que en los dos últimos meses del análisis, se observa un incremento en los ingresos y volumen de transacciones, esto es atribuido a la introducción operativa de la máquina 2  en febrero de 2025.

* **Conclusión 2 - Optimización Temporal (Días y Horas):** La mayoría de ingresos se concentran fuertemente los lunes y martes, decayendo hacia el fin de semana, siendo el domingo el día con menores ventas. A nivel horario, las transacciones se disparan a partir de las 8:00 am y se mantienen fuerte durante la tarde y decayendo hasta la noche, registrando que las 10:00 am es el pico más alto de actividad. Teniendo en cuenta esto, se recomienda programar el reabastecimiento técnico, limpieza y mantenimiento de las máquinas los días de menor actividad (como los domingos) o en la madrugada, evitando dejar las unidades fuera de servicio durante las horas pico de la semana.

* **Conclusión 3 - Análisis de Productos:** Los cafés tipo Latte y Americano with Milk sostienen el núcleo del negocio al liderar los ingresos globales (con una participación del 23.43% y 21.56%, respectivamente), en contraste con opciones como el Caramel o Double chocolate, que presentan la menor participación (juntos un 0.04% de las ventas). Lo ideal sería optimizar el espacio físico interno de las máquinas asignando más slots de inventario a estos dos productos estrella para evitar quiebres de stock, y evaluar promociones para incentivar la salida de los productos de menor rotación.

* **Conclusión 4 - Comportamiento de Pagos:** Existe una preferencia digital abrumadora, donde el pago con tarjeta representa el 95.74% de los ingresos totales frente a un uso de efectivo del 4.26%. Dado que la operación prescinde casi en su totalidad del dinero en efectivo, se debería evaluar el costo-beneficio de retirar los lectores de monedas y billetes en futuras expansiones, reduciendo así costos de mantenimiento de hardware y mitigando riesgos de vandalismo.

*  **Conclusión 5 - Rendimiento de Unidades:** La Máquina 1 duplica la eficiencia de la operación con ventas promedio diarias de $302.97, en comparación con los $168.05 de la Máquina 2, esto podría deberse a que esta última fue introducida en los dos últimos meses del análisis. Asimismo,mediante el análisis de base de datos, la Máquina 1 pudo identificar a 545 clientes recurrentes (con al menos dos transacciones) al contar con lector de ID de tarjeta, una función ausente en la Máquina 2. Se recomienda realizar un estudio de geolocalización para evaluar si la Máquina 2 debe ser reubicada a una zona con mayor tránsito o esperar su maduración comercial, en paralelo, se aconseja evaluar la estandarización de su software para que también capture el identificador de tarjeta y permita replicar las estrategias de fidelización en ambos puntos.

---

## 📂 Documentación y Código Técnico
Si deseas profundizar en la metodología estadística y el paso a paso técnico, puedes revisar los archivos directamente en este repositorio:

* [📄 Ver Documentación Completa en PDF (14 páginas)](ANALISIS%20INTEGRAL%20Y%20OPTIMIZACION%20-%20ESTACIONES%20AUTOMATIZADAS%20DE%20CAFE.pdf)
* [💻 Ver Scripts de SQL Server](./sql-server/metricas.sql)
* [📊 Descargar Archivo de Power BI](./dashboard/)

---
## 👤 Contacto
* **LinkedIn:** [Diego Flores Parra](https://www.linkedin.com/in/dflores26/)
* **Correo:** diegofpe3@gmail.com
* **Ubicación:** Lima, Perú 🇵🇪
