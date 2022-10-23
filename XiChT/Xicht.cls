VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Xicht"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'221023 'lukas 'clsXicht 'Xicht.cls

Option Explicit

Private Type TypXY
  X As Long
  Y As Long
End Type


Private Type TypRect
  P As TypXY
  S As TypXY
End Type

Private RectT As TypRect
Const Pi As Double = 3.14159265355

Friend Sub GenerujXicht(ByRef Canvas As VB.Form)
  Initialize Canvas
  GenerujPozadi Canvas
  GenerujHlavu Canvas
  GenerujRuce Canvas
  GenerujNohy Canvas
End Sub

Private Sub Initialize(ByRef Canvas As VB.Form)
  RectT.P.X = 0
  RectT.P.Y = 0
  RectT.S.X = 300
  RectT.S.Y = 300
  
  Canvas.DrawWidth = 10
  Canvas.DrawMode = vbCopyPen
  Canvas.ForeColor = vbBlack
  Canvas.DrawStyle = vbSolid
End Sub

Private Sub GenerujHlavu(ByRef Canvas As VB.Form)
  GenerujObrys Canvas
  GenerujOci Canvas
  GenerujNos Canvas
  GenerujPusu Canvas
  GenerujVlasy Canvas
End Sub

Private Sub GenerujPozadi(ByRef Canvas As VB.Form)
  Canvas.Line (RectT.P.X, RectT.P.Y)-Step(RectT.S.X, RectT.S.Y), vbWhite, BF
End Sub

Private Sub GenerujRuce(ByRef Canvas As VB.Form)
'
End Sub

Private Sub GenerujNohy(ByRef Canvas As VB.Form)
'
End Sub

Private Sub GenerujObrys(ByRef Canvas As VB.Form)
 Dim Stred As TypXY
 Stred = StredVypocti(RectT)
 Dim Polomer As Long
 Polomer = RectT.S.X / 2 'pokud RectT je obdelnik, potom polomer je proste polovina Size v ose X
 Canvas.Circle (Stred.X, Stred.Y), Polomer, vbBlack ', 0, 2 * Pi, 1
End Sub

Private Sub GenerujOci(ByRef Canvas As VB.Form)
 Dim Stred As TypXY
 Stred = StredVypocti(RectT)
 Dim Polomer As Long
 Polomer = RectT.S.X / 2 'pokud RectT je obdelnik, potom polomer je proste polovina Size v ose X
   
 'oci jsou dve kruznice v horni tretine hlavy uprostred
 'nejprve jak jsou vysoko:
 Dim OciVyska As Long
 OciVyska = RectT.S.Y / 3
 
 'jak jsou od sebe daleko. asi pulku hlavy
 Dim OciVzdalenost As Long
 OciVzdalenost = Polomer
 
 Dim OciPolomer As Long 'jak jsou velike
 OciPolomer = 20
 
 'leve oko
 Canvas.Circle (Stred.X - OciVzdalenost / 2, OciVyska), OciPolomer, vbBlue ', 0, 2 * Pi, 1
 Canvas.Circle (Stred.X + OciVzdalenost / 2, OciVyska), OciPolomer, vbBlue ', 0, 2 * Pi, 1
  
End Sub

Private Sub GenerujNos(ByRef Canvas As VB.Form)
'
End Sub

Private Sub GenerujPusu(ByRef Canvas As VB.Form)
 Dim Stred As TypXY
 Stred = StredVypocti(RectT)
 Dim Polomer As Long
 Polomer = RectT.S.X / 2 'pokud RectT je obdelnik, potom polomer je proste polovina Size v ose X
   
 'oci jsou dve kruznice v horni tretine hlavy uprostred
 'nejprve jak jsou vysoko:
 Dim OciVyska As Long
 OciVyska = RectT.S.Y / 3
 
 'jak jsou od sebe daleko. asi pulku hlavy
 Dim OciVzdalenost As Long
 OciVzdalenost = Polomer
  
 'pusa je cara presne pod ocima
 'Canvas.Line (Stred.X - OciVzdalenost / 2, Stred.Y + OciVyska)-Step(OciVzdalenost, 0), vbRed ', 0, 2 * Pi, 1
 Canvas.Line (Stred.X - OciVzdalenost / 2, RectT.P.Y + OciVyska * 2)-Step(OciVzdalenost, 0), vbRed ', 0, 2 * Pi, 1
End Sub

Private Sub GenerujVlasy(ByRef Canvas As VB.Form)
'
End Sub

'private Sub (ByRef Canvas As VB.Form)
''
'End Sub
'
  
Private Function StredVypocti(ByRef RectT As TypRect) As TypXY
  StredVypocti.X = RectT.P.X + RectT.S.X / 2
  StredVypocti.Y = RectT.P.Y + RectT.S.Y / 2
End Function
