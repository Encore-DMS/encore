classdef ResourceAnnotatableEntity < encore.core.AnnotatableEntity
    
    properties
    end
    
    methods
        
        function obj = ResourceAnnotatableEntity(cobj)
            obj@encore.core.AnnotatableEntity(cobj);
        end
        
        function r = addResource(obj, name, data, uri)
            if nargin < 4
                uri = 'com.mathworks.byte-stream';
                data = getByteStreamFromArray(data);
            end
            cr = obj.tryCoreWithReturn(@()obj.cobj.addResource(name, data, uri));
            r = encore.core.Resource(cr);
        end
        
        function removeResource(obj, name)
            obj.tryCore(@()obj.cobj.removeResource(name));
        end
        
        function r = getResources(obj)
            r = obj.cellArrayFromStream(obj.cobj.getResources(), @encore.core.Resource);
        end
        
        function r = getResource(obj, name)
            cr = obj.tryCoreWithReturn(@()obj.cobj.getResource(name));
            r = encore.core.Resource(cr);
        end
        
        function n = getResourceNames(obj)
            n = obj.cellArrayFromStream(obj.cobj.getResourceNames(), @char);
        end
        
    end
    
end

