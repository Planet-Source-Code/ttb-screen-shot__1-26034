VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Screen Shot taker"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command3 
      Caption         =   "Exit"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3840
      TabIndex        =   2
      Top             =   120
      Width           =   615
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Save"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3120
      TabIndex        =   1
      Top             =   120
      Width           =   495
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Take Screen Shot"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   0
      TabIndex        =   0
      Top             =   120
      Width           =   1815
   End
   Begin VB.Image Image1 
      Height          =   2535
      Left            =   0
      Stretch         =   -1  'True
      Top             =   600
      Width           =   4695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Declare Sub keybd_event Lib "user32" (ByVal bVk As Byte, ByVal bScan As Byte, ByVal dwFlags As Long, ByVal dwExtraInfo As Long)

Private Const VK_SNAPSHOT = &H2C

Private Sub Command1_Click()
Me.Hide
    DoEvents
    keybd_event VK_SNAPSHOT, 1, 0, 0
    DoEvents
    DoEvents
Me.Show
Image1.Picture = Clipboard.GetData

End Sub

Private Sub Command2_Click()
Dim sec As String
sec = Left(Format(Time, "sec"), 2)
Call SavePicture(Image1.Picture, App.Path & "\Screen_Shot" & sec & ".bmp")
MsgBox "Saved as " & App.Path & "\screen_shot" & sec & ".bmp"
End Sub

Private Sub Command3_Click()
End
End Sub

Private Sub Form_Resize()
If Me.WindowState = vbMinimized Then Exit Sub
If Form1.Height = 1000 Or Form1.Height < 1000 Then Exit Sub
Image1.Width = Form1.Width - 100
Image1.Height = Form1.Height - 1000

End Sub

