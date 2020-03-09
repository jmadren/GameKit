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
		Function Origin() As REALbasic.Point
		  Return mGeometry.Origin
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061207265666572656E636520746F20746869732063616D65726127732076696577706F72742028692E652E3A2069747320776964746820616E64206865696768742920617320612052656374206F626A6563742E
		Function Viewport() As REALbasic.Rect
		  ///
		  ' Returns a reference to this camera's viewport (i.e its width and height).
		  '
		  ' - Returns: REALbasic.Rect.
		  ///
		  
		  #Pragma Error "Broken"
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 536574732074686520776964746820616E6420686569676874206F6620746869732063616D65726127732076696577706F727420746F207468652070617373656420526563742E
		Sub Viewport(Assigns size As REALbasic.Rect)
		  ///
		  ' Sets the width and height of this camera's viewport to the passed Rect.
		  '
		  ' - Parameter size: The Rect representing the viewport.
		  '
		  ' - Note: The passed Rect is kept as a reference.
		  ///
		  
		  mGeometry.Width = size.Width
		  mGeometry.Height = size.Height
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mGeometry As REALbasic.Rect
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
