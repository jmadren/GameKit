#tag Class
Protected Class XGECamera2D
	#tag Method, Flags = &h0
		Sub Constructor()
		  ///
		  ' Default constructor.
		  '
		  ' Creates an infinitely small viewport with a 0, 0 origin.
		  ///
		  
		  mGeometry = New REALbasic.Rect(0, 0, 0, 0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E65772032442063616D65726120776974682074686520737065636966696564206F726967696E20616E642076696577706F72742E
		Sub Constructor(originX As Double, originY As Double, viewportWidth As Double, viewportHeight As Double)
		  ///
		  ' Creates a new 2D camera with the specified origin and viewport.
		  '
		  ' - Parameter originX: The camera origin X coordinate.
		  ' - Parameter originY: The camera origin Y coordinate.
		  ' - Parameter viewportWidth: The width of the camera's viewport in pixels.
		  ' - Parameter viewportHeight: The height of the camera's viewport in pixels.
		  '
		  ' - Raises: InvalidArgumentException if the viewport height or width are < 0.
		  '
		  ' - Notes:
		  ' The origin coordinates are relative to the top-left corner. (0,0) is the top left.
		  
		  // Validate arguments.
		  If viewportWidth < 0 Then
		    Raise New InvalidArgumentException(XGEMessages.CAMERA_INVALID_VIEWPORT_WIDTH)
		  ElseIf viewportHeight < 0 Then
		    Raise New InvalidArgumentException(XGEMessages.CAMERA_INVALID_VIEWPORT_HEIGHT)
		  End If
		  
		  mGeometry = New REALbasic.Rect(originX, originY, viewportWidth, viewportHeight)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Origin() As Point
		  Return mOrigin
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mOrigin As Point
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mViewport As XGEBox
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mOrigin
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mOrigin = value
			End Set
		#tag EndSetter
		Origin As Point
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		Viewport As XGEBox
	#tag EndComputedProperty


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
			InitialValue="-2147483648"
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
	#tag EndViewBehavior
End Class
#tag EndClass
