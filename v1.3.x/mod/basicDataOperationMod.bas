Attribute VB_Name = "basicDataOperationMod"
Sub ��ť7_Click()
    Range("E11:AP15").Value = Range("E4:AP8").Value
End Sub
Sub ��ť8_Click()
    If MsgBox("ȷ������𣿣��˲��������棩", vbYesNo, "��ѡ��") = vbYes Then
        Range("A4:AP8, E11:AP15").Value = ""
        Range("D18:S22, X18:AM22").Value = ""
    End If
End Sub
Sub ��ť10_Click()
    Dim rg As Range
    Dim locationR As Integer
    Dim locationC As Integer
    
    
    For Each rg In Sheets("����").Range("D18:D22,X18:X22")
        Debug.Print rg.Value
        
        If rg.Value = "" Then
            GoTo con
        End If
        
        locationR = Range("���ܽ���_����[skillName]").Find(What:=rg.Value).Row
        locationC = Range("���ܽ���_����[skillName]").Find(What:=rg.Value).Column
        
        Debug.Print locationR
        
        Debug.Print locationC
        
        data = Sheets("����").Cells(locationR, locationC + 1).Value
        
        buffTime = Sheets("����").Cells(locationR, locationC + 2).Value
        
        Debug.Print data
        Debug.Print buffTime
        
        r = rg.Row
        c = rg.Column
        
        Debug.Print r
        Debug.Print c
        
        Sheets("����").Cells(r, c + 3).Value = data
        Sheets("����").Cells(r, c + 14).Value = buffTime
        
con:
    Next
    
End Sub
Sub ��ť29_Click()
    If MsgBox("�����������ݹ���������ǰ�ļ�����Ŀ¼��", vbYesNo, "��ѡ��") = vbYes Then
        ActiveWorkbook.Save
        d = Format(Now(), "yyyy-mm-dd_HH.mm.ss")
        s = InputBox("�����뱣���ļ���")
        ThisWorkbook.SaveCopyAs ThisWorkbook.Path & "\" & s & "_" & d & ".xlsm"
    End If
End Sub
Sub ��ť30_Click()
    If MsgBox("�����������ݱ�����ǰ������", vbYesNo, "��ѡ��") = vbYes Then
        ActiveSheet.Select
        ActiveSheet.Copy after:=Sheets("���¼�¼")
        
        If MsgBox("�Ƿ���Ҫ���������ݱ�", vbYesNo, "��ѡ��") = vbYes Then
            newName = InputBox("������������")
            ActiveSheet.Name = "_" & newName
        End If
    End If
End Sub

