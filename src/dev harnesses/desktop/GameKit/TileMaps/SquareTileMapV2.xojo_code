#tag Class
Protected Class SquareTileMapV2
Inherits GameKit.TileMaps.TileMapBase
Implements TileMap,GameKit.Observer
	#tag Method, Flags = &h0
		Sub Constructor(rows As Integer, columns As Integer, tileWidth As Integer, tileHeight As Integer, anchorX As Double, anchorY As Double)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(rows, columns, tileWidth, tileHeight, anchorX, anchorY)
		  
		  mTiles.ResizeTo(rows - 1, columns - 1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 412047616D654B6974206E6F74696669636174696F6E20686173206265656E2072656365697665642E
		Sub NotificationReceived(data As Variant, e As GameKit.Events)
		  /// 
		  ' A GameKit notification has been received.
		  '
		  ' - Parameter data: Data sent along with the notification (may be Nil).
		  ' - Parameter e: The event type.
		  '
		  ' - Note: Part of the GameKit.Observer interface.
		  ///
		  
		  #Pragma Unused data
		  #Pragma Unused e
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RedrawEntireMap()
		  mBuffer = New Picture(mTileWidth * (mTiles.LastRowIndex(2) + 1), mTileHeight * (mTiles.LastRowIndex(1) + 1))
		  
		  Var colLimit As Integer = mTiles.LastRowIndex(2)
		  Var rowLimit As Integer = mTiles.LastRowIndex(1)
		  Var x, y As Integer
		  For col As Integer = 0 To colLimit
		    For row As Integer = 0 To rowLimit
		      x = col * mTileWidth
		      y = row * mTileHeight
		      
		      mTiles(row, col).Render(mBuffer.Graphics, x, y, mTileWidth, mTileHeight)
		    Next row
		  Next col
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 447261772074686973206D617020746F2074686520706173736564204772617068696373206F626A6563742E
		Sub Render(g As Graphics)
		  ///
		  ' Draw this map to the passed Graphics object.
		  '
		  ' - Parameter g: The Graphics object that should be drawn to.
		  '
		  ' - Note: Part of the GameKit.TileMaps.TileMap interface.
		  ///
		  
		  // First check to see if this tile map has a valid camera. It can't draw if it doesn't.
		  If Self.Camera = Nil Then Return
		  
		  If mBuffer = Nil Then RedrawEntireMap
		  
		  // Draw the viewport to the Graphics object at the correct location.
		  g.DrawPicture(mBuffer, Anchor.X, Anchor.Y, _
		  Self.Camera.Viewport.Width, Self.Camera.Viewport.Height, _
		  Self.Camera.Viewport.Origin.X, Self.Camera.Viewport.Origin.Y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 41737369676E7320746865207061737365642074696C6520746F207468652073706563696669656420726F7720616E6420636F6C756D6E2E
		Sub SetTile(tile As GameKit.TileMaps.SquareTile, row As Integer, column As Integer)
		  ///
		  ' - Note: Part of the GameKit.TileMaps.TileMap interface.
		  ///
		  
		  tile.Row = row
		  tile.Column = column
		  mTiles(row, column) = tile
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mBuffer As Picture
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 28726F772C20636F6C756D6E29
		Private mTiles(-1,-1) As GameKit.TileMaps.SquareTile
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
