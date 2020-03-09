#tag Interface
Protected Interface XGETile
	#tag Method, Flags = &h0
		Function Column() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Column(Assigns value As Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E73747275637473207468652074696C6520746F206472617720697473656C6620746F2074686520706173736564204772617068696373206F626A6563742E
		Sub Render(g As Graphics, offsetX As Double, offsetY As Double, tileWidth As Double, tileHeight As Double)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Row() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Row(Assigns value As Integer)
		  
		End Sub
	#tag EndMethod


End Interface
#tag EndInterface
