#tag Window
Begin Window Window1
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   "0"
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   720
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   658644991
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "Untitled"
   Type            =   "0"
   Visible         =   True
   Width           =   1000
   Begin MyMapCanvas MyMapCanvas1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   616
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   True
      Visible         =   True
      Width           =   960
   End
   Begin Label DebugInfo
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   52
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   27
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   True
      Scope           =   2
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   648
      Transparent     =   False
      Underline       =   False
      Value           =   "Debug Info"
      Visible         =   True
      Width           =   953
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Keyboard.AsyncKeyDown(&h7B) Then
		    // Left.
		    MyMapCanvas1.TileMap.Camera.PanLeft(10)
		    MyMapCanvas1.Invalidate
		  End If
		  If Keyboard.AsyncKeyDown(&h7C) Then
		    // Right.
		    MyMapCanvas1.TileMap.Camera.PanRight(10)
		    MyMapCanvas1.Invalidate
		  End If
		  If Keyboard.AsyncKeyDown(&h7D) Then
		    // Down.
		    MyMapCanvas1.TileMap.Camera.PanDown(10)
		    MyMapCanvas1.Invalidate
		  End If
		  If Keyboard.AsyncKeyDown(&h7E) Then
		    // Up.
		    MyMapCanvas1.TileMap.Camera.PanUp(10)
		    MyMapCanvas1.Invalidate
		  End If
		  
		  #Pragma Error "Bug when scrolling right - no buffer column being drawn."
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  // Assign a camera to the tile map.
		  MyMapCanvas1.TileMap.Camera = New XGECamera2D(0, 0, MyMapCanvas1.Width, MyMapCanvas1.Height)
		  
		  // Force a redraw of the canvas.
		  MyMapCanvas1.Refresh
		  
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events MyMapCanvas1
	#tag Event
		Sub DidRender(g As Graphics, areas() As REALbasic.Rect)
		  DebugInfo.Value = "Rendered " + Me.TileMap.TilesRendered.ToString + " tiles."
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub WillRender(g As Graphics, areas() As REALbasic.Rect)
		  MyMapCanvas1.TileMap.Camera.SetViewport(MyMapCanvas1.Width, MyMapCanvas1.Height)
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
