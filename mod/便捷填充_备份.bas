Attribute VB_Name = "������_����"
Sub ��ť5_Click()
    If IsEmpty(Range("AL19")) Then
    
        MsgBox "��buff���ܣ�"
        
    Else
        '�������ݶ�ȡ
        skillName = Range("X19").Value
        buffTime = Range("AL19").Value
        buffNum = Range("AM19").Value
        temp = 0
    
        '����Ч���ж���ѯ
            Rem ��λ
        skillR = Sheets("����").Range("E:E").Find(What:=skillName).Row
        skillC = Sheets("����").Range("E:E").Find(What:=skillName).Column
        
        skillTag = Sheets("����").Cells(skillR, skillC + 1)
        
        Debug.Print skillTag
     
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
        
        '��ɫ�趨
        If skillTag = 1 Then
            buffColor = 37
        Else
            buffColor = 39
        End If
        
        'ʱ����ȡ
        startTime = InputBox("�����뿪ʼʱ��")
        
        If startTime = "" Then
            MsgBox "δ���뿪ʼʱ��"
            End
        End If
        
        'ʱ���������ʼ��
        locationR = Range("C36:AP36, C68:AP68, C100:M100").Find(What:=startTime).Row
        locationC = Range("C36:AP36, C68:AP68, C100:M100").Find(What:=startTime).Column
        
        Debug.Print locationR
        Debug.Print locationC
        
        'ѭ�����
        For i = 0 To buffTime - 1 Step 1
            '����
            If (locationC + i) > 42 Then
                locationR = locationR + 32
                locationC = 3
                temp = i
            End If
            
            '���
            Cells(locationR + 9, locationC + i - temp).Interior.ColorIndex = buffColor
            Cells(locationR + 9, locationC + i - temp) = buffNum
        Next i
    
    End If
    
End Sub
