Attribute VB_Name = "�������"
Public Function quickFill(in_skillName, in_skillTime, in_startRow)
    
    timeStyle = Sheets("_Sheet1").Range("T14").Value
    
    '������У��
    If IsEmpty(Range(in_skillName)) Then
        MsgBox "��ѡ���ܣ�"
        End
    End If
    
    
    '�������ݶ�ȡ
    skillName = Range(in_skillName).Value
    temp = 0
    
    '���������ж�
    If IsEmpty(Range(in_skillTime)) Then
        MsgBox "��buff���ܣ�"
        buffTime = -1
    Else
    
        buffTime = Range(in_skillTime).Value
    
    End If


    '����Ч���ж���ѯ
        Rem ��λ
    skillR = Sheets("����").Range("E:E").Find(What:=skillName).Row
    skillC = Sheets("����").Range("E:E").Find(What:=skillName).Column
    
    skillTag = Sheets("����").Cells(skillR, skillC + 1)
    
    
    Rem Debug.Print skillTag
    
    
    '�Ƽ��ж�
    If buffTime > 0 Then
            Rem ����
        If skillTag = "" Then
            If MsgBox("�ü����Ƿ�Ϊ�Ƽ׼��ܣ�������ʹ��ʱ����䱾��ѡ��ѡ�", vbYesNo, "��ѡ��") = vbYes Then
                Sheets("����").Cells(skillR, skillC + 1).Value = 1
                skillTag = 1
            Else
                Sheets("����").Cells(skillR, skillC + 1).Value = 0
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
    
    
    'ʱ����ȡ
    If buffTime > 0 Then
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
        locationR = Range("C36:AP36").Find(What:=startTime).Row
        locationC = Range("C36:AP36").Find(What:=startTime).Column
    ElseIf startTime >= 11 Then
        locationR = Range("C80:AP80").Find(What:=startTime).Row
        locationC = Range("C80:AP80").Find(What:=startTime).Column
    Else
        locationR = Range("C124:M124").Find(What:=startTime).Row
        locationC = Range("C124:M124").Find(What:=startTime).Column
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
        
End Function
