Attribute VB_Name = "ʱ����ʾ���"
Public timeStyle As Boolean 'trueΪ���� falseΪֱ��
Sub ��ť43_Click()

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
    End If
End Sub

