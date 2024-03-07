Sub CrearHojasFiltradas()

Dim wbLibroActual As Workbook
Dim wsHojaActual As Worksheet
Dim rangoDatos As Range
Dim wsHojaEfectivo As Worksheet
Dim wsHojaCredito As Worksheet
Dim criterioEfectivo As String
Dim criterioCredito As String

Set wbLibroActual = ThisWorkbook
Set wsHojaActual = wbLibroActual.ActiveSheet

Set rangoDatos = wsHojaActual.UsedRange

'Definir criterios
criterioEfectivo = "Efectivo"
criterioCredito = "Crédito"

'Filtrar por efectivo
rangoDatos.AutoFilter Field:=8, Criteria1:=criterioEfectivo

'Copiar datos filtrados a la hoja "Efectivo"
Set wsHojaEfectivo = Sheets.Add(After:=Sheets(Sheets.Count))
rangoDatos.SpecialCells(xlCellTypeVisible).Copy wsHojaEfectivo.Range("A1")

'Limpiar filtro
wsHojaActual.AutoFilterMode = False

'Filtrar por crédito
rangoDatos.AutoFilter Field:=8, Criteria1:=criterioCredito

'Copiar datos filtrados a la hoja "Crédito"
Set wsHojaCredito = Sheets.Add(After:=Sheets(Sheets.Count))
rangoDatos.SpecialCells(xlCellTypeVisible).Copy wsHojaCredito.Range("A1")

'Limpiar filtro
wsHojaActual.AutoFilterMode = False

'Nombrar hojas nuevas
wsHojaEfectivo.Name = "Efectivo"
wsHojaCredito.Name = "Crédito"

'Agregar encabezados a las tablas
'Encabezados: ID Externo, Cliente, Fecha, Subsidiaria, Ubicación, Artículo, Cantidad, Tarifa (precio unitario), Base

wsHojaEfectivo.Range("A1:H1").Value = Array("ID Externo", "Cliente", "Fecha", "Subsidiaria", "Ubicación", "Artículo", "Cantidad", "Tarifa", "Base")
wsHojaCredito.Range("A1:H1").Value = Array("ID Externo", "Cliente", "Fecha", "Subsidiaria", "Ubicación", "Artículo", "Cantidad", "Tarifa", "Base")

'Ajustar el formato de las tablas
' Puedes agregar código aquí para ajustar el formato de las tablas, como el ancho de las columnas, el tipo de letra, etc.

'Mostrar mensaje de finalización
MsgBox "Hojas 'Efectivo' y 'Crédito' creadas con éxito.", vbInformation

End Sub
