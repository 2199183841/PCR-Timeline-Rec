Attribute VB_Name = "ʱ����ʾ���"
Sub ��ť43_Click()
    timeStyle = Sheets("_Sheet1").Range("T14").Value
    timeLine = Range("C36:AG36")
    
    If timeStyle Then
        Range("H35").Value = "ֱ��ģʽ"
        Rem ��ǩ�趨
        Tag = 130
        Rem ѭ��
        For i = 3 To 33
            Sheets("����").Cells(36, i).Value = Tag
            Tag = Tag - 1
        Next i

        timeStyle = False
        Sheets("_Sheet1").Range("T14").Value = 0
        
    Else
        Range("H35").Value = "����ģʽ"
        Rem ��ǩ�趨
        Tag = 90
        Rem ѭ��
        For i = 3 To 33
            Sheets("����").Cells(36, i).Value = Tag
            Tag = Tag - 1
        Next i
        
        timeStyle = True
        Sheets("_Sheet1").Range("T14").Value = 1
    End If
End Sub

