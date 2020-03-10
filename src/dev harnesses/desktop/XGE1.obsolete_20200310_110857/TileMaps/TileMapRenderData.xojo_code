#tag Class
Private Class TileMapRenderData
	#tag Method, Flags = &h0
		Sub Constructor(tlr As Integer, tlc As Integer, brr As Integer, brc As Integer, offsetX As Double, offsetY As Double)
		  TopLeftRow = tlr
		  TopLeftColumn = tlc
		  BottomRightRow = brr
		  BottomRightColumn = brc
		  Self.OffsetX = offsetX
		  Self.OffsetY = offsetY
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		BottomRightColumn As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		BottomRightRow As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		OffsetX As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		OffsetY As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		TopLeftColumn As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		TopLeftRow As Integer = 0
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
		#tag ViewProperty
			Name="TopLeftColumn"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BottomRightColumn"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BottomRightRow"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="OffsetX"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="OffsetY"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TopLeftRow"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
