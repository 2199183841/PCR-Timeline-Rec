Attribute VB_Name = "bossSkillFillMod"
Public Function bossQuickFill(in_skillType, in_skillTime)
    
    timeStyle = Sheets("_Sheet1").Range("T14").Value
    
    '������У��
    If IsEmpty(Range(in_skillType)) Then
        MsgBox "�벹�䶯����Ϣ"
        End
    End If
    
    
    '�������ݶ�ȡ
    skillType = Range(in_skillType).Value
    temp = 0
    
    
    '���������ж�
    If IsEmpty(Range(in_skillTime)) Or Range(in_skillTime).Value = 1 Then
        buffTime = -1
    Else
        buffTime = Range(in_skillTime).Value
    End If
    
    
    '��ɫ�趨
    If buffTime = -1 Then
        buffColor = 46
        startRow = 1
    Else
        buffColor = 42
        startRow = 2
    End If
    
    
    'ʱ����ȡ
    If buffTime > 1 Then
        startTime = InputBox("�����뿪ʼʱ��")
    Else
        startTime = InputBox("�����뿪ʼʱ��(�ü���Ϊ��buff����)")
        '�ع鸳ֵ
        buffTime = 1
    End If
    
    
    '����ж�
    If timeStyle Then
        If startTime > 90 Then
            MsgBox "���벻���ϵ�ǰʱ��ģʽ"
            End
        End If
    Else
        If startTime > 60 And startTime < 100 Then
            MsgBox "���벻���ϵ�ǰʱ��ģʽ"
            End
        End If
    End If
        
        
    '����ֵ����
    If startTime = "" Then
        MsgBox "δ���뿪ʼʱ��"
        End
    Else
        startTime = Int(startTime)
    End If
    
    
    'ʱ���������ʼ��
    If startTime >= 51 Then
        locationR = Sheets("����").Range("C36:AP36").Find(What:=startTime).Row
        locationC = Sheets("����").Range("C36:AP36").Find(What:=startTime).Column
    ElseIf startTime >= 11 Then
        locationR = Sheets("����").Range("C80:AP80").Find(What:=startTime).Row
        locationC = Sheets("����").Range("C80:AP80").Find(What:=startTime).Column
    Else
        locationR = Sheets("����").Range("C124:M124").Find(What:=startTime).Row
        locationC = Sheets("����").Range("C124:M124").Find(What:=startTime).Column
    End If
    
    
    Rem Debug.Print locationR
    Rem Debug.Print locationC
    
    
    '��βʱ���ж�
    If startTime < buffTime Then
        buffTime = startTime + 1
    End If
    
    
    'ѭ�����
    For i = 0 To buffTime - 1 Step 1
        '����
        If (locationC + i - temp) > 42 Then
            locationR = locationR + 44
            locationC = 3
            temp = i
        End If
        
        '���
        Sheets("����").Cells(locationR + startRow, locationC + i - temp).Interior.ColorIndex = buffColor
        
        If i = 0 Then
            Sheets("����").Cells(locationR + startRow, locationC + i - temp) = Left(skillType, 2)
        Else
            Sheets("����").Cells(locationR + startRow, locationC + i - temp) = ""
        End If
        
    Next i
        
End Function

