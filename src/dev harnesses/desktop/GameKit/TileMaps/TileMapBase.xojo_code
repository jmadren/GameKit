#tag Class
Private Class TileMapBase
Implements GameKit.Subject
	#tag Method, Flags = &h0, Description = 416464732074686520737065636966696564206F6273657276657220606F6020746F206F7572206B6E6F776E206F62736572766572732E
		Sub AddObserver(o As GameKit.Observer)
		  ///
		  ' Adds the specified observer `o` to our known observers.
		  '
		  ' - Parameter o: The observer to add.
		  '
		  ' - Note: Part of the GameKit.Subject interface.
		  ///
		  
		  If Not mObservers.HasKey(o) Then mObservers.Value(o) = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120636C6F6E65206F662074686973206D6170277320616E63686F7220506F696E742E
		Function Anchor() As Point
		  ///
		  ' Returns a clone of this map's anchor Point.
		  ///
		  
		  Return mAnchor.Clone
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(rows As Integer, columns As Integer, tileWidth As Integer, tileHeight As Integer, anchorX As Double, anchorY As Double)
		  ///
		  ' Constructs a new base tile map.
		  '
		  ' - Parameter rows: The number of rows of tiles this map should have.
		  ' - Parameter columns: The number of columns of tiles this map should have.
		  ' - Parameter tileWidth: The width (in pixels) of a tile.
		  ' - Parameter tileHeight: The height (in pixels) of a tile.
		  ///
		  
		  mObservers = New Dictionary
		  
		  // Validate the map size.
		  If rows <= 0 Then
		    Raise New InvalidArgumentException(GameKit.Messages.TILE_MAP_INVALID_ROW_SIZE)
		  ElseIf columns <= 0 Then
		    Raise New InvalidArgumentException(GameKit.Messages.TILE_MAP_INVALID_COLUMN_SIZE)
		  End If
		  
		  // Validate the tile sizes.
		  If tileWidth <= 0 Then
		    Raise New InvalidArgumentException(GameKit.Messages.TILE_MAP_INVALID_TILE_WIDTH)
		  ElseIf tileHeight <= 0 Then
		    Raise New InvalidArgumentException(GameKit.Messages.TILE_MAP_INVALID_TILE_HEIGHT)
		  End If
		  
		  mRows = rows
		  mColumns = columns
		  mTileWidth = tileWidth
		  mTileHeight = tileHeight
		  
		  mAnchor = New Point(anchorX, anchorY)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4E6F746966792065616368206F66206F7572206F62736572766572732061626F75742074686520706173736564206576656E742077697468207468652070617373656420646174612E
		Sub Notify(data As Variant, e As GameKit.Events)
		  ///
		  ' Notify each of our observers about the passed event with the passed data.
		  '
		  ' - Parameter data: The data relevent to the event.
		  ' - Parameter e: The event that occurred.
		  '
		  ' - Note: Part of the GameKit.Subject interface.
		  ///
		  
		  For Each entry As DictionaryEntry In mObservers
		    GameKit.Observer(entry.Key).NotificationReceived(data, e)
		  Next entry
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52656D6F76657320746865206F6273657276657220606F602066726F6D206F7572206B6E6F776E206F62736572766572732E
		Sub RemoveObserver(o As GameKit.Observer)
		  ///
		  ' Removes the observer `o` from our known observers.
		  '
		  ' - Parameter o: The observer to remove.
		  '
		  ' - Note: Part of the GameKit.Subject interface.
		  ///
		  
		  If mObservers.HasKey(o) Then mObservers.Remove(o)
		  
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
		  ' - Notifies: TileMapAnchorDidChange
		  ' - Note: (0, 0) is the top-left corner.
		  ///
		  
		  Self.mAnchor.X = x
		  Self.mAnchor.Y = y
		  
		  // Notify observers of the change.
		  Notify(Self, GameKit.Events.TileMapAnchorDidChange)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0, Description = 5468652076696577706F7274206F662074686973206D617020696E2069747320636F6E7461696E696E67204772617068696373206F626A6563742E2053706563696669657320746865206865696768742C20776964746820616E64206F726967696E2E
		Camera As GameKit.Camera2D
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mAnchor As Point
	#tag EndProperty

	#tag Property, Flags = &h1, Description = 546865206E756D626572206F6620636F6C756D6E732074686973206D6170206861732E
		Protected mColumns As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 486F6C647320616E79206F626A65637473207468617420617265206F6273657276696E6720746869732063616D6572612E205374727563747572653A207B6F6273657276696E67206F626A656374203A20756E757365647D2E
		Private mObservers As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1, Description = 546865206E756D626572206F6620726F77732074686973206D6170206861732E
		Protected mRows As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h1, Description = 54686520686569676874206F6620612074696C6520696E2074686973206D61702E
		Protected mTileHeight As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h1, Description = 546865207769647468206F6620612074696C6520696E2074686973206D61702E
		Protected mTileWidth As Double = 0
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
