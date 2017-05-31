classdef Note < encore.core.Entity
    
    properties (SetAccess = private)
        time
        text
    end
    
    methods
        
        function obj = Note(cobj)
            obj@encore.core.Entity(cobj);
        end
        
        function t = get.time(obj)
            t = obj.datetimeFromZonedDateTime(obj.cobj.getTime());
        end
        
        function t = get.text(obj)
            t = char(obj.cobj.getText());
        end
        
    end
    
end

