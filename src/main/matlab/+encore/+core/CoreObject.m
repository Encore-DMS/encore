classdef (Abstract) CoreObject < handle
    
    properties (SetAccess = private, Hidden)
        cobj
    end
    
    methods
        
        function obj = CoreObject(cobj)
            obj.cobj = cobj;
        end
        
    end
    
end

