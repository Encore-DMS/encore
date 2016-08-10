classdef DataSource < encore.core.CoreObject
    
    properties (SetAccess = private)
        url
    end
    
    methods
        
        function obj = DataSource(url)
            % FIXME: Fake cobj
            cobj.getURL = @()url;
            
            obj@encore.core.CoreObject(cobj);
        end
        
        function u = get.url(obj)
            u = char(obj.cobj.getURL());
        end
        
    end
    
end

