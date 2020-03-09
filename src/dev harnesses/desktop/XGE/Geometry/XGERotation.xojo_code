#tag Class
Protected Class XGERotation
	#tag Method, Flags = &h0, Description = 436F6D7061726573207468697320526F746174696F6E207769746820616E6F74686572206F6E652C206261736564206F6E2074686520616E676C65206265747765656E207468656D2E2052657475726E73203120696620F09D9B9D203E20302C202D3120696620F09D9B9D203C203020616E642030206F74686572776973652E
		Function Compare(other As XGERotation) As Integer
		  ///
		  ' Compares this XGERotation with another one, based on the angle between them.
		  ' (The one with -π <= 𝛝 <= π).
		  ' Returns 1 if 𝛝 > 0, -1 if 𝛝 < 0 and 0 otherwise.
		  '
		  ' - Parameter other: The XGERotation to compare to.
		  '
		  ' - Returns -1, 0 or 1.
		  ///
		  
		  // cmp = sin(𝛝), where 𝛝 is the angle between this rotation and the other.
		  // So we can decide what to return based on the sign of cmp.
		  Var cmp As Double = Self.Cross(other)
		  
		  If cmp > 0.0 Then
		    Return 1
		  ElseIf cmp < 0.0 Then
		    Return -1
		  Else
		    Return 0
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 436F6D7061726573207468697320526F746174696F6E2077697468206120566563746F72322C206261736564206F6E2074686520616E676C65206265747765656E207468656D2E2052657475726E73203120696620F09D9B9D203E20302C202D3120696620F09D9B9D203C203020616E642030206F74686572776973652E
		Function Compare(other As XGEVEctor2) As Integer
		  ///
		  ' Compares this XGERotation with a Vector2, based on the angle between them.
		  ' (The one with -π <= 𝛝 <= π).
		  ' Returns 1 if 𝛝 > 0, -1 if 𝛝 < 0 and 0 otherwise.
		  '
		  ' - Parameter other: The Vector2 to compare to.
		  ' 
		  ' - Returns: 1, 0 or -1.
		  ///
		  
		  // cmp = |v| * sin(𝛝) where 𝛝 is the angle between this rotation and the other.
		  // |v| is always positive and does not affect the result so we can decide 
		  // what to return based just on the sign of cmp.
		  Var cmp As Double = Self.Cross(other)
		  
		  If cmp > 0.0 Then
		    Return 1
		  ElseIf cmp < 0.0 then
		    Return -1
		  Else
		    Return 0
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 44656661756C7420636F6E7374727563746F722E204372656174657320616E206964656E7469747920526F746174696F6E2E
		Sub Constructor()
		  ///
		  ' Default constructor. Creates an identity XGERotation.
		  ///
		  
		  Self.Cost = 1.0 // cos(0).
		  Self.Sint = 0.0 // sin(0).
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 43726561746573206120526F746174696F6E2066726F6D2074686520676976656E20616E676C652028696E2072616469616E73292E
		Sub Constructor(angle As Double)
		  ///
		  ' Creates a XGERotation from the given angle (in radians).
		  '
		  ' - Parameter angle: The angle in radians.
		  ///
		  
		  Self.Cost = Cos(angle)
		  Self.Sint = Sin(angle)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7465726E616C20636F6E7374727563746F722074686174206469726563746C7920736574732074686520636F737420616E642073696E74206669656C6473206F662074686520526F746174696F6E20776974686F7574206164646974696F6E616C2076616C69646174696F6E2E
		Sub Constructor(cost As Double, sint As Double)
		  ///
		  ' Internal constructor that directly sets the cost and sint fields 
		  ' of the XGERotation without additional validation.
		  '
		  ' - Parameter cost: The cosine of some angle.
		  ' - Parameter sint: The sine of the same angle.
		  ///
		  
		  Self.Cost = cost
		  Self.Sint = sint
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 436F707920636F6E7374727563746F722E
		Sub Constructor(rotation As XGERotation)
		  ///
		  ' Copy constructor.
		  '
		  ' - Parameter rotation: The XGERotation to copy from.
		  ///
		  
		  Self.Cost = rotation.Cost
		  Self.Sint = rotation.Sint
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120636F7079206F66207468697320526F746174696F6E2E
		Function Copy() As XGERotation
		  ///
		  ' Returns a copy of Self XGERotation.
		  ///
		  
		  Return New XGERotation(Self.Cost, Self.Sint)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652063726F73732070726F64756374206F6620746865207468697320526F746174696F6E20616E642074686520676976656E20526F746174696F6E2E205468697320697320657373656E7469616C6C79207468652073696E65206F662074686520616E676C65206265747765656E2074686F736520726F746174696F6E732E
		Function Cross(r As XGERotation) As Double
		  ///
		  ' Returns the cross product of the this XGERotation and the given XGERotation.
		  ' This is essentially the sine of the angle between those rotations.
		  '
		  ' - Parameter r: The other XGERotation.
		  '
		  '- Returns: Double.
		  ///
		  
		  Return Self.Cost * r.Sint - Self.Sint * r.Cost
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7465726E616C207573652E2052657475726E73207468652063726F73732070726F64756374206F66207468697320526F746174696F6E20616E642074686520676976656E20566563746F72322E
		Function Cross(vector As XGEVEctor2) As Double
		  ///
		  ' Returns the cross product of this XGERotation and the given Vector2.
		  ' For internal use.
		  '
		  ' - Parameter vector: The Vector2.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.Cost * vector.Y - Self.Sint * vector.X
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520646F742070726F64756374206F6620746865207468697320526F746174696F6E20616E642074686520676976656E20526F746174696F6E2E205468697320697320657373656E7469616C6C79207468652073696E65206F662074686520616E676C65206265747765656E2074686F736520726F746174696F6E732E
		Function Dot(r As XGERotation) As Double
		  ///
		  ' Returns the dot product of the this XGERotation and the given XGERotation.
		  ' This is essentially the sine of the angle between those rotations.
		  '
		  ' - Parameter r: The other XGERotation.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.Cost * r.Cost + Self.Sint * r.Sint
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7465726E616C207573652E2052657475726E732074686520646F742070726F64756374206F66207468697320526F746174696F6E20616E642074686520676976656E20566563746F72322E
		Function Dot(vector As XGEVEctor2) As Double
		  ///
		  ' Returns the dot product of this XGERotation and the given Vector2.
		  ' For internal use.
		  '
		  ' - Parameter vector: The Vector2.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.Cost * vector.X + Self.Sint * vector.Y
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520636F7320616E642073696E20636F6D706F6E656E7473206F66207468697320526F746174696F6E20617265207468652073616D652061732074686520676976656E20616E676C652028696E2072616469616E73292E
		Function Equals(angle As Double) As Boolean
		  ///
		  ' Returns True if the cos and sin components of Self XGERotation are 
		  ' the same as the given angle (in radians).
		  '
		  ' - Parameter angle: The angle in radians.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return Self.Cost = Cos(angle) And Self.Sint = Sin(angle)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520636F7320616E642073696E20636F6D706F6E656E7473206F66207468697320526F746174696F6E20617265207468652073616D652061732074686520676976656E20616E676C65202872616469616E73292C20676976656E2074686520737065636966696564206572726F722E
		Function Equals(angle As Double, error As Double) As Boolean
		  ///
		  ' Returns True if the cos and sin components of Self XGERotation
		  ' are the same as the given angle given the specified error.
		  '
		  ' - Parameter angle: The angle in radians.
		  ' - Parameter error: The error.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return Abs(Self.Cost - Cos(angle)) < error And Abs(Self.Sint - Sin(angle)) < error
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 436F6D7061726573207468697320526F746174696F6E20746F2074686520706173736564206F626A65637420666F7220657175616C6974792E
		Function Equals(obj As Variant) As Boolean
		  ///
		  ' Compares this XGERotation to the passed object for equality.
		  '
		  ' - Returns: True if `obj` is considered equal to this XGERotation.
		  ///
		  
		  If obj = Nil Then Return False
		  If obj = Self Then Return True
		  If obj IsA XGERotation Then
		    Var r As XGERotation = XGERotation(obj)
		    Return If(Self.Cost = r.Cost And Self.Sint = r.Sint, True, False)
		  End If
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520636F7320616E642073696E20636F6D706F6E656E7473206F66207468697320526F746174696F6E20617265207468652073616D652061732074686520676976656E20526F746174696F6E2E
		Function Equals(r As XGERotation) As Boolean
		  ///
		  ' Returns True if the cos and sin components of Self XGERotation 
		  ' are the same as the given XGERotation.
		  '
		  ' - Parameter r: The XGERotation to compare to.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  If r = Nil Then Return False
		  
		  Return Self.Cost = r.Cost And Self.Sint = r.Sint
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520636F7320616E642073696E20636F6D706F6E656E7473206F66207468697320526F746174696F6E20617265207468652073616D652061732074686520676976656E20526F746174696F6E20676976656E2074686520737065636966696564206572726F722E
		Function Equals(r As XGERotation, error As Double) As Boolean
		  ///
		  ' Returns True if the cos and sin components of Self XGERotation are 
		  ' the same as the given XGERotation given the specified error.
		  ' 
		  ' - Parameter r: The XGERotation to compare to.
		  ' - Parameter error: The error.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  If r = Nil Then Return False
		  
		  Return Abs(Self.Cost - r.Cost) < error And Abs(Self.Sint - r.Sint) < error
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652076616C7565206F6620636F7328CE982920666F72207468697320526F746174696F6E2E
		Function GetCost() As Double
		  ///
		  ' Returns the value of cos(Θ) for Self XGERotation.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.Cost
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4E656761746573207468697320726F746174696F6E20616E642072657475726E732061206E657720726F746174696F6E2E
		Function GetInversed() As XGERotation
		  ///
		  ' Negates Self rotation and returns a New XGERotation.
		  ' Let Θ be the rotation, then -Θ is the inverse rotation.
		  ' 
		  ' - Returns: A new XGERotation.
		  ///
		  
		  Return New XGERotation(Self.Cost, -Self.Sint)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320526F746174696F6E2062792074686520676976656E20616E676C652028696E2072616469616E732920616E642072657475726E732061206E657720526F746174696F6E2E
		Function GetRotated(angle As Double) As XGERotation
		  ///
		  ' Rotates this XGERotation by the given angle (in radians) and returns a new XGERotation.
		  '
		  ' - Parameter angle: The rotation in radians.
		  '
		  ' - Returns: A new XGERotation.
		  ///
		  
		  Return Self.GetRotated(Cos(angle), Sin(angle))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7465726E616C206D6574686F6420746861742072657475726E2061206E657720526F746174696F6E20726570726573656E74696E67207468697320526F746174696F6E206166746572206265696E6720726F746174656420627920616E20616E676C6520CE982E
		Function GetRotated(c As Double, s As Double) As XGERotation
		  ///
		  ' Internal method that return a new XGERotation representing this XGERotation
		  ' after being rotated by an angle Θ.
		  '
		  ' - Parameter c: Cos(Θ).
		  ' - Parameter s: Sin(Θ).
		  '
		  ' - Returns: This XGERotation.
		  ///
		  
		  Return new XGERotation(Self.Cost * c - Self.Sint * s, Self.Cost * s + Self.Sint * c)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320526F746174696F6E2062792074686520676976656E20526F746174696F6E20616E642072657475726E732061206E657720526F746174696F6E2E
		Function GetRotated(r As XGERotation) As XGERotation
		  ///
		  ' Rotates this XGERotation by the given XGERotation and returns a new XGERotation.
		  '
		  ' - Parameter r: The XGERotation to rotate by.
		  '
		  ' - Returns: A new XGERotation.
		  ///
		  
		  Return Self.GetRotated(r.Cost, r.Sint)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRotated135() As XGERotation
		  ///
		  ' Rotates Self XGERotation 135 degrees and returns a new XGERotation.
		  '
		  ' - Returns: A new XGERotation.
		  ///
		  
		  // Rotate by 90 and then another 45.
		  Return Self.GetRotated45Helper(-Self.Sint, Self.Cost)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320526F746174696F6E20313830206465677265657320616E642072657475726E732061204E657720726F746174696F6E2E
		Function GetRotated180() As XGERotation
		  ///
		  ' Rotates Self XGERotation 180 degrees and returns a New XGERotation.
		  '
		  ' - Returns: A new XGERotation.
		  ///
		  
		  Return New XGERotation(-Self.cost, -Self.Sint)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320526F746174696F6E20323235206465677265657320616E642072657475726E732061206E657720526F746174696F6E2E
		Function GetRotated225() As XGERotation
		  ///
		  ' Rotates Self XGERotation 225 degrees and returns a new XGERotation.
		  '
		  ' - Returns: A new XGERotation.
		  ///
		  
		  // Rotate by 180 and another 45 degrees.
		  Return Self.GetRotated45Helper(-Self.Cost, -Self.Sint)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320526F746174696F6E20323730206465677265657320616E642072657475726E732061206E657720526F746174696F6E2E
		Function GetRotated270() As XGERotation
		  ///
		  ' Rotates Self XGERotation 270 degrees and returns a new XGERotation.
		  ' 
		  ' - Returns: A new XGERotation.
		  ///
		  
		  Return New XGERotation(Self.Sint, -Self.Cost)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320526F746174696F6E20333135206465677265657320616E642072657475726E732061206E657720526F746174696F6E2E
		Function GetRotated315() As XGERotation
		  ///
		  ' Rotates Self XGERotation 315 degrees and returns a new XGERotation.
		  '
		  ' - Returns: A new XGERotation.
		  ///
		  
		  // Rotate by 270 and then another 45.
		  Return Self.GetRotated45Helper(Self.Sint, -Self.Cost)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320526F746174696F6E203435206465677265657320616E642072657475726E732061206E657720526F746174696F6E2E
		Function GetRotated45() As XGERotation
		  ///
		  ' Rotates Self XGERotation 45 degrees and returns a new XGERotation.
		  '
		  ' - Returns: Self XGERotation.
		  ///
		  
		  Return Self.GetRotated45Helper(Self.Cost, Self.Sint)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 272020496E7465726E616C2068656C706572206D6574686F6420746F20706572666F726D20726F746174696F6E7320636F6E73697374696E67206F662061203435206465677265652E2052657475726E732061206E657720526F746174696F6E2E
		Protected Function GetRotated45Helper(cost As Double, sint As Double) As XGERotation
		  ///
		  '  Internal helper method to perform rotations consisting of a 45 degree.
		  '
		  ' - Parameter cost: The cos of the angle.
		  ' - Parameter sint: the sin of the angle.
		  '
		  '- Returns: A new XGERotation with initial values (cost, sint) and then rotated 45 degrees.
		  ///
		  
		  Return New XGERotation(SQRT_2_INV * (cost - sint), SQRT_2_INV * (cost + sint))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320526F746174696F6E203930206465677265657320616E642072657475726E732061206E657720526F746174696F6E2E
		Function GetRotated90() As XGERotation
		  ///
		  ' Rotates Self XGERotation 90 degrees and returns a new XGERotation.
		  ' 
		  ' - Returns: A new XGERotation.
		  ///
		  
		  Return New XGERotation(-Self.Sint, Self.Cost)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652076616C7565206F662073696E28CE982920666F72207468697320526F746174696F6E2E
		Function GetSint() As Double
		  ///
		  ' Returns the value of sin(Θ) for Self XGERotation.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return Self.Sint
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520616E676C65202861732061206E657720526F746174696F6E29206265747765656E207468697320526F746174696F6E20616E642074686520676976656E20526F746174696F6E2E
		Function GetXGERotationBetween(r As XGERotation) As XGERotation
		  ///
		  ' Returns the angle (as a new XGERotation) between this XGERotation and the given XGERotation.
		  '
		  ' - Parameter r: The other XGERotation.
		  '
		  ' - Returns: A new XGERotation.
		  ///
		  
		  Return New XGERotation(Self.Dot(r), Self.Cross(r))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520616E676C65202861732061206E657720526F746174696F6E29206265747765656E207468697320526F746174696F6E20616E642074686520676976656E20566563746F72322E
		Function GetXGERotationBetween(vector As XGEVEctor2) As XGERotation
		  ///
		  ' Returns the angle (as a new XGERotation) between this XGERotation and the given Vector2.
		  '
		  ' - Parameter vector: The Vector2.
		  '
		  ' - Returns: A new XGERotation.
		  ///
		  
		  Return Self.GetXGERotationBetween(XGERotation.Of_(vector))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4E656761746573207468697320526F746174696F6E20616E642072657475726E73207468697320526F746174696F6E2E
		Function Inverse() As XGERotation
		  ///
		  ' Negates Self XGERotation and returns Self XGERotation.
		  ' Let Θ be the rotation, then -Θ is the inverse rotation.
		  '
		  ' - Returns: Self XGERotation.
		  ///
		  
		  Self.Sint = -Self.Sint
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732054727565206966207468697320526F746174696F6E20697320616E206964656E7469747920526F746174696F6E2E
		Function IsIdentity() As Boolean
		  ///
		  ' Returns True if this XGERotation is an identity XGERotation.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return Self.Cost = 1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732054727565206966207468697320526F746174696F6E20697320616E206964656E7469747920526F746174696F6E2077697468696E2074686520676976656E206572726F722E
		Function IsIdentity(error As Double) As Boolean
		  ///
		  ' Returns True if this XGERotation is an identity XGERotation within the given error.
		  '
		  ' - Parameter error: The error.
		  '
		  ' - Returns: Boolean.
		  ///
		  
		  Return Abs(Self.Cost - 1) < error
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 416C7465726E61746976652077617920746F206372656174652061206E657720526F746174696F6E2066726F6D206120676976656E20616E676C652C20696E20646567726565732E
		Shared Function OfDegrees(angle As Double) As XGERotation
		  ///
		  ' Alternative way to create a new XGERotation from a given angle, in degrees.
		  '
		  ' - Parameter angle: The angle in degrees.
		  '
		  ' - Returns :A new XGERotation for the passed angle.
		  ///
		  
		  Return New XGERotation(XGEMaths.ToRadians(angle))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 416C7465726E61746976652077617920746F206372656174652061206E657720526F746174696F6E2066726F6D206120676976656E20616E676C652C20696E2072616469616E732E
		Shared Function Of_(angle As Double) As XGERotation
		  ///
		  ' Alternative way to create a new XGERotation from a given angle, in radians.
		  '
		  ' - Parameter angle: The angle in radians.
		  '
		  ' - Returns: A new XGERotation for the given angle.
		  ///
		  
		  Return New XGERotation(angle)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 537461746963206D6574686F6420746F20637265617465206120526F746174696F6E2066726F6D20612070616972206F662076616C7565732074686174206C6965206F6E2074686520756E697420636972636C652E205468726F777320496E76616C6964417267756D656E74457863657074696F6E2E
		Shared Function Of_(cost As Double, sint As Double) As XGERotation
		  ///
		  ' Static method to create a XGERotation from a pair of values that lie on the unit circle.
		  ' That is a pair of values (x, y) such that `x = cos(Θ), y = sin(Θ)` for some value Θ.
		  ' Self method is provided for the case where the cos and sin values are already computed and
		  ' the overhead can be avoided.
		  ' Self method will check whether those values are indeed on the unit circle and 
		  ' otherwise throw an InvalidArgumentException.
		  '
		  ' - Parameter cost: The x value = cos(Θ).
		  ' - Parameter sint: The y value = sin(Θ).
		  '
		  ' - Raises: InvalidArgumentExcpetion if (cost, sint) is not on the unit circle.
		  '
		  ' - Returns: A new XGERotation defined by (cost, sint).
		  ///
		  
		  Var magnitude As Double = cost * cost + sint * sint
		  
		  If Abs(magnitude - 1) > XGEMaths.Epsilon Then
		    Raise New InvalidArgumentException(XGEMessages.GEOMETRY_ROTATION_INVALID_POINT)
		  End If
		  
		  Return New XGERotation(cost, sint)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720526F746174696F6E20726570726573656E74696E67207468652073616D6520726F746174696F6E2061732061205472616E73666F726D206F626A6563742E
		Shared Function Of_(transform As XGETransform) As XGERotation
		  ///
		  ' Creates a new XGERotation representing the same rotation as a Transform object.
		  '
		  ' - Parameter transform: The Transform.
		  '
		  ' - Returns: A new XGERotation.
		  //
		  
		  // The cos and sin values are already computed internally in Transform.
		  Return New XGERotation(transform.Cost, transform.Sint)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 537461746963206D6574686F6420746F20637265617465206120526F746174696F6E206F626A6563742066726F6D2074686520646972656374696F6E206F66206120676976656E20766563746F722E
		Shared Function Of_(direction As XGEVEctor2) As XGERotation
		  ///
		  ' Static method to create a XGERotation object from the direction of a given vector.
		  '
		  ' - Parameter direction: The vector describing a direction.
		  '
		  ' - Returns: A new XGERotation with the same direction.
		  ///
		  
		  // Normalise the vector.
		  Var magnitude As Double = Sqrt(direction.X * direction.X + direction.Y * direction.Y)
		  
		  If magnitude <= XGEMaths.Epsilon Then
		    // The zero vector has no direction, return the Identity rotation.
		    Return New XGERotation
		  End If
		  
		  // The rotation is the normalized vector.
		  Return New XGERotation(direction.X / magnitude, direction.Y / magnitude)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 2720526F7461746573207468697320526F746174696F6E2062792074686520676976656E20616E676C652028696E2072616469616E732920616E642072657475726E73207468697320526F746174696F6E2E
		Function Rotate(angle As Double) As XGERotation
		  ///
		  ' Rotates this XGERotation by the given angle (in radians) and returns this XGERotation.
		  '
		  ' - Parameter angle: The rotation in radians.
		  '
		  ' - Returns: This XGERotation.
		  ///
		  
		  Return Self.Rotate(Cos(angle), Sin(angle))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7465726E616C206D6574686F64207468617420726F7461746573207468697320526F746174696F6E20627920616E20616E676C6520CE9820616E642072657475726E73207468697320526F746174696F6E2E
		Function Rotate(c As Double, s As Double) As XGERotation
		  ///
		  ' Internal method that rotates this XGERotation by an angle Θ and returns this XGERotation.
		  '
		  ' - Parameter c: Cos(Θ).
		  ' - Parameter s: sin(Θ).
		  '
		  ' - Returns: Self XGERotation.
		  ///
		  
		  Var cost As Double = Self.Cost
		  Var sint As Double = Self.Sint
		  
		  Self.Cost = cost * c - sint * s
		  Self.Sint = cost * s + sint * c
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320526F746174696F6E2062792074686520676976656E20526F746174696F6E20616E642072657475726E73207468697320526F746174696F6E2E
		Function Rotate(r As XGERotation) As XGERotation
		  ///
		  ' Rotates this XGERotation by the given XGERotation and returns this XGERotation.
		  '
		  ' - Parameter r: The XGERotation to rotate by.
		  '
		  ' - Returns: This XGERotation.
		  ///
		  
		  Return Self.Rotate(r.Cost, r.Sint)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320526F746174696F6E20313335206465677265657320616E642072657475726E73207468697320526F746174696F6E2E
		Function Rotate135() As XGERotation
		  ///
		  ' Rotates Self XGERotation 135 degrees and returns Self XGERotation.
		  '
		  ' - Returns: Self XGERotation.
		  ///
		  
		  // Rotate by 90 and then another 45.
		  Return Self.Rotate45Helper(-Self.Sint, Self.Cost)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320526F746174696F6E20313830206465677265657320616E642072657475726E73207468697320526F746174696F6E2E
		Function Rotate180() As XGERotation
		  ///
		  ' Rotates Self XGERotation 180 degrees and returns Self XGERotation.
		  '
		  ' - Returns: Self XGERotation.
		  ///
		  
		  Self.Cost = -Self.Cost
		  Self.Sint = -Self.Sint
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320526F746174696F6E20323235206465677265657320616E642072657475726E73207468697320526F746174696F6E2E
		Function Rotate225() As XGERotation
		  ///
		  ' Rotates Self XGERotation 225 degrees and returns Self XGERotation.
		  '
		  ' - Returns: Self XGERotation.
		  ///
		  
		  // Rotate by 180 and another 45 degrees.
		  Return Self.Rotate45Helper(-Self.Cost, -Self.Sint)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320526F746174696F6E20323730206465677265657320616E642072657475726E73207468697320526F746174696F6E2E
		Function Rotate270() As XGERotation
		  ///
		  ' Rotates Self XGERotation 270 degrees and returns Self XGERotation.
		  '
		  ' - Returns: Self XGERotation.
		  ///
		  
		  Var temp As Double = Self.Cost
		  Self.Cost = Self.Sint
		  Self.Sint = -temp
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320526F746174696F6E20333135206465677265657320616E642072657475726E73207468697320526F746174696F6E2E
		Function Rotate315() As XGERotation
		  ///
		  ' Rotates Self XGERotation 315 degrees and returns Self XGERotation.
		  '
		  ' - Returns: Self XGERotation.
		  ///
		  
		  // Rotate by 270 and then another 45.
		  Return Self.Rotate45Helper(Self.Sint, -Self.Cost)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320526F746174696F6E203435206465677265657320616E642072657475726E73207468697320526F746174696F6E2E
		Function Rotate45() As XGERotation
		  ///
		  ' Rotates Self XGERotation 45 degrees and returns Self XGERotation.
		  '
		  ' - Returns: Self XGERotation after rotation.
		  ///
		  
		  Return Self.Rotate45Helper(Self.Cost, Self.Sint)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 496E7465726E616C2068656C706572206D6574686F6420746F20706572666F726D20726F746174696F6E7320636F6E73697374696E67206F6620612034352064656772656520616E676C652E2052657475726E73207468697320526F746174696F6E206166746572206D6F64696669636174696F6E2E
		Protected Function Rotate45Helper(cost As Double, sint As Double) As XGERotation
		  ///
		  ' Internal helper method to perform rotations consisting of a 45 degree angle.
		  '
		  ' - Parameter cost: The cos of the angle.
		  ' - Parameter sint: The sin of the angle.
		  '
		  ' - Returns: Self XGERotation after being set to (cost, sint) and rotated 45 degrees.
		  ///
		  
		  Self.Cost = SQRT_2_INV * (cost - sint)
		  Self.Sint = SQRT_2_INV * (cost + sint)
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526F7461746573207468697320526F746174696F6E203930206465677265657320616E642072657475726E73207468697320526F746174696F6E2E
		Function Rotate90() As XGERotation
		  ///
		  ' Rotates Self XGERotation 90 degrees and returns Self XGERotation.
		  ' 
		  ' - Returns: Self XGERotation.
		  ///
		  
		  Var temp As Double = Self.Cost
		  Self.Cost = -Self.Sint
		  Self.Sint = temp
		  
		  Return Self
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468697320526F746174696F6E20746F2074686520676976656E20616E676C652028696E2072616469616E732920616E642072657475726E73207468697320526F746174696F6E2E
		Function Set(angle As Double) As XGERotation
		  ///
		  ' Sets Self XGERotation to the given angle.
		  '
		  ' - Parameter angle: The angle in radians.
		  '
		  ' - Returns: Self XGERotation.
		  ///
		  
		  Self.Cost = Cos(angle)
		  Self.Sint = Sin(angle)
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468697320526F746174696F6E20746F2074686520676976656E20526F746174696F6E20616E642072657475726E73207468697320526F746174696F6E2E
		Function Set(r As XGERotation) As XGERotation
		  ///
		  ' Sets Self XGERotation to the given XGERotation.
		  '
		  ' - Parameter r: The XGERotation to set Self XGERotation} to.
		  '
		  ' - Returns: Self XGERotation.
		  ///
		  
		  Self.Cost = r.Cost
		  Self.Sint = r.Sint
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468697320526F746174696F6E20746F20626520746865206964656E7469747920616E642072657475726E73207468697320526F746174696F6E2E
		Function SetIdentity() As XGERotation
		  ///
		  ' Sets Self XGERotation to be the identity.
		  '
		  ' - Returns: Self XGERotation.
		  ///
		  
		  Self.Cost = 1.0
		  Self.Sint = 0.0
		  
		  Return Self
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520616E676C6520696E206465677265657320666F72207468697320526F746174696F6E2E
		Function ToDegrees() As Double
		  ///
		  ' Returns the angle in degrees for Self XGERotation.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Return XGEMaths.ToDegrees(ToRadians)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520616E676C6520696E2072616469616E7320666F72207468697320526F746174696F6E2E
		Function ToRadians() As Double
		  ///
		  ' Since we have the cos and sin values computed we can use
		  ' the ACos function which is much faster than ATan2.
		  '
		  ' We can find the angle in the range [0, π] with ACos
		  ' and then we'll use the sign of the sin value to find in which
		  ' semicircle we are and extend the result to [-π, π].
		  '
		  ' Apart from being quite faster Self is also more precise.
		  '
		  ' - Returns: Double.
		  ///
		  
		  Var acos As Double = ACos(Self.Cost)
		  Var angle As Double = If(Self.Sint >= 0, acos, -acos)
		  
		  Return angle
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120537472696E6720726570726573656E746174696F6E206F66207468697320526F746174696F6E20696E2074686520666F726D61743A2022526F746174696F6E28636F73742C2073696E7429222E
		Function ToString() As String
		  ///
		  ' Returns a String representation of Self XGERotation in the 
		  ' format: "XGERotation(cost, sint)".
		  ///
		  
		  Return "XGERotation(" + Self.Cost.ToString + ", " + _
		  Self.Sint.ToString + ")"
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468697320526F746174696F6E2061732061206E657720756E6974206C656E67746820646972656374696F6E20766563746F722E
		Function ToVector() As XGEVEctor2
		  ///
		  ' Returns Self XGERotation as a unit length direction vector.
		  '
		  ' - Returns: A New XGEVector2.
		  ///
		  
		  Return New XGEVector2(Self.Cost, Self.Sint)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468697320526F746174696F6E2061732061206E657720646972656374696F6E20766563746F7220776974682074686520676976656E206D61676E69747564652E
		Function ToVector(magnitude As Double) As XGEVEctor2
		  ///
		  ' Returns Self XGERotation as a new direction vector with the given magnitude.
		  '
		  ' - Parameter magnitude: The magnitude.
		  '
		  ' - Returns: A New XGEVector2.
		  ///
		  
		  Return New XGEVector2(Self.Cost * magnitude, Self.Sint * magnitude)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720526F746174696F6E206F66203020646567726565732E
		Shared Function XGERotation0() As XGERotation
		  ///
		  ' Creates a new XGERotation of 0 degrees.
		  '
		  ' - Returns: A new XGERotation.
		  ///
		  
		  Return New XGERotation
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720526F746174696F6E206F662031333520646567726565732E
		Shared Function XGERotation135() As XGERotation
		  ///
		  ' Creates a new XGERotation of 135 degrees.
		  '
		  ' - Returns: A new XGERotation.
		  ///
		  
		  Return New XGERotation(-SQRT_2_INV, SQRT_2_INV)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720526F746174696F6E206F662031383020646567726565732E
		Shared Function XGERotation180() As XGERotation
		  ///
		  ' Creates a new XGERotation of 180 degrees.
		  '
		  ' - Returns: A new XGERotation.
		  ///
		  
		  Return New XGERotation(-1.0, 0.0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720526F746174696F6E206F662032323520646567726565732E
		Shared Function XGERotation225() As XGERotation
		  ///
		  ' Creates a new XGERotation of 225 degrees.
		  '
		  ' - Returns: A new XGERotation.
		  ///
		  
		  Return New XGERotation(-SQRT_2_INV, -SQRT_2_INV)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720526F746174696F6E206F662032373020646567726565732E
		Shared Function XGERotation270() As XGERotation
		  ///
		  ' Creates a new XGERotation of 270 degrees.
		  '
		  ' - Returns: A new XGERotation.
		  ///
		  
		  Return New XGERotation(0.0, -1.0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function XGERotation315() As XGERotation
		  ///
		  '  Creates a new XGERotation of 315 degrees.
		  '
		  ' - Returns: A new XGERotation.
		  ///
		  
		  Return New XGERotation(SQRT_2_INV, -SQRT_2_INV)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720526F746174696F6E206F6620343520646567726565732E
		Shared Function XGERotation45() As XGERotation
		  ///
		  ' Creates a new XGERotation of 45 degrees.
		  '
		  ' - Returns: A new XGERotation.
		  ///
		  
		  Return New XGERotation(SQRT_2_INV, SQRT_2_INV)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720526F746174696F6E206F6620393020646567726565732E
		Shared Function XGERotation90() As XGERotation
		  ///
		  ' Creates a new XGERotation of 90 degrees.
		  '
		  ' - Returns: A new XGERotation.
		  ///
		  
		  Return New XGERotation(0.0, 1.0)
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0, Description = 54686520636F73696E65206F662074686520616E676C6520646573637269626564206279207468697320526F746174696F6E2E
		Cost As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652073696E65206F662074686520616E676C6520646573637269626564206279207468697320526F746174696F6E2E
		Sint As Double
	#tag EndProperty


	#tag Constant, Name = SQRT_2_INV, Type = Double, Dynamic = False, Default = \"0.7071067811865475", Scope = Private
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
		#tag ViewProperty
			Name="Cost"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Sint"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
