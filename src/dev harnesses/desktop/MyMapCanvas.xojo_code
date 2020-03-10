#tag Class
Protected Class MyMapCanvas
Inherits Canvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  // Draw a grey background.
		  g.DrawingColor = Color.LightGray
		  g.FillRectangle(0, 0, g.Width, g.Height)
		  
		  // Fire the WillRender event before we render.
		  WillRender(g, areas)
		  
		  // Render the tiles.
		  Self.TileMap.Render(g, areas)
		  
		  // Fire the DidRender event now we're done rendering.
		  DidRender(g, areas)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  // Create a 50 x 50 tile map anchored to (0, 0).
		  Var numRows As Integer = 50
		  Var numColumns As Integer = 50
		  Self.TileMap = New XGE.TileMaps.SquareTileMap(numRows, numColumns, 64, 64, 0, 0)
		  
		  // Add the tiles to the map.
		  For col As Integer = 0 to numColumns - 1
		    For row As Integer = 0 To numRows - 1
		      Var colour As Color
		      If System.Random.InRange(1, 100) < 95 Then
		        colour = Color.White
		      Else
		        colour = Color.Red
		      End If
		      Self.TileMap.SetTile(New XGE.TileMaps.SquareTile(colour), row, col)
		    Next row
		  Next col
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 536574732074686520706F736974696F6E206F662074686973206D6170277320616E63686F7220746F207468652073706563696669656420636F6F7264696E617465732E
		Sub SetAnchor(x As Double, y As Double)
		  ///
		  ' Sets the position of this map's anchor to the specified coordinates.
		  '
		  ' - Parameter x: The new X position of the map's anchor.
		  ' - Parameter y: The new Y position of the map's anchor.
		  '
		  ' - Note: (0, 0) is the top-left corner.
		  ///
		  
		  Self.TileMap.SetAnchor(x, y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCamera(c As XGE.Camera2D)
		  ///
		  ' Sets the passed camera to be the sole camera for this map.
		  '
		  ' - Parameter c: The camera to assign.
		  ///
		  
		  Self.TileMap.Camera = c
		  
		  // Register our tile map as an observer of the camera's activity.
		  Self.TileMap.Camera.AddObserver(Self.TileMap)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E736C6174657320746865206D617027732063616D65726120696E20746865205820646972656374696F6E2E20506F736974697665206D6F7665732069742072696768742C206E65676174697665206C6566742E
		Sub TranslateCameraX(value As Double)
		  ///
		  ' Translates the map's camera in the X direction.
		  '
		  ' - Parameter value: The number of pixels to move the camera. Positive moves it right.
		  ///
		  
		  If Self.TileMap.Camera <> Nil Then Self.TileMap.Camera.TranslateX(value)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E736C6174657320746865206D617027732063616D65726120696E20746865205820646972656374696F6E2E20506F736974697665206D6F76657320697420646F776E2C206E656761746976652075702E
		Sub TranslateCameraY(value As Double)
		  ///
		  ' Translates the map's camera in the Y direction.
		  '
		  ' - Parameter value: The number of pixels to move the camera. Positive moves it down.
		  ///
		  
		  If Self.TileMap.Camera <> Nil Then Self.TileMap.Camera.TranslateY(value)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0, Description = 546865206D6170206861732066696E69736865642072656E646572696E6720697473656C6620746F20746865204772617068696373206F626A6563742E
		Event DidRender(g As Graphics, areas() As REALbasic.Rect)
	#tag EndHook

	#tag Hook, Flags = &h0, Description = 5468652074696C65206D61702069732061626F757420746F2072656E64657220697473656C6620746F20746865204772617068696373206F626A6563742E
		Event WillRender(g As Graphics, areas() As REALbasic.Rect)
	#tag EndHook


	#tag Property, Flags = &h0
		TileMap As XGE.TileMaps.SquareTileMap
	#tag EndProperty


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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group=""
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
