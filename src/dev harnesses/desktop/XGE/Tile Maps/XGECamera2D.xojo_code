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

	#tag Method, Flags = &h0, Description = 50616E73207468652063616D65726120646F776E2074686520737065636966696564206E756D626572206F6620706978656C732E
		Sub PanDown(value As Integer)
		  ///
		  ' Pans the camera down the specified number of pixels.
		  '
		  ' - Parameter value: The number of pixels to pan the camera down by.
		  ///
		  
		  mGeometry.Origin.Y = mGeometry.Origin.Y - value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 50616E73207468652063616D6572612074686520737065636966696564206E756D626572206F6620706978656C7320746F20746865206C6566742E
		Sub PanLeft(value As Integer)
		  ///
		  ' Pans the camera the specified number of pixels to the left.
		  '
		  ' - Parameter value: The number of pixels to pan the camera to the left by.
		  ///
		  
		  mGeometry.Origin.X = mGeometry.Origin.X - value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 50616E73207468652063616D6572612074686520737065636966696564206E756D626572206F6620706978656C7320746F207468652072696768742E
		Sub PanRight(value As Integer)
		  ///
		  ' Pans the camera the specified number of pixels to the right.
		  '
		  ' - Parameter value: The number of pixels to pan the camera to the right by.
		  ///
		  
		  mGeometry.Origin.X = mGeometry.Origin.X + value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 50616E73207468652063616D6572612075702074686520737065636966696564206E756D626572206F6620706978656C732E
		Sub PanUp(value As Integer)
		  ///
		  ' Pans the camera up the specified number of pixels.
		  '
		  ' - Parameter value: The number of pixels to pan the camera up by.
		  ///
		  
		  mGeometry.Origin.Y = mGeometry.Origin.Y + value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 536574732074686520776964746820616E6420686569676874206F66207468652063616D65726127732076696577706F72742E
		Sub SetViewport(width As Double, height As Double)
		  ///
		  ' Sets the width and height of the camera's viewport.
		  '
		  ' - Parameter width: The width (in pixels) of the viewport.
		  ' - Parameter height: The height (in pixels) of the viewport.
		  '
		  ///
		  
		  mGeometry.Width = width
		  mGeometry.Height = height
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746869732063616D65726127732076696577706F72742028692E652069747320776964746820616E6420686569676874292061732061206E65772052656374206F626A6563742E
		Function Viewport() As REALbasic.Rect
		  ///
		  ' Returns this camera's viewport (i.e its width and height) as a new Rect object.
		  '
		  ' - Returns: A copy of this camera's mGeometry object.
		  ///
		  
		  Return mGeometry.Clone
		  
		End Function
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
