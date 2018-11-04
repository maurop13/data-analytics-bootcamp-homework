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
Dim lastRow3 As Long
Dim lastColumn3 As Long
Dim ticker2 As String
Dim value2 As Double
Dim tickerCompare As String
Dim valueCompare As Double
Dim ticker3 As String
Dim value3 As Double
Dim tickerCompare2 As String
Dim valueCompare2 As Double
Dim ticker4 As String
Dim value4 As Double
Dim tickerCompare3 As String
Dim valueCompare3 As Double


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
    
    lastRow3 = ws.Cells(Rows.Count, lastColumn2).End(xlUp).Row
    ticker2 = ws.Cells(2, lastColumn2 + 3)
    value2 = ws.Cells(2, lastColumn2 + 5)
    
    For i = 2 To lastRow3
        tickerCompare = ws.Cells(i, lastColumn2 + 3)
        valueCompare = ws.Cells(i, lastColumn2 + 5)
        
        If (value2 >= valueCompare) Then
        Else
            value2 = ws.Cells(i, lastColumn2 + 5)
            ticker2 = ws.Cells(i, lastColumn2 + 3)
        End If
    Next i
    
    ticker3 = ws.Cells(2, lastColumn2 + 3)
    value3 = ws.Cells(2, lastColumn2 + 5)
    
    For i = 2 To lastRow3
        tickerCompare2 = ws.Cells(i, lastColumn2 + 3)
        valueCompare2 = ws.Cells(i, lastColumn2 + 5)
        
        If (value3 <= valueCompare2) Then
        Else
            value3 = ws.Cells(i, lastColumn2 + 5)
            ticker3 = ws.Cells(i, lastColumn2 + 3)
        End If
    Next i
    
    ticker4 = ws.Cells(2, lastColumn2 + 3)
    value4 = ws.Cells(2, lastColumn2 + 6)
    
    For i = 2 To lastRow3
        tickerCompare3 = ws.Cells(i, lastColumn2 + 3)
        valueCompare3 = ws.Cells(i, lastColumn2 + 6)
        
        If (value4 >= valueCompare3) Then
        Else
            value4 = ws.Cells(i, lastColumn2 + 6)
            ticker4 = ws.Cells(i, lastColumn2 + 3)
        End If
    Next i
    
    ws.Cells(2, lastColumn2 + 9) = "Greatest % Increase"
    ws.Cells(3, lastColumn2 + 9) = "Greatest % decrease"
    ws.Cells(4, lastColumn2 + 9) = "Greatest Total Volume"
    ws.Cells(1, lastColumnn2 + 10) = "Ticker"
    ws.Cells(1, lastColumn2 + 11) = "Value"
    ws.Cells(2, lastColumn2 + 10) = ticker2
    ws.Cells(2, lastColumn2 + 11) = value2
    ws.Cells(2, lastColumn2 + 11).Style = "Percent"
    ws.Cells(3, lastColumn2 + 10) = ticker3
    ws.Cells(3, lastColumn2 + 11) = value3
    ws.Cells(3, lastColumn2 + 11).Style = "Percent"
    ws.Cells(4, lastColumn2 + 10) = ticker4
    ws.Cells(4, lastColumn2 + 11) = value4
    
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
Dim lastRow3 As Long
Dim lastColumn3 As Long
Dim ticker2 As String
Dim value2 As Double
Dim tickerCompare As String
Dim valueCompare As Double
Dim ticker3 As String
Dim value3 As Double
Dim tickerCompare2 As String
Dim valueCompare2 As Double
Dim ticker4 As String
Dim value4 As Double
Dim tickerCompare3 As String
Dim valueCompare3 As Double


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
    
    lastRow3 = ws.Cells(Rows.Count, lastColumn2).End(xlUp).Row
    ticker2 = ws.Cells(2, lastColumn2 + 3)
    value2 = ws.Cells(2, lastColumn2 + 5)
    
    For i = 2 To lastRow3
        tickerCompare = ws.Cells(i, lastColumn2 + 3)
        valueCompare = ws.Cells(i, lastColumn2 + 5)
        
        If (value2 >= valueCompare) Then
        Else
            value2 = ws.Cells(i, lastColumn2 + 5)
            ticker2 = ws.Cells(i, lastColumn2 + 3)
        End If
    Next i
    
    ticker3 = ws.Cells(2, lastColumn2 + 3)
    value3 = ws.Cells(2, lastColumn2 + 5)
    
    For i = 2 To lastRow3
        tickerCompare2 = ws.Cells(i, lastColumn2 + 3)
        valueCompare2 = ws.Cells(i, lastColumn2 + 5)
        
        If (value3 <= valueCompare2) Then
        Else
            value3 = ws.Cells(i, lastColumn2 + 5)
            ticker3 = ws.Cells(i, lastColumn2 + 3)
        End If
    Next i
    
    ticker4 = ws.Cells(2, lastColumn2 + 3)
    value4 = ws.Cells(2, lastColumn2 + 6)
    
    For i = 2 To lastRow3
        tickerCompare3 = ws.Cells(i, lastColumn2 + 3)
        valueCompare3 = ws.Cells(i, lastColumn2 + 6)
        
        If (value4 >= valueCompare3) Then
        Else
            value4 = ws.Cells(i, lastColumn2 + 6)
            ticker4 = ws.Cells(i, lastColumn2 + 3)
        End If
    Next i
    
    ws.Cells(2, lastColumn2 + 9) = "Greatest % Increase"
    ws.Cells(3, lastColumn2 + 9) = "Greatest % decrease"
    ws.Cells(4, lastColumn2 + 9) = "Greatest Total Volume"
    ws.Cells(1, lastColumnn2 + 10) = "Ticker"
    ws.Cells(1, lastColumn2 + 11) = "Value"
    ws.Cells(2, lastColumn2 + 10) = ticker2
    ws.Cells(2, lastColumn2 + 11) = value2
    ws.Cells(2, lastColumn2 + 11).Style = "Percent"
    ws.Cells(3, lastColumn2 + 10) = ticker3
    ws.Cells(3, lastColumn2 + 11) = value3
    ws.Cells(3, lastColumn2 + 11).Style = "Percent"
    ws.Cells(4, lastColumn2 + 10) = ticker4
    ws.Cells(4, lastColumn2 + 11) = value4
    
 Next ws

End Sub
>>>>>>> a2fc7449420d942d10ec67d656c1d4aaf13a4d2d
