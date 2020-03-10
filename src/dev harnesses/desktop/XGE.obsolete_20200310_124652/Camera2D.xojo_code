#tag Class
Protected Class Camera2D
	#tag Method, Flags = &h0, Description = 416464732074686520737065636966696564206F6273657276657220606F6020746F206F7572206B6E6F776E206F62736572766572732E
		Sub AddObserver(o As XGE.Observer)
		  ///
		  ' Adds the specified observer `o` to our known observers.
		  '
		  ' - Parameter o: The observer to add.
		  '
		  ' - Note: Part of the XGE.Subject interface.
		  ///
		  
		  If Not mObservers.HasKey(o) Then mObservers.Value(o) = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  ///
		  ' Default constructor.
		  '
		  ' Creates an infinitely small viewport with a (0, 0) origin.
		  ///
		  
		  mViewport = New Rect(0, 0, 0, 0)
		  mObservers = New Dictionary
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E65772032442063616D65726120776974682074686520737065636966696564206F726967696E20616E642076696577706F72742E
		Sub Constructor(viewportOriginX As Double, viewportOriginY As Double, viewportWidth As Double, viewportHeight As Double)
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
		  ///
		  
		  // Validate arguments.
		  If viewportWidth < 0 Then
		    Raise New InvalidArgumentException(XGE.Messages.CAMERA_INVALID_VIEWPORT_WIDTH)
		  ElseIf viewportHeight < 0 Then
		    Raise New InvalidArgumentException(XGE.Messages.CAMERA_INVALID_VIEWPORT_HEIGHT)
		  End If
		  
		  mViewport = New Rect(viewportOriginX, viewportOriginY, viewportWidth, viewportHeight)
		  mObservers = New Dictionary
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(anchor As Point, viewport As Rect)
		  ///
		  ' Creates a new 2D camera with the specified anchor and viewport.
		  '
		  ' - Parameter anhcor: The camera's anchor position. Will be cloned.
		  ' - Parameter viewport: A Rect representing the camera's viewport. Will be cloned.
		  '
		  ' - Raises: InvalidArgumentException if the viewport height or width are < 0.
		  '
		  ' - Notes:
		  ' The viewport origin coordinates are relative to the top-left corner. (0,0) is the top left.
		  ///
		  
		  // Validate arguments.
		  If anchor = Nil Then
		    Raise New InvalidArgumentException(XGE.Messages.CAMERA_ANCHOR_NIL)
		  ElseIf viewport = Nil Then
		    Raise New InvalidArgumentException(XGE.Messages.CAMERA_VIEWPORT_NIL)
		  End If
		  If viewport.Width < 0 Then
		    Raise New InvalidArgumentException(XGE.Messages.CAMERA_INVALID_VIEWPORT_WIDTH)
		  ElseIf viewport.Height < 0 Then
		    Raise New InvalidArgumentException(XGE.Messages.CAMERA_INVALID_VIEWPORT_HEIGHT)
		  End If
		  
		  mViewport = viewport.Clone
		  mObservers = New Dictionary
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73205472756520696620746869732063616D65726127732076696577706F7274206576656E207061727469616C6C7920696E74657273656374732074686520676976656E20526563742E
		Function Intersects(other As REALbasic.Rect) As Boolean
		  ///
		  ' Returns True if this camera's viewport even partially intersects the given Rect.
		  ///
		  
		  // Convert the deprecated REALbasic.Rect to the API 2.0 version.
		  Var r As New Rect(other.Origin.X, other.Origin.Y, other.Width, other.Height)
		  
		  Return mViewport.Intersects(r)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73205472756520696620746869732063616D65726127732076696577706F7274206576656E207061727469616C6C7920696E74657273656374732074686520676976656E20526563742E
		Function Intersects(other As Rect) As Boolean
		  ///
		  ' Returns True if this camera's viewport even partially intersects the given Rect.
		  ///
		  
		  Return mViewport.Intersects(other)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4E6F746966792065616368206F66206F7572206F62736572766572732061626F75742074686520706173736564206576656E742077697468207468652070617373656420646174612E
		Sub Notify(data As Variant, e As XGE.Events)
		  ///
		  ' Notify each of our observers about the passed event with the passed data.
		  '
		  ' - Parameter data: The data relevent to the event.
		  ' - Parameter e: The event that occurred.
		  '
		  ' - Note: Part of the XGE.Subject interface.
		  ///
		  
		  For Each entry As DictionaryEntry In mObservers
		    XGE.Observer(entry.Key).NotificationReceived(data, e)
		  Next entry
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52656D6F76657320746865206F6273657276657220606F602066726F6D206F7572206B6E6F776E206F62736572766572732E
		Sub RemoveObserver(o As XGE.Observer)
		  ///
		  ' Removes the observer `o` from our known observers.
		  '
		  ' - Parameter o: The observer to remove.
		  '
		  ' - Note: Part of the XGE.Subject interface.
		  ///
		  
		  If mObservers.HasKey(o) Then mObservers.Remove(o)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526573697A657320746869732063616D65726127732076696577706F727420776964746820616E64206865696768742E
		Sub ResizeViewport(width As Integer, height As Integer)
		  ///
		  ' Resizes this camera's viewport width and height.
		  '
		  ' - Parameter width: The new width (in pixels). Must be >= 0.
		  ' - Parameter height: The new height (in pixels). Must be >= 0.
		  '
		  ' - Raises: InvalidArgumentException if the width or height are < 0.
		  ///
		  
		  // Validate arguments.
		  If width < 0 Then
		    Raise New InvalidArgumentException(XGE.Messages.CAMERA_INVALID_VIEWPORT_WIDTH)
		  ElseIf height < 0 Then
		    Raise New InvalidArgumentException(XGE.Messages.CAMERA_INVALID_VIEWPORT_HEIGHT)
		  End If
		  
		  mViewport.Width = width
		  mViewport.Height = height
		  
		  // Notify observers of the viewport resizing.
		  Notify(Self, XGE.Events.Camera2DViewportDidResize)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E736C61746573207468652063616D65726120696E20746865205820646972656374696F6E206279206076616C75656020706978656C732E204120706F736974697665206076616C756560206D6F766573207468652063616D6572612072696768742C2061206E65676174697665206076616C756560206D6F766573206974206C6566742E
		Sub TranslateX(value As Double)
		  ///
		  ' Translates the camera in the X direction.
		  '
		  ' - Parameter value: The number of pixels to move the camera in the X direction.
		  '                    A positive value moves the camera right, negative moves it left.
		  ///
		  
		  mViewport.Origin.X = mViewport.Origin.X + value
		  
		  // Notify observers that the camera position changed.
		  // We pass ourselves as the data.
		  Notify(Self, XGE.Events.Camera2DDidMove)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5472616E736C61746573207468652063616D65726120696E20746865205920646972656374696F6E206279206076616C75656020706978656C732E204120706F736974697665206076616C756560206D6F766573207468652063616D65726120646F776E2C2061206E65676174697665206076616C756560206D6F7665732069742075702E
		Sub TranslateY(value As Double)
		  ///
		  ' Translates the camera in the Y direction.
		  '
		  ' - Parameter value: The number of pixels to move the camera in the Y direction.
		  '                    A positive value moves the camera down, negative moves it up.
		  ///
		  
		  mViewport.Origin.Y = mViewport.Origin.Y + value
		  
		  // Notify observers that the camera position changed.
		  // We pass ourselves as the data.
		  Notify(Self, XGE.Events.Camera2DDidMove)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21, Description = 486F6C647320616E79206F626A65637473207468617420617265206F6273657276696E6720746869732063616D6572612E205374727563747572653A207B6F6273657276696E67206F626A656374203A20756E757365647D2E
		Private mObservers As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mViewport As Rect
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ///
			  ' Returns this camera's viewport as a Rect.
			  '
			  ' - Returns: A reference to this camera's viewport Rect.
			  '
			  ' - Notes:
			  ' Altering the returned property will affect this camera's viewport but
			  ' will **not** raise any notifications.
			  ///
			  
			  Return mViewport
			  
			End Get
		#tag EndGetter
		Viewport As Rect
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
