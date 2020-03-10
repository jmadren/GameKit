#tag Class
Protected Class SquareTileMap
Inherits XGE.TileMaps.TileMapBase
Implements TileMap, XGE.Observer
	#tag Method, Flags = &h21, Description = 52657475726E7320746865206461746120726571756972656420746F2072656E6465722074686973206D617020746F207468652063616D65726127732076696577706F72742E
		Private Function ComputeRenderData() As XGE.TileMaps.TileMapRenderData
		  ///
		  ' Returns the data required to render this map to the camera's viewport.
		  '
		  ' - Returns: An XGETileMapRenderData object containing the row and colum of the 
		  ' top left and bottom right visible tiles as well as the X and Y scroll offset.
		  '
		  ' - Note: The tiles at the top left and bottom right may be only partially visible.
		  
		  Var viewportOriginX As Double = Camera.Viewport.Origin.X
		  Var viewportOriginY As Double = Camera.Viewport.Origin.Y
		  
		  Var topLeftCol As Integer = Floor(viewportOriginX / mTileWidth)
		  topLeftCol = XGE.Maths.Clamp(topLeftCol, 0, mTiles.LastRowIndex(2))
		  
		  Var bottomRightCol As Integer = (topLeftCol + Camera.Viewport.Width / mTileWidth) + 1
		  bottomRightCol = XGE.Maths.Clamp(bottomRightCol, 0, mTiles.LastRowIndex(2))
		  
		  Var topLeftRow As Integer = Floor(viewportOriginY / mTileHeight)
		  topLeftRow = XGE.Maths.Clamp(topLeftRow, 0, mTiles.LastRowIndex(1))
		  
		  Var bottomRightRow As Integer = (topLeftRow + Camera.Viewport.Height / mTileHeight) + 1
		  bottomRightRow = XGE.Maths.Clamp(bottomRightRow, 0, mTiles.LastRowIndex(1))
		  
		  Var offsetX As Double = -viewportOriginX + (topLeftCol * mTileWidth)
		  Var offsetY As Double = -viewportOriginY + (topLeftRow * mTileHeight)
		  
		  Return New XGE.TileMaps.TileMapRenderData(topLeftRow, topLeftCol, _
		  bottomRightRow, bottomRightCol, offsetX, offsetY)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(rows As Integer, columns As Integer, tileWidth As Integer, tileHeight As Integer)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(rows, columns, tileWidth, tileHeight)
		  
		  mTiles.ResizeTo(rows - 1, columns - 1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 416E20584745206E6F74696669636174696F6E20686173206265656E2072656365697665642E
		Sub NotificationReceived(data As Variant, e As XGE.Events)
		  /// 
		  ' An XGE notification has been received.
		  '
		  ' - Parameter data: Data sent along with the notification (may be Nil).
		  ' - Parameter e: The event type.
		  '
		  ' - Note: Part of the XGE.Observer interface.
		  ///
		  
		  // Is this an event we care about?
		  Select Case e
		  Case XGE.Events.Camera2DDidMove, _
		    XGE.Events.Camera2DViewportDidResize
		    UpdateBuffer
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Render(g As Graphics, areas() As REALbasic.Rect)
		  ///
		  ' Draw this map to the passed Graphics object.
		  '
		  ' - Parameter g: The Graphics object that should be drawn to.
		  ' - Parameter areas(): An array of Rect areas that need repainting. We only 
		  '                      need to draw this map IF this map's viewport is contained 
		  '                      within one of these areas.
		  '
		  ' - Note: Part of the XGETileMap interface.
		  ///
		  
		  // First check to see if this tile map has a valid camera. It can't draw if it doesn't.
		  If Self.Camera = Nil Then Return
		  
		  // First of all, is our viewport visible in any of the passed areas that need painting?
		  // We check for intersection rather than containment as we will redraw the map if any 
		  // part of its viewport is within one of the specified areas.
		  Var needsRedrawing As Boolean = False
		  
		  // If no areas have been specified, then the entire Graphics object needs redrawing.
		  If areas.Count = 0 Then needsRedrawing = True
		  For Each area As REALbasic.Rect In areas
		    If Camera.Intersects(area) Then
		      needsRedrawing = True
		      Exit
		    End If
		  Next area
		  
		  // Bail early if possible.
		  If Not needsRedrawing Then Return
		  
		  // Draw the buffer to the Graphics object at the correct location.
		  g.DrawPicture(mBuffer, Self.Camera.Anchor.X, Self.Camera.Anchor.Y)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTile(tile As XGE.TileMaps.SquareTile, row As Integer, column As Integer)
		  ///
		  ' - Note: Part of the XGETileMap interface.
		  ///
		  
		  tile.Row = row
		  tile.Column = column
		  mTiles(row, column) = tile
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TilesRendered() As Integer
		  ///
		  ' Returns the number of tiles rendered during the last Render operation.
		  '
		  ' - Note: Part of the XGETileMap interface.
		  ///
		  
		  Return mTilesRendered
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateBuffer()
		  ///
		  ' Draw this tile map to our buffer which we will resize to the current viewport.
		  '
		  ' - Notes:
		  ' Assumes that the map's camera is not Nil.
		  ///
		  
		  // Draw the visible tiles.
		  Var renderData As XGE.TileMaps.TileMapRenderData = ComputeRenderData
		  
		  Var viewportWidth As Double = Self.Camera.Viewport.Width
		  Var viewportHeight As Double = Self.Camera.Viewport.Height
		  
		  If mBuffer = Nil Or mBuffer.Width <> viewportWidth Or mBuffer.Height <> viewportHeight Then
		    mBuffer = New Picture(viewportWidth, viewportHeight)
		  End If
		  
		  // Draw the background.
		  mBuffer.Graphics.DrawingColor = Color.LightGray
		  mBuffer.Graphics.FillRectangle(0, 0, mBuffer.Width, mBuffer.Height)
		  
		  #Pragma Warning "Just for debugging"
		  mTilesRendered = 0
		  
		  For col As Integer = renderData.TopLeftColumn To renderData.BottomRightColumn
		    For row As Integer = renderData.TopLeftRow To renderData.BottomRightRow
		      Var x As Double = (col - renderData.TopLeftColumn) * mTileWidth + renderData.OffsetX
		      // Var x As Double = (col - renderData.TopLeftColumn) * mTileWidth
		      Var y As Double = (row - renderData.TopLeftRow) * mTileHeight + renderData.OffsetY
		      // Var y As Double = (row - renderData.TopLeftRow) * mTileHeight
		      
		      mTiles(row, col).Render(mBuffer.Graphics, x, y, mTileWidth, mTileHeight)
		      
		      #Pragma Warning "Just for debugging"
		      mTilesRendered = mTilesRendered + 1
		    Next row
		  Next col
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mBuffer As Picture
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 28726F772C20636F6C756D6E29
		Private mTiles(-1,-1) As XGE.TileMaps.SquareTile
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTilesRendered As Integer = 0
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
