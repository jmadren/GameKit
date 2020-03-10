#tag Module
Protected Module Messages
	#tag Constant, Name = CAMERA2D_NIL, Type = String, Dynamic = False, Default = \"The Camera2D was unexpectedly Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CAMERA_ANCHOR_NIL, Type = String, Dynamic = False, Default = \"The camera\'s anchor Point cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CAMERA_INVALID_VIEWPORT_HEIGHT, Type = String, Dynamic = False, Default = \"The camera\'s viewport height must be greater than or equal to 0.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CAMERA_INVALID_VIEWPORT_WIDTH, Type = String, Dynamic = False, Default = \"The camera\'s viewport width must be greater than or equal to 0.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CAMERA_NIL, Type = String, Dynamic = False, Default = \"The camera object cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CAMERA_ORIGIN_INVALID_X, Type = String, Dynamic = False, Default = \"The viewport origin X coordinate must be >\x3D 0.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CAMERA_ORIGIN_INVALID_Y, Type = String, Dynamic = False, Default = \"The viewport origin Y coordinate must be >\x3D 0.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CAMERA_ORIGIN_NIL, Type = String, Dynamic = False, Default = \"The viewport origin cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CAMERA_VIEWPORT_NIL, Type = String, Dynamic = False, Default = \"The camera\'s viewport Rect cannot be Nil.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GEOMETRY_ROTATION_INVALID_POINT, Type = String, Dynamic = False, Default = \"The given values do not lie on the unit circle.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TILE_MAP_INVALID_COLUMN_SIZE, Type = String, Dynamic = False, Default = \"A tile map must have >\x3D 0 columns.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TILE_MAP_INVALID_ROW_SIZE, Type = String, Dynamic = False, Default = \"A tile map must have >\x3D 0 rows.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TILE_MAP_INVALID_TILE_HEIGHT, Type = String, Dynamic = False, Default = \"The height of a tile must be greater than zero.", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TILE_MAP_INVALID_TILE_WIDTH, Type = String, Dynamic = False, Default = \"The width of a tile must be greater than zero.", Scope = Protected
	#tag EndConstant


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
End Module
#tag EndModule
