<<<<<<< HEAD
Attribute VB_Name = "Module1"
Sub insertYearsAndDoSummary()

Dim ticker As String
Dim nextTicker As String
Dim previousTicker As String
Dim sumAmount As Double
Dim lastRow2 As Long
Dim lastColumn2 As Long
Dim yearOpen As Double
Dim yearClose As Double

For Each ws In Worksheets

    Dim counter As Long
    
    lastRow2 = ws.Cells(Rows.Count, 1).End(xlUp).Row
    lastColumn2 = ws.Cells(1, Columns.Count).End(xlToLeft).Column
    counter = 2
    sumAmount = 0

    For i = 2 To lastRow2
    ticker = ws.Cells(i, 1).Value
    nextTicker = ws.Cells(i + 1, 1).Value
    previousTicker = ws.Cells(i - 1, 1).Value
    ws.Cells(1, lastColumn2 + 3).Value = "Ticker"
    ws.Cells(1, lastColumn2 + 4).Value = "Yearly Change"
    ws.Cells(1, lastColumn2 + 5).Value = "Percent Change"
    ws.Cells(1, lastColumn2 + 6).Value = "Total Stock Volume"
        If (ticker <> previousTicker) Then
            sumAmount = 0
            yearOpen = ws.Cells(i, 3).Value
        End If
    
        If (ticker = nextTicker) Then
            sumAmount = sumAmount + ws.Cells(i, 7).Value
        ElseIf (ticker <> nextTicker) Then
            sumAmount = sumAmount + ws.Cells(i, 7).Value
            yearClose = ws.Cells(i, 6).Value
            ws.Cells(counter, lastColumn2 + 3) = ticker
            ws.Cells(counter, lastColumn2 + 4) = (yearClose - yearOpen)
            If (ws.Cells(counter, lastColumn2 + 4) < 0) Then
                ws.Cells(counter, lastColumn2 + 4).Interior.ColorIndex = 3
            Else
                ws.Cells(counter, lastColumn2 + 4).Interior.ColorIndex = 4
            End If
            If (yearOpen <> 0) Then
                ws.Cells(counter, lastColumn2 + 5) = ((ws.Cells(counter, lastColumn2 + 4)) / yearOpen)
            Else
                ws.Cells(counter, lastColumn2 + 5) = 0
            End If
            ws.Cells(counter, lastColumn2 + 6) = sumAmount
            counter = counter + 1
        End If
        
    Next i
 Next ws

End Sub


=======
Attribute VB_Name = "Module1"
Sub insertYearsAndDoSummary()

Dim ticker As String
Dim nextTicker As String
Dim previousTicker As String
Dim sumAmount As Double
Dim lastRow2 As Long
Dim lastColumn2 As Long
Dim yearOpen As Double
Dim yearClose As Double

For Each ws In Worksheets

    Dim counter As Long
    
    lastRow2 = ws.Cells(Rows.Count, 1).End(xlUp).Row
    lastColumn2 = ws.Cells(1, Columns.Count).End(xlToLeft).Column
    counter = 2
    sumAmount = 0

    For i = 2 To lastRow2
    ticker = ws.Cells(i, 1).Value
    nextTicker = ws.Cells(i + 1, 1).Value
    previousTicker = ws.Cells(i - 1, 1).Value
    ws.Cells(1, lastColumn2 + 3).Value = "Ticker"
    ws.Cells(1, lastColumn2 + 4).Value = "Yearly Change"
    ws.Cells(1, lastColumn2 + 5).Value = "Percent Change"
    ws.Cells(1, lastColumn2 + 6).Value = "Total Stock Volume"
        If (ticker <> previousTicker) Then
            sumAmount = 0
            yearOpen = ws.Cells(i, 3).Value
        End If
    
        If (ticker = nextTicker) Then
            sumAmount = sumAmount + ws.Cells(i, 7).Value
        ElseIf (ticker <> nextTicker) Then
            sumAmount = sumAmount + ws.Cells(i, 7).Value
            yearClose = ws.Cells(i, 6).Value
            ws.Cells(counter, lastColumn2 + 3) = ticker
            ws.Cells(counter, lastColumn2 + 4) = (yearClose - yearOpen)
            If (ws.Cells(counter, lastColumn2 + 4) < 0) Then
                ws.Cells(counter, lastColumn2 + 4).Interior.ColorIndex = 3
            Else
                ws.Cells(counter, lastColumn2 + 4).Interior.ColorIndex = 4
            End If
            If (yearOpen <> 0) Then
                ws.Cells(counter, lastColumn2 + 5) = ((ws.Cells(counter, lastColumn2 + 4)) / yearOpen)
            Else
                ws.Cells(counter, lastColumn2 + 5) = 0
            End If
            ws.Cells(counter, lastColumn2 + 6) = sumAmount
            counter = counter + 1
        End If
        
    Next i
 Next ws

End Sub


>>>>>>> a2fc7449420d942d10ec67d656c1d4aaf13a4d2d
