#tag Class
Protected Class SquareTileMap
Inherits GameKit.TileMaps.TileMapBase
Implements TileMap,GameKit.Observer
	#tag Method, Flags = &h21, Description = 52657475726E7320746865206461746120726571756972656420746F2072656E6465722074686973206D617020746F207468652063616D65726127732076696577706F72742E
		Private Sub ComputeRenderData()
		  ///
		  ' Computes the data required to render this map to the camera's viewport.
		  '
		  ' - Note: The tiles at the top left and bottom right may be only partially visible.
		  
		  Var viewportOriginX As Double = Camera.Viewport.Origin.X
		  Var viewportOriginY As Double = Camera.Viewport.Origin.Y
		  
		  mRenderTopLeftColumn = Floor(viewportOriginX / mTileWidth)
		  mRenderTopLeftColumn = GameKit.Maths.Clamp(mRenderTopLeftColumn, 0, mTiles.LastRowIndex(2))
		  
		  mRenderBottomRightColumn = (mRenderTopLeftColumn + Camera.Viewport.Width / mTileWidth) + 1
		  mRenderBottomRightColumn = GameKit.Maths.Clamp(mRenderBottomRightColumn, 0, mTiles.LastRowIndex(2))
		  
		  mRenderTopLeftRow = Floor(viewportOriginY / mTileHeight)
		  mRenderTopLeftRow = GameKit.Maths.Clamp(mRenderTopLeftRow, 0, mTiles.LastRowIndex(1))
		  
		  mRenderBottomRightRow = (mRenderTopLeftRow + Camera.Viewport.Height / mTileHeight) + 1
		  mRenderBottomRightRow = GameKit.Maths.Clamp(mRenderBottomRightRow, 0, mTiles.LastRowIndex(1))
		  
		  mRenderOffsetX = -viewportOriginX + (mRenderTopLeftColumn * mTileWidth)
		  mRenderOffsetY = -viewportOriginY + (mRenderTopLeftRow * mTileHeight)
		  
		  
		End Sub
	#tag EndMethod

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
		  ' An GameKit notification has been received.
		  '
		  ' - Parameter data: Data sent along with the notification (may be Nil).
		  ' - Parameter e: The event type.
		  '
		  ' - Note: Part of the GameKit.Observer interface.
		  ///
		  
		  #Pragma Unused data
		  
		  // Is this an event we care about?
		  Select Case e
		  Case GameKit.Events.Camera2DDidMove, GameKit.Events.Camera2DViewportDidResize
		    // We need to redraw the buffer whenever the camera position or viewport changes.
		    UpdateBuffer
		  End Select
		  
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
		  
		  // Check we actually have a buffer to draw.
		  If mBuffer = Nil Then UpdateBuffer
		  
		  // Draw the buffer to the Graphics object at the correct location.
		  g.DrawPicture(mBuffer, Anchor.X, Anchor.Y)
		  
		  
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

	#tag Method, Flags = &h21
		Private Sub UpdateBuffer()
		  ///
		  ' Draw this tile map to our buffer which we will resize to the current viewport.
		  ///
		  
		  If Self.Camera = Nil Then
		    Raise New NilObjectException(GameKit.Messages.CAMERA2D_NIL)
		  End If
		  
		  ComputeRenderData
		  
		  Var viewportWidth As Double = Self.Camera.Viewport.Width
		  Var viewportHeight As Double = Self.Camera.Viewport.Height
		  
		  If mBuffer = Nil Or mBuffer.Width <> viewportWidth Or mBuffer.Height <> viewportHeight Then
		    mBuffer = New Picture(viewportWidth, viewportHeight)
		  End If
		  
		  // Draw the background.
		  mBuffer.Graphics.DrawingColor = Color.LightGray
		  mBuffer.Graphics.FillRectangle(0, 0, mBuffer.Width, mBuffer.Height)
		  
		  Var x, y As Integer
		  For col As Integer = mRenderTopLeftColumn To mRenderBottomRightColumn
		    For row As Integer = mRenderTopLeftRow To mRenderBottomRightRow
		      x = (col - mRenderTopLeftColumn) * mTileWidth + mRenderOffsetX
		      y = (row - mRenderTopLeftRow) * mTileHeight + mRenderOffsetY
		      
		      mTiles(row, col).Render(mBuffer.Graphics, x, y, mTileWidth, mTileHeight)
		    Next row
		  Next col
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mBuffer As Picture
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 54686520626F74746F6D20726967687420636F6C756D6E20696E64657820746F2072656E6465722E
		Private mRenderBottomRightColumn As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 54686520626F74746F6D20726967687420726F7720696E64657820746F2072656E6465722E
		Private mRenderBottomRightRow As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 546865207363726F6C6C2058206F666673657420666F722072656E646572696E672E
		Private mRenderOffsetX As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 546865207363726F6C6C2059206F666673657420666F722072656E646572696E672E
		Private mRenderOffsetY As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 54686520696E646578206F662074686520746F70206C65667420636F6C756D6E20746F2072656E6465722E
		Private mRenderTopLeftColumn As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 54686520696E646578206F662074686520746F70206C65667420726F7720746F2072656E6465722E
		Private mRenderTopLeftRow As Integer = 0
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
