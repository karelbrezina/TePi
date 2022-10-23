VERSION 5.00
Begin VB.Form MainFrm 
   Caption         =   "XI ch T"
   ClientHeight    =   8055
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   14010
   Icon            =   "MainFrm.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   537
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   934
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   735
      Left            =   240
      TabIndex        =   0
      Top             =   4920
      Width           =   1095
   End
   Begin VB.Timer GenerujXichtTmr 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   240
      Top             =   2520
   End
End
Attribute VB_Name = "MainFrm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
  'Cls
  Dim XichtXic As New Xicht
  XichtXic.GenerujXicht MainFrm

End Sub

Private Sub GenerujXichtTmr_Timer()
  Cls
  Dim XichtXic As New Xicht
  XichtXic.GenerujXicht MainFrm
End Sub

