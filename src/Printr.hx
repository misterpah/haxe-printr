class Printr
	{
	static var a:String;
	static public function print_r(object:Dynamic,display:Bool = true)
		{
		var output:String = "";
		var obj_class = Type.getClass(object);
		var obj_type = Type.typeof(object);
		var obj_name = Type.getClassName(Type.getClass(object));
		
		if (Std.is(object,Int))
			{
			output += "(Int) " + object;
			}
		else if(Std.is(object,String))
			{
			output +="("+obj_name+") " + object;
			}
		else if(Std.is(object,Float))
			{
			output +="("+obj_name+") " + object;
			}
		else if(Std.is(object,Array))
			{
			// array is complex. need a function
			output += display_array(object);
			}
		else if (obj_type == TFunction)
			{
			output += "(Function) " + object;
			}
		else if (obj_type == TObject)
			{
			output += "(Object)\n\t" + Type.getClassName(object);
			output += "\n\t => (Function) "+Type.getClassFields(object);
			}					
		
		if (display == true)
			{
			trace(output);
			}
		return output;
		}
		
	private static function display_array(object:Dynamic,display_type:Bool=true,level:Int=1)
		{
		var obj_class = Type.getClass(object);
		var obj_type = Type.typeof(object);
		var obj_name = Type.getClassName(Type.getClass(object));
		
		var output = "";
		
		var prefix = generate_tab(level);
		if (display_type == true)
			{
			output +="("+obj_name+")\n" +object;
			output +="\n"+prefix+"{";
			}
		for (each in 0...object.length)
			{
			var each_obj_name = Type.getClassName(Type.getClass(object[each]));
			if (each_obj_name != null)
				{
				output += "\n"+prefix+"["+each+"] => ("+ each_obj_name +") "+object[each];
				}
			else
				{
				output += "\n"+prefix+"["+each+"] => "+ print_r(object[each],false);
				}
			
			if ( each_obj_name == "Array")
				{
				level += 1;
				output += "\n"+generate_tab(level)+"{"+prefix + display_array(object[each],false,level);
				output += "\n"+generate_tab(level)+"}";
				}			
			
			}
		if (display_type == true)
			{
			output +="\n"+prefix+"}";
			}
		return output;
		}
	
	private static function	generate_tab(num:Int)
		{
		var ret = "";
		for (each in 0...num)
			{
			ret += "\t";
			}
		return ret;
		}
		
		
	}
