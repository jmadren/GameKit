#tag Window
Begin Window WinVersion2
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
   Title           =   "Version 2"
   Type            =   "0"
   Visible         =   True
   Width           =   1000
   Begin MapV2 MyMapCanvas1
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowFocusRing  =   False
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
      LockRight       =   False
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
      Width           =   361
   End
   Begin Label Label1
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   417
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   648
      Transparent     =   False
      Underline       =   False
      Value           =   "Anchor X:"
      Visible         =   True
      Width           =   75
   End
   Begin Label Label2
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   417
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   680
      Transparent     =   False
      Underline       =   False
      Value           =   "Anchor Y:"
      Visible         =   True
      Width           =   75
   End
   Begin Slider AnchorXSlider
      AllowAutoDeactivate=   True
      AllowLiveScrolling=   True
      Enabled         =   True
      Height          =   23
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   497
      LineStep        =   10
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MaximumValue    =   500
      MinimumValue    =   -500
      PageStep        =   50
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TickMarkStyle   =   "0"
      Tooltip         =   ""
      Top             =   648
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   216
   End
   Begin Slider AnchorYSlider
      AllowAutoDeactivate=   True
      AllowLiveScrolling=   True
      Enabled         =   True
      Height          =   23
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   497
      LineStep        =   10
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MaximumValue    =   500
      MinimumValue    =   -500
      PageStep        =   50
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TickMarkStyle   =   "0"
      Tooltip         =   ""
      Top             =   680
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   216
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  #Pragma Unused Key
		  
		  If Keyboard.AsyncKeyDown(&h7B) Then
		    // Left.
		    MyMapCanvas1.TileMap.Camera.TranslateX(-20)
		    MyMapCanvas1.Invalidate
		  End If
		  If Keyboard.AsyncKeyDown(&h7C) Then
		    // Right.
		    MyMapCanvas1.TileMap.Camera.TranslateX(20)
		    MyMapCanvas1.Invalidate
		  End If
		  If Keyboard.AsyncKeyDown(&h7D) Then
		    // Down.
		    MyMapCanvas1.TileMap.Camera.TranslateY(20)
		    MyMapCanvas1.Invalidate
		  End If
		  If Keyboard.AsyncKeyDown(&h7E) Then
		    // Up.
		    MyMapCanvas1.TileMap.Camera.TranslateY(-20)
		    MyMapCanvas1.Invalidate
		  End If
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  ' // Assign a small square camera with an origin at the top-left corner of the map, 
		  ' // anchored to the top left corner of the canvas.
		  ' Var cameraAnchor As Point = New Point(0, 0)
		  ' Var cameraViewport As Rect = New Rect(0, 0, 300, 300)
		  ' Var camera As GameKit.Camera2D = New GameKit.Camera2D(cameraAnchor, cameraViewport)
		  
		  // Anchor the map to the top left corner of the canvas and create a camera whose 
		  // viewport is the same size as the canvas.
		  Var cameraAnchor As Point = New Point(0, 0)
		  Var cameraViewport As Rect = New Rect(0, 0, MyMapCanvas1.Width, MyMapCanvas1.Height)
		  Var camera As GameKit.Camera2D = New GameKit.Camera2D(cameraAnchor, cameraViewport)
		  
		  // Assign the camera to this map.
		  MyMapCanvas1.SetCamera(camera)
		  
		  // Force a redraw of the canvas.
		  MyMapCanvas1.Refresh
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  // Update the size of the camera's viewport to match the new size of the canvas.
		  MyMapCanvas1.TileMap.Camera.ResizeViewport(MyMapCanvas1.Width, MyMapCanvas1.Height)
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events MyMapCanvas1
	#tag Event , Description = 546865206D6170206861732066696E69736865642072656E646572696E6720697473656C6620746F20746865204772617068696373206F626A6563742E
		Sub DidRender(g As Graphics)
		  #Pragma Unused g
		  
		  DebugInfo.Value = "Rendered " + Me.TileMap.TilesRendered.ToString + " tiles."
		  
		  // Draw a frame around the rendered map.
		  g.DrawingColor = Color.Blue
		  g.DrawRectangle(Me.TileMap.Anchor.X, Me.TileMap.Anchor.Y, _
		  Me.TileMap.Camera.Viewport.Width, Me.TileMap.Camera.Viewport.Height)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AnchorXSlider
	#tag Event
		Sub ValueChanged()
		  If MyMapCanvas1.TileMap.Camera <> Nil Then
		    MyMapCanvas1.SetAnchor(Me.Value, MyMapCanvas1.TileMap.Anchor.Y)
		    MyMapCanvas1.Invalidate
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AnchorYSlider
	#tag Event
		Sub ValueChanged()
		  If MyMapCanvas1.TileMap.Camera <> Nil Then
		    MyMapCanvas1.SetAnchor(MyMapCanvas1.TileMap.Anchor.X, Me.Value)
		    MyMapCanvas1.Invalidate
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
