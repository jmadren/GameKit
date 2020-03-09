#tag Module
Protected Module XGEMaths
	#tag Method, Flags = &h1, Description = 52657475726E73206076616C75656020636C616D70656420746F2074686520696E636C75736976652072616E6765206F6620606D696E6020616E6420606D6178602E
		Protected Function Clamp(value As Double, min As Double, max As Double) As Double
		  ///
		  ' Returns `value` clamped to the inclusive range of `min` and `max`.
		  '
		  ' - Parameter value: The value to be clamped.
		  ' - Parameter min: The lower bound of the result.
		  ' - Parameter max: The upper bound of the result.
		  '
		  ' - Returns: Double.
		  ///
		  
		  If value < min Then
		    Return min
		  ElseIf value > max Then
		    Return max
		  Else
		    Return value
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ComputeEpsilon()
		  // Computes an approximation of machine epsilon.
		  
		  mEpsilon = 0.5
		  
		  While (1.0 + mEpsilon > 1.0)
		    mEpsilon = mEpsilon * 0.5
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E73206120617070726F78696D6174696F6E206F66206D616368696E6520657073696C6F6E2E
		Protected Function Epsilon() As Double
		  ///
		  ' Returns a approximation of machine epsilon.
		  ///
		  
		  Return mEpsilon
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Initialise()
		  If Not mInitialised Then
		    ComputeEpsilon
		  End If
		  
		  mInitialised = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E7320746865207061737365642072616469616E732076616C756520696E20646567726565732E
		Protected Function ToDegrees(radians As Double) As Double
		  ///
		  ' Returns the passed radians value in degrees.
		  ' 
		  ' - Parameter radians: The value to convert
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return radians * m180_OVER_PI
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E73207468652070617373656420646567726565732076616C756520696E2072616469616E732E
		Protected Function ToRadians(degrees As Double) As Double
		  ///
		  ' Returns the passed degrees value in radians.
		  ' 
		  ' - Parameter degrees: The angle in degrees.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return degrees * mPI_OVER_180
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21, Description = 416E20617070726F78696D6174696F6E206F66206D616368696E6520657073696C6F6E2E
		Private mEpsilon As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInitialised As Boolean = False
	#tag EndProperty


	#tag Constant, Name = m180_OVER_PI, Type = Double, Dynamic = False, Default = \"57.2957795131", Scope = Private
	#tag EndConstant

	#tag Constant, Name = MPI_OVER_180, Type = Double, Dynamic = False, Default = \"0.01745329251", Scope = Private
	#tag EndConstant

	#tag Constant, Name = PI, Type = Double, Dynamic = False, Default = \"3.14159265359", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TWO_PI, Type = Double, Dynamic = False, Default = \"6.28318530718", Scope = Protected
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
