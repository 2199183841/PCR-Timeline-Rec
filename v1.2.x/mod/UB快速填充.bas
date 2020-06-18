Attribute VB_Name = "UB�������"
Public Function ubQuickFill(in_skillName, in_skillTime, in_timeArr, in_startRow)
    
    timeStyle = Sheets("_Sheet1").Range("T14").Value
    
    'ub���ݶ�ȡ
    skillName = Range(in_skillName).Value
    
    'ub�����ж�
    If Range(in_skillTime) = "" Then
        Exit Function
    Else
        buffTime = Int(Range(in_skillTime).Value)
    End If

    '����Ч���ж���ѯ
        Rem ��λ
    skillR = Sheets("UB").Range("B:B").Find(What:=skillName).Row
    skillC = Sheets("UB").Range("B:B").Find(What:=skillName).Column
    
    skillTag = Sheets("UB").Cells(skillR, skillC + 2)
    
    '�Ƽ��ж�
    If buffTime > 0 Then
            Rem ����
        If skillTag = "" Then
            If MsgBox("��" & skillName & "���Ƿ�Ϊ�Ƽ׼��ܣ�������ʹ��ʱ����䱾��ѡ��ѡ�", vbYesNo, "��ѡ��") = vbYes Then
                Sheets("UB").Cells(skillR, skillC + 2).Value = 1
                skillTag = 1
            Else
                Sheets("UB").Cells(skillR, skillC + 2).Value = 0
                skillTag = 0
            End If
        End If
    Else
        skillTag = 0
    End If
    
    '��ɫ�趨
    If skillTag = 1 Then
        buffColor = 37
    Else
        buffColor = 39
    End If
    
    Dim arr
    
    arr = in_timeArr
    
    For Each r In arr
        If r = "" Then
            Exit For
        End If
        
        temp = 0
        
        startTime = r
        
        '����ж�
        If timeStyle Then
            If startTime > 90 Then
                startTime = startTime - 40
            End If
        Else
            If startTime > 60 And startTime < 100 Then
                startTime = startTime + 40
            End If
        End If
        
        'ʱ���������ʼ��
        If startTime >= 51 Then
            locationR = Range("C36:AP36").Find(What:=startTime).Row
            locationC = Range("C36:AP36").Find(What:=startTime).Column
        ElseIf startTime >= 11 Then
            locationR = Range("C80:AP80").Find(What:=startTime).Row
            locationC = Range("C80:AP80").Find(What:=startTime).Column
        Else
            locationR = Range("C124:M124").Find(What:=startTime).Row
            locationC = Range("C124:M124").Find(What:=startTime).Column
        End If
        
        '��βʱ���ж�
        If startTime < buffTime Then
            buffTime = startTime + 1
        End If
        
        'ѭ�����
        For i = 0 To buffTime - 1 Step 1
            '����
            If (locationC + i) > 42 Then
                locationR = locationR + 44
                locationC = 3
                temp = i
            End If
            
            '���
            Cells(locationR + in_startRow, locationC + i - temp).Interior.ColorIndex = buffColor
            
            If i = 0 Then
                Cells(locationR + in_startRow, locationC + i - temp) = Left(skillName, 2)
            Else
                Cells(locationR + in_startRow, locationC + i - temp) = ""
            End If
            
        Next i
        
    Next r

End Function


