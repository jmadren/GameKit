#tag Interface
Protected Interface TileMap
	#tag Method, Flags = &h0, Description = 496E73747275637473207468652074696C65206D617020746F2072656472617720697473656C662E
		Sub Render(g As Graphics)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 546865206E756D626572206F662074696C65732072656E646572656420647572696E6720746865206C6173742052656E646572206F7065726174696F6E2E
		Function TilesRendered() As Integer
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Render
		======
		Instructs the tile map to draw itself to the passed Graphics object.
		- Parameter g: The Graphics object that the tile map should draw itself to.
		
		
	#tag EndNote


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
End Interface
#tag EndInterface
