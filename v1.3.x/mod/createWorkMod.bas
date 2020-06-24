Attribute VB_Name = "createWorkMod"
Public Function arrNum(arr) As Boolean

    Dim i&
    
    On Error Resume Next
    
    i = UBound(arr)
    
    If Err = 0 Then arrNum = True
    
End Function
Sub ������_��ť1_Click()
    Application.DisplayAlerts = False
    
    Dim file As String, arr As Variant, i
    
    '����ǰ�����ݶ�������
    arr = Range("a1").CurrentRegion
    
    If arrNum(arr) Then
    
        d = Format(Now(), "yyyy-mm-dd_HH.mm.ss")
        
        s = InputBox("�����뱣���ļ���")
        
        '�½�һ���Ի������
        Set FolderDialogObject = Application.FileDialog(msoFileDialogFolderPicker)
        
        '���öԻ���
        With FolderDialogObject
        
            .Title = "��ѡ��Ҫ���ҵ��ļ���"
        
            .InitialFileName = ThisWorkbook.Path
        
        End With
        
        '��ʾ�Ի���
        
        FolderDialogObject.Show
        
        '��ȡѡ��Ի���ѡ����ļ���
        
        Set paths = FolderDialogObject.SelectedItems
        
        '��������
        On Error GoTo pathErr
        
        '�����ı��ļ�������
        file = paths(1) & "\" & s & "_" & d & ".txt"
        
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
    
    Application.DisplayAlerts = True
    Exit Sub
pathErr:
    MsgBox "δѡ��·�������ε�����ȡ��"
    Exit Sub
End Sub
Sub ������_��ť2_Click()

    Sheets("������").Range("A1:G65536").ClearContents
    
End Sub
Sub ������_��ť3_Click()
Dim dic As Object

    Sheets("������").Range("A1:G65536").ClearContents

    timeStyle = Sheets("_Sheet1").Range("T14").Value
    
    Dim ubTimeArr As Variant

    Dim min As String, sec As String

    Set dic = CreateObject("Scripting.Dictionary")
    
    Dim workName As String
    
    workName = Sheets("������").Range("I3").Value
    
    If workName = "" Then
        
        MsgBox "��ѡ������"
        Exit Sub
        
    End If
    
    For i = 0 To 4
    
        For v = 0 To 33
    
            If Sheets(workName).Cells(i + 11, v + 5).Value = "" Then
            
                Exit For
            
            End If
    
            If Not dic.exists(Sheets(workName).Cells(i + 11, v + 5).Value) Then
            
                dic.Add Sheets(workName).Cells(i + 11, v + 5).Value, CreateObject("Scripting.Dictionary")
            
            End If
            
            Index = dic(Sheets(workName).Cells(i + 11, v + 5).Value).Count
            
            Debug.Print Sheets(workName).Cells(i + 11, 1).Value
            
            dic(Sheets(workName).Cells(i + 11, v + 5).Value).Add Index, Sheets(workName).Cells(i + 11, 1).Value
            
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
            
            If timeStyle Then
                ubTimeTemp = ubTime - 60
            Else
                ubTimeTemp = ubTime - 100
            End If
                    
            If ubTimeTemp < 10 Then
            
                sec = " 0" & Right(str(ubTimeTemp), 1)
            
            Else
            
                sec = str(ubTimeTemp)
            
            End If
            
        ElseIf ubTime >= 10 Then
        
            sec = str(ubTime)
        
        Else
        
            sec = " 0" & Right(str(ubTime), 1)
        
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
Sub ��ť6_Click()
    
    Dim ar(1 To 100, 1 To 1)
    
    Dim i As Long, j As Long
    
    Sheets("��").UsedRange.Offset(1).ClearContents
    
    For i = 1 To Sheets.Count
        
        If Sheets(i).Visible = xlSheetVisible Then
            
            If Sheets(i).Name <> "BOSS��Ϣ" And Sheets(i).Name <> "������" And Sheets(i).Name <> "���¼�¼" Then
                
                j = j + 1
                
                Sheets("��").Cells(j, 1) = Sheets(i).Name
                
            End If
            
        End If
        
    Next i
    
End Sub


