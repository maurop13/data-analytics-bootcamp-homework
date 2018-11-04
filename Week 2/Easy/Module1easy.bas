<<<<<<< HEAD
Attribute VB_Name = "Module1"
Sub insertYearsAndDoSummary()

Dim ticker As String
Dim nextTicker As String
Dim sumAmount As Double
Dim lastRow2 As Long
Dim lastColumn2 As Long


For Each ws In Worksheets

    Dim counter As Integer
    
    lastRow2 = ws.Cells(Rows.Count, 1).End(xlUp).Row
    lastColumn2 = ws.Cells(1, Columns.Count).End(xlToLeft).Column
    counter = 2
    sumAmount = 0

    For i = 2 To lastRow2
    ticker = ws.Cells(i, 1).Value
    nextTicker = ws.Cells(i + 1, 1).Value
    ws.Cells(1, lastColumn2 + 3).Value = "Ticker"
    ws.Cells(1, lastColumn2 + 4).Value = "Total Stock Volume"

        If (ticker <> ws.Cells(i - 1, 1).Value) Then
            sumAmount = 0
        End If
               
        If (ticker = nextTicker) Then
            sumAmount = sumAmount + ws.Cells(i, 7).Value
        ElseIf (ticker <> nextTicker) Then
            sumAmount = sumAmount + ws.Cells(i, 7).Value
            ws.Cells(counter, lastColumn2 + 3) = ticker
            ws.Cells(counter, lastColumn2 + 4) = sumAmount
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
Dim sumAmount As Double
Dim lastRow2 As Long
Dim lastColumn2 As Long


For Each ws In Worksheets

    Dim counter As Integer
    
    lastRow2 = ws.Cells(Rows.Count, 1).End(xlUp).Row
    lastColumn2 = ws.Cells(1, Columns.Count).End(xlToLeft).Column
    counter = 2
    sumAmount = 0

    For i = 2 To lastRow2
    ticker = ws.Cells(i, 1).Value
    nextTicker = ws.Cells(i + 1, 1).Value
    ws.Cells(1, lastColumn2 + 3).Value = "Ticker"
    ws.Cells(1, lastColumn2 + 4).Value = "Total Stock Volume"

        If (ticker <> ws.Cells(i - 1, 1).Value) Then
            sumAmount = 0
        End If
               
        If (ticker = nextTicker) Then
            sumAmount = sumAmount + ws.Cells(i, 7).Value
        ElseIf (ticker <> nextTicker) Then
            sumAmount = sumAmount + ws.Cells(i, 7).Value
            ws.Cells(counter, lastColumn2 + 3) = ticker
            ws.Cells(counter, lastColumn2 + 4) = sumAmount
            counter = counter + 1
        End If
        
    Next i
 Next ws

End Sub

>>>>>>> a2fc7449420d942d10ec67d656c1d4aaf13a4d2d
