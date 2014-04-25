class Printr
	{
	var q:Int;
	
	static public function print_r(object:Dynamic)
		{
		var output:String = "";
		var obj_class = Type.getClass(object);
		var obj_type = Type.typeof(object);
		var obj_name = Type.getClassName(Type.getClass(object));
		
		if (Std.is(object,Int))
			{
			trace("(Int) " + object);
			}
		else if(Std.is(object,String))
			{
			trace("("+obj_name+") " + object);
			}
		else if(Std.is(object,Float))
			{
			trace("("+obj_name+") " + object);
			}
		else if(Std.is(object,Array))
			{
			trace("("+obj_name+") = " +object);
			trace("   {");
			for (each in 0...object.length)
				{
				var each_obj_name = Type.getClassName(Type.getClass(object[each]));
				if ( each_obj_name == "Array")
					{
					print_r(object[each]);
					}
				else
					{
					if (each_obj_name == null)
						{
						trace( "    ("+ Type.typeof(object[each]) +") "+object[each]);
						}
					else
						{
						trace( "    ("+ each_obj_name +") "+object[each]);
						}
					}
				}
			trace("   }");
			}
		else if (obj_type == TFunction)
			{
			trace("(Function) " + object);
			}
		else if (obj_type == TObject)
			{
			trace("(Object) " + Type.getClassName(object));
			trace(" --> (internal Functions) "+Type.getClassFields(object));
			}					
		}
		
		
	}
