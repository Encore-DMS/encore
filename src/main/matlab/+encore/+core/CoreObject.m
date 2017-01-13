classdef (Abstract) CoreObject < handle
    
    properties (SetAccess = private, Hidden)
        cobj
    end
    
    methods (Access = protected)
        
        function obj = CoreObject(cobj)
            obj.cobj = cobj;
        end
        
        function tryCore(obj, call) %#ok<INUSL>
            try
                call();
            catch x
                rethrow(x);
            end
        end
        
        function r = tryCoreWithReturn(obj, call) %#ok<INUSL>
            try
                r = call();
            catch x
                rethrow(x);
            end
        end
        
    end
    
end

