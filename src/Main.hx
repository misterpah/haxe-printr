import Printr.*;
import Math;
class Main {
    static var iamInt:Int;
    static function main() {
    	iamInt = 2;
        var iamStr = "hello";
        var iamArray = ['test','array'];
        var iamArray2:Dynamic = ['test',['array','in',['indent',['indent']],1]];
       	print_r(iamInt);
        print_r(iamStr);
        print_r(iamArray);
        print_r(iamArray2);
        print_r(test);
        print_r(Printr);
        //trace(Type.typeof(test));
        //trace(Type.getInstanceFields(test));
    }
    
    static function test(a:Int,b:String)
    	{
		    	
		}
}
