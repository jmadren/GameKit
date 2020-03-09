#tag Class
Protected Class XGETileMapBase
	#tag Method, Flags = &h1
		Protected Sub Constructor(rows As Integer, columns As Integer, tileWidth As Integer, tileHeight As Integer)
		  ///
		  ' Constructs a new base tile map.
		  '
		  ' - Parameter rows: The number of rows of tiles this map should have.
		  ' - Parameter columns: The number of columns of tiles this map should have.
		  ' - Parameter tileWidth: The width (in pixels) of a tile.
		  ' - Parameter tileHeight: The height (in pixels) of a tile.
		  ///
		  
		  // Validate the map size.
		  If rows <= 0 Then
		    Raise New InvalidArgumentException(XGEMessages.TILE_MAP_INVALID_ROW_SIZE)
		  ElseIf columns <= 0 Then
		    Raise New InvalidArgumentException(XGEMessages.TILE_MAP_INVALID_COLUMN_SIZE)
		  End If
		  
		  // Validate the tile sizes.
		  If tileWidth <= 0 Then
		    Raise New InvalidArgumentException(XGEMessages.TILE_MAP_INVALID_TILE_WIDTH)
		  ElseIf tileHeight <= 0 Then
		    Raise New InvalidArgumentException(XGEMessages.TILE_MAP_INVALID_TILE_HEIGHT)
		  End If
		  
		  mRows = rows
		  mColumns = columns
		  mTileWidth = tileWidth
		  mTileHeight = tileHeight
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0, Description = 5468652076696577706F7274206F662074686973206D617020696E2069747320636F6E7461696E696E67204772617068696373206F626A6563742E2053706563696669657320746865206865696768742C20776964746820616E64206F726967696E2E
		Camera As XGECamera2D
	#tag EndProperty

	#tag Property, Flags = &h1, Description = 546865206E756D626572206F6620636F6C756D6E732074686973206D6170206861732E
		Protected mColumns As Integer = 0
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
