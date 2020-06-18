Attribute VB_Name = "createWorkMod"
Public Function arrNum(arr) As Boolean

    Dim i&
    
    On Error Resume Next
    
    i = UBound(arr)
    
    If Err = 0 Then arrNum = True
    
End Function
Sub ������_��ť1_Click()
    Dim file As String, arr As Variant, i
    
    '����ǰ�����ݶ�������
    arr = Range("a1").CurrentRegion
    
    If arrNum(arr) Then
    
        d = Format(Now(), "yyyy-mm-dd_HH.mm.ss")
        
        s = InputBox("�����뱣���ļ���")
        
        '�����ı��ļ�������
        file = ThisWorkbook.Path & "\txt\" & s & "_" & d & ".txt"
        
        '�ж��Ƿ����ͬ���ı��ļ�����������ɾ��
        If Dir(file) <> "" Then Kill file
        
        'ʹ��print��佫��������������д���ı��ļ�
        Open file For Output As #1
        
        Print #1, "=========================================================="
        Print #1, "=                                          ����ҵ�����ڣ�";
        Print #1, Format(Now(), "yyyy-mm-dd_HH.mm.ss");
        Print #1, "                                                ="
        Print #1, "=========================================================="
        
        Print #1, "              BOSS���ƣ�";
        Print #1, Sheets("BOSS��Ϣ").Range("B2").Value
        
        Print #1, "              BOSSλ�ã�";
        Print #1, Sheets("BOSS��Ϣ").Range("B3").Value
        
        Print #1, "              ��ע��";
        Print #1, Sheets("BOSS��Ϣ").Range("B4").Value
        
        Print #1, "=========================================================="
        
        For i = 1 To UBound(arr)
        
            Print #1, Join(Application.Index(arr, i), " - ")
            
        Next
        
        '�ر��ı��ļ�
        Close #1
        
    End If
End Sub
Sub ������_��ť2_Click()

    Sheets("������").Range("A1:G65536").ClearContents
    
End Sub
Sub ������_��ť3_Click()
Dim dic As Object
    
    Dim ubTimeArr As Variant

    Dim min As String, sec As String

    Set dic = CreateObject("Scripting.Dictionary")
    
    For i = 0 To 4
    
        For v = 0 To 33
    
            If Sheets("����").Cells(i + 11, v + 5).Value = "" Then
            
                Exit For
            
            End If
    
            If Not dic.exists(Sheets("����").Cells(i + 11, v + 5).Value) Then
            
                dic.Add Sheets("����").Cells(i + 11, v + 5).Value, CreateObject("Scripting.Dictionary")
            
            End If
            
            Index = dic(Sheets("����").Cells(i + 11, v + 5).Value).Count
            
            Debug.Print Sheets("����").Cells(i + 11, 1).Value
            
            dic(Sheets("����").Cells(i + 11, v + 5).Value).Add Index, Sheets("����").Cells(i + 11, 1).Value
            
        Next v
    
    Next i
    
    dKeys = dic.Keys
    
    ubTimeArr = bubbleSort(dKeys)
    
    i = 1
    
    For Each ubTime In ubTimeArr
        
        ubTimeTemp = 0
        
        min = 0
        
        sec = 0
        
        If ubTime >= 60 Then
            
            min = "1"
            
            ubTimeTemp = ubTime - 60
            
            If ubTimeTemp < 10 Then
            
                sec = " 0" & Right(Str(ubTimeTemp), 1)
            
            Else
            
                sec = Str(ubTimeTemp)
            
            End If
            
        Else
        
            sec = Str(ubTime)
        
        End If
        

    
        Sheets("������").Cells(i, 1) = min & ":" & sec
        
        v = 2
        
        For Each ubName In dic(ubTime).Items
        
            Sheets("������").Cells(i, v) = "[ub]" & ubName
            
            v = v + 1
            
        Next
        
        i = i + 1
    
    Next
End Sub


