#tag Class
Protected Class SquareTile
Implements XGE.TileMaps.Tile
	#tag Method, Flags = &h0
		Function Column() As Integer
		  Return mColumn
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Column(Assigns value As Integer)
		  If CanModifyColumnIndex Then
		    mColumn = value
		    CanModifyColumnIndex = False
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(colour As Color)
		  Self.Colour = colour
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Render(g As Graphics, offsetX As Double, offsetY As Double, tileWidth As Double, tileHeight As Double)
		  // Part of the XGETile interface.
		  
		  // Cache the current Graphics drawing colour.
		  Var cachedDrawingColour As Color = g.DrawingColor
		  
		  // Draw the fill colour.
		  g.DrawingColor = Self.Colour
		  g.FillRectangle(offsetX, offsetY, tileWidth, tileHeight)
		  
		  // Draw the border.
		  g.DrawingColor = Color.Black
		  g.DrawRectangle(offsetX, offsetY, tileWidth, tileHeight)
		  
		  // Restore the Graphics drawing colour.
		  g.DrawingColor = cachedDrawingColour
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Row() As Integer
		  Return mRow
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Row(Assigns value As Integer)
		  If CanModifyRowIndex Then
		    mRow = value
		    CanModifyRowIndex = False
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21, Description = 49662054727565207468656E2074686520636F6C756D6E20696E64657820666F7220746869732074696C652063616E206E6F206C6F6E676572206265206D6F6469666965642E
		Private CanModifyColumnIndex As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 49662054727565207468656E2074686520726F7720696E64657820666F7220746869732074696C652063616E206E6F206C6F6E676572206265206D6F6469666965642E
		Private CanModifyRowIndex As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		Colour As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		mColumn As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		mRow As Integer = 0
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
			Name="mRow"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Colour"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="mColumn"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
